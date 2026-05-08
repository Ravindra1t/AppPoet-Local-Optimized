.class public Lcom/androidemu/gba/EmulatorActivity2;
.super Landroid/app/Activity;
.source "EmulatorActivity2.java"

# interfaces
.implements Lcom/androidemu/Emulator$FrameUpdateListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/androidemu/EmulatorView2$OnTrackballListener;
.implements Lcom/androidemu/Emulator$OnFrameDrawnListener;
.implements Lcom/androidemu/gba/input/GameKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;
    }
.end annotation


# static fields
.field private static final DIALOG_QUIT_GAME:I = 0x1

.field private static final DIALOG_REPLACE_GAME:I = 0x2

.field private static final DIALOG_WIFI_CONNECT:I = 0x3

.field private static final GAMEPAD_DIRECTION:I = 0xf0

.field private static final GAMEPAD_LEFT_RIGHT:I = 0x30

.field private static final GAMEPAD_UP_DOWN:I = 0xc0

.field private static final LOG_TAG:Ljava/lang/String; = "SNesoid"

.field private static final MESSAGE_SYNC_CLIENT:I = 0x3e8

.field private static final NETPLAY_TCP_PORT:I = 0x14f9

.field private static final REQUEST_BT_DEVICE:I = 0x5

.field private static final REQUEST_ENABLE_BT_CLIENT:I = 0x4

.field private static final REQUEST_ENABLE_BT_SERVER:I = 0x3

.field private static final REQUEST_LOAD_STATE:I = 0x1

.field private static final REQUEST_SAVE_STATE:I = 0x2

.field private static final SENSOR_MAP_DPAD:[I

.field private static final SENSOR_MAP_TRIGGERS:[I


# instance fields
.field private autoSyncClientInterval:I

.field private emulator:Lcom/androidemu/Emulator;

.field private emulatorView:Lcom/androidemu/EmulatorView2;

.field private fastForwardKey:I

.field private fastForwardSpeed:F

.field private flipScreen:Z

.field private inFastForward:Z

.field private keyboard:Lcom/androidemu/gba/input/Keyboard;

.field private lightGunEnabled:Z

.field private mediaScanner:Lcom/androidemu/gba/MediaScanner;

.field private netPlayHandler:Landroid/os/Handler;

.field private netPlayService:Lcom/androidemu/gba/NetPlayService;

.field private newIntent:Landroid/content/Intent;

.field path:Ljava/lang/String;

.field private quickLoadKey:I

.field private quickSaveKey:I

.field private screenshotKey:I

.field private sensor:Lcom/androidemu/gba/input/SensorKeypad;

.field private sensorMappings:[I

.field private sharedPrefs:Landroid/content/SharedPreferences;

.field private surfaceHeight:I

.field private surfaceRegion:Landroid/graphics/Rect;

.field private surfaceWidth:I

.field private trackballSensitivity:I

.field private vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

.field private waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v1, 0x4

    .line 846
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androidemu/gba/EmulatorActivity2;->SENSOR_MAP_DPAD:[I

    .line 853
    new-array v0, v1, [I

    const/4 v1, 0x0

    .line 854
    const/16 v2, 0x200

    aput v2, v0, v1

    const/4 v1, 0x1

    .line 855
    const/16 v2, 0x100

    aput v2, v0, v1

    .line 853
    sput-object v0, Lcom/androidemu/gba/EmulatorActivity2;->SENSOR_MAP_TRIGGERS:[I

    .line 67
    return-void

    .line 846
    nop

    :array_0
    .array-data 4
        0x20
        0x10
        0x40
        0x80
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 67
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/lsh"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->path:Ljava/lang/String;

    .line 100
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    .line 1010
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity2$1;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity2$1;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    .line 67
    return-void
.end method

.method static synthetic access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    return-object v0
.end method

.method static synthetic access$1(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1224
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->applyNetplaySettings()V

    return-void
.end method

.method static synthetic access$10(Lcom/androidemu/gba/EmulatorActivity2;Lcom/androidemu/gba/NetPlayService;)V
    .locals 0

    .prologue
    .line 123
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    return-void
.end method

.method static synthetic access$11(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1378
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->quickSave()V

    return-void
.end method

.method static synthetic access$12(Lcom/androidemu/gba/EmulatorActivity2;)Landroid/content/Intent;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->newIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$13(Lcom/androidemu/gba/EmulatorActivity2;)Z
    .locals 1

    .prologue
    .line 972
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->loadROM()Z

    move-result v0

    return v0
.end method

.method static synthetic access$14(Lcom/androidemu/gba/EmulatorActivity2;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2;->newIntent:Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$15(Lcom/androidemu/gba/EmulatorActivity2;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1124
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/EmulatorActivity2;->onWifiConnect(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$16(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1082
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->ensureDiscoverable()V

    return-void
.end method

.method static synthetic access$2(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1189
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onNetPlaySync()V

    return-void
.end method

.method static synthetic access$3(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    return-object v0
.end method

.method static synthetic access$4(Lcom/androidemu/gba/EmulatorActivity2;Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    return-void
.end method

.method static synthetic access$5(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1198
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onDisconnect()V

    return-void
.end method

.method static synthetic access$6(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/Emulator;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    return-object v0
.end method

.method static synthetic access$7(Lcom/androidemu/gba/EmulatorActivity2;)Ljava/io/File;
    .locals 1

    .prologue
    .line 1295
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getTempStateFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$8(Ljava/io/File;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1312
    invoke-static {p0, p1}, Lcom/androidemu/gba/EmulatorActivity2;->writeFile(Ljava/io/File;[B)V

    return-void
.end method

.method static synthetic access$9(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1236
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->startAutoSyncClient()V

    return-void
.end method

.method private applyNetplaySettings()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1225
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "enableGamepad2"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 1226
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "enableCheats"

    invoke-virtual {v0, v1, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 1227
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "maxFramesAhead"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1228
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "autoSyncClient"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1230
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    if-eqz v0, :cond_0

    .line 1231
    iput-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    .line 1232
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->setGameSpeed(F)V

    .line 1234
    :cond_0
    return-void
.end method

.method private checkBluetoothEnabled(I)Z
    .locals 2
    .param p1, "request"    # I

    .prologue
    .line 797
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 798
    const/4 v1, 0x1

    .line 802
    :goto_0
    return v1

    .line 800
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 801
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0, p1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivityForResult(Landroid/content/Intent;I)V

    .line 802
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private copyAsset(Ljava/io/File;)Z
    .locals 10
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1421
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1449
    :cond_0
    :goto_0
    return v6

    .line 1424
    :cond_1
    const/4 v2, 0x0

    .line 1425
    .local v2, "in":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 1428
    .local v4, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 1429
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1431
    .end local v4    # "out":Ljava/io/OutputStream;
    .local v5, "out":Ljava/io/OutputStream;
    const/16 v8, 0x2000

    :try_start_1
    new-array v0, v8, [B

    .line 1433
    .local v0, "buf":[B
    :goto_1
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    .local v3, "len":I
    if-gtz v3, :cond_3

    .line 1442
    if-eqz v5, :cond_2

    .line 1443
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 1444
    :cond_2
    if-eqz v2, :cond_0

    .line 1445
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1446
    :catch_0
    move-exception v7

    goto :goto_0

    .line 1434
    :cond_3
    const/4 v8, 0x0

    :try_start_3
    invoke-virtual {v5, v0, v8, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 1436
    .end local v0    # "buf":[B
    .end local v3    # "len":I
    :catch_1
    move-exception v1

    move-object v4, v5

    .line 1437
    .end local v5    # "out":Ljava/io/OutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "out":Ljava/io/OutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1442
    if-eqz v4, :cond_4

    .line 1443
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 1444
    :cond_4
    if-eqz v2, :cond_5

    .line 1445
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_5
    :goto_3
    move v6, v7

    .line 1438
    goto :goto_0

    .line 1440
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 1442
    :goto_4
    if-eqz v4, :cond_6

    .line 1443
    :try_start_6
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 1444
    :cond_6
    if-eqz v2, :cond_7

    .line 1445
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 1448
    :cond_7
    :goto_5
    throw v6

    .line 1446
    :catch_2
    move-exception v7

    goto :goto_5

    .line 1440
    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/OutputStream;
    goto :goto_4

    .line 1446
    .restart local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v6

    goto :goto_3

    .line 1436
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v1

    goto :goto_2
.end method

.method private createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "message"    # Ljava/lang/CharSequence;

    .prologue
    .line 1000
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    if-eqz v0, :cond_0

    .line 1001
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    invoke-virtual {v0}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->dismiss()V

    .line 1002
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    .line 1004
    :cond_0
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    .line 1005
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    invoke-virtual {v0, p1}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1006
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    invoke-virtual {v0, p2}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1007
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    return-object v0
.end method

.method private createQuitGameDialog()Landroid/app/Dialog;
    .locals 3

    .prologue
    .line 894
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity2$2;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity2$2;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 907
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 908
    const v2, 0x7f060013

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 909
    const v2, 0x7f05000b

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 910
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 907
    return-object v1
.end method

.method private createReplaceGameDialog()Landroid/app/Dialog;
    .locals 3

    .prologue
    .line 915
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity2$3;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity2$3;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 925
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 926
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 927
    const v2, 0x7f060011

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 928
    const v2, 0x7f060012

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 929
    const v2, 0x1040013

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 930
    const v2, 0x1040009

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 931
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 925
    return-object v1
.end method

.method private createWifiConnectDialog()Landroid/app/Dialog;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 936
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity2$4;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity2$4;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 947
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 948
    const v2, 0x7f06001e

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 949
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 950
    const v3, 0x7f03000d

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 949
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 951
    const v2, 0x104000a

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 952
    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 953
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 947
    return-object v1
.end method

.method private ensureDiscoverable()V
    .locals 2

    .prologue
    .line 1083
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothDiscoverable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1084
    new-instance v0, Landroid/content/Intent;

    .line 1085
    const-string v1, "android.bluetooth.adapter.action.REQUEST_DISCOVERABLE"

    .line 1084
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1086
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->startActivity(Landroid/content/Intent;)V

    .line 1088
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private flipGameKeys(I)I
    .locals 2
    .param p1, "keys"    # I

    .prologue
    .line 815
    and-int/lit16 v0, p1, -0xf1

    .line 816
    .local v0, "newKeys":I
    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_0

    .line 817
    or-int/lit8 v0, v0, 0x10

    .line 818
    :cond_0
    and-int/lit8 v1, p1, 0x10

    if-eqz v1, :cond_1

    .line 819
    or-int/lit8 v0, v0, 0x20

    .line 820
    :cond_1
    and-int/lit8 v1, p1, 0x40

    if-eqz v1, :cond_2

    .line 821
    or-int/lit16 v0, v0, 0x80

    .line 822
    :cond_2
    and-int/lit16 v1, p1, 0x80

    if-eqz v1, :cond_3

    .line 823
    or-int/lit8 v0, v0, 0x40

    .line 825
    :cond_3
    return v0
.end method

.method private getEmulatorEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 2
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 869
    const-string v0, "useCCore"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "snes_comp"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "snes"

    goto :goto_0
.end method

.method private getQuickSlotFileName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1375
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getROMFilePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androidemu/gba/StateSlotsActivity;->getSlotFileName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getROMFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 957
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getScalingMode(Ljava/lang/String;)I
    .locals 1
    .param p0, "mode"    # Ljava/lang/String;

    .prologue
    .line 829
    const-string v0, "original"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 830
    const/4 v0, 0x0

    .line 835
    :goto_0
    return v0

    .line 831
    :cond_0
    const-string v0, "2x"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 832
    const/4 v0, 0x1

    goto :goto_0

    .line 833
    :cond_1
    const-string v0, "proportional"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 834
    const/4 v0, 0x2

    goto :goto_0

    .line 835
    :cond_2
    const/4 v0, 0x3

    goto :goto_0
.end method

.method private static getScreenOrientation(Ljava/lang/String;)I
    .locals 1
    .param p0, "orientation"    # Ljava/lang/String;

    .prologue
    .line 839
    const-string v0, "landscape"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 840
    const/4 v0, 0x0

    .line 843
    :goto_0
    return v0

    .line 841
    :cond_0
    const-string v0, "portrait"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 842
    const/4 v0, 0x1

    goto :goto_0

    .line 843
    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private getScreenshot()Landroid/graphics/Bitmap;
    .locals 5

    .prologue
    .line 1363
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4}, Lcom/androidemu/Emulator;->getVideoWidth()I

    move-result v3

    .line 1364
    .local v3, "w":I
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4}, Lcom/androidemu/Emulator;->getVideoHeight()I

    move-result v2

    .line 1366
    .local v2, "h":I
    mul-int v4, v3, v2

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1369
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1370
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 1371
    return-object v0
.end method

.method private static getSensorMappings(Ljava/lang/String;)[I
    .locals 1
    .param p0, "as"    # Ljava/lang/String;

    .prologue
    .line 861
    const-string v0, "dpad"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 862
    sget-object v0, Lcom/androidemu/gba/EmulatorActivity2;->SENSOR_MAP_DPAD:[I

    .line 865
    :goto_0
    return-object v0

    .line 863
    :cond_0
    const-string v0, "triggers"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 864
    sget-object v0, Lcom/androidemu/gba/EmulatorActivity2;->SENSOR_MAP_TRIGGERS:[I

    goto :goto_0

    .line 865
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTempStateFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 1296
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "saved_state"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private isROMSupported(Ljava/lang/String;)Z
    .locals 6
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 961
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 963
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 964
    const/high16 v4, 0x7f050000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 965
    .local v1, "filters":[Ljava/lang/String;
    array-length v4, v1

    move v3, v2

    :goto_0
    if-lt v3, v4, :cond_0

    .line 969
    :goto_1
    return v2

    .line 965
    :cond_0
    aget-object v0, v1, v3

    .line 966
    .local v0, "f":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 967
    const/4 v2, 0x1

    goto :goto_1

    .line 965
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private loadBIOS(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 245
    if-eqz p1, :cond_0

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, p1}, Lcom/androidemu/Emulator;->loadBIOS(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 247
    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 248
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "bios"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 249
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 250
    const/4 v2, 0x1

    .line 256
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    return v2

    .line 253
    :cond_0
    move-object v0, p1

    .line 256
    .local v0, "biosFileName":Ljava/lang/String;
    goto :goto_0
.end method

.method private loadKeyBindings(Landroid/content/SharedPreferences;)V
    .locals 8
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 873
    sget-object v1, Lcom/androidemu/gba/EmulatorSettings;->gameKeys:[I

    .line 874
    .local v1, "gameKeys":[I
    invoke-static {p0}, Lcom/androidemu/gba/DefaultPreferences;->getKeyMappings(Landroid/content/Context;)[I

    move-result-object v0

    .line 875
    .local v0, "defaultKeys":[I
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v4}, Lcom/androidemu/gba/input/Keyboard;->clearKeyMap()V

    .line 877
    sget-object v2, Lcom/androidemu/gba/EmulatorSettings;->gameKeysPref:[Ljava/lang/String;

    .line 878
    .local v2, "gameKeysPref":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-lt v3, v4, :cond_0

    .line 882
    sget-object v2, Lcom/androidemu/gba/EmulatorSettings;->gameKeysPref2:[Ljava/lang/String;

    .line 883
    const/4 v3, 0x0

    :goto_1
    array-length v4, v2

    if-lt v3, v4, :cond_1

    .line 890
    return-void

    .line 879
    :cond_0
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    aget v5, v1, v3

    .line 880
    aget-object v6, v2, v3

    aget v7, v0, v3

    invoke-interface {p1, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 879
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 878
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 884
    :cond_1
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    aget v5, v1, v3

    shl-int/lit8 v5, v5, 0x10

    .line 885
    aget-object v6, v2, v3

    const/4 v7, 0x0

    invoke-interface {p1, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 884
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 883
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private loadROM()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 973
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getROMFilePath()Ljava/lang/String;

    move-result-object v0

    .line 975
    .local v0, "path":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->isROMSupported(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 976
    const v2, 0x7f060010

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 977
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 978
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->finish()V

    .line 995
    :goto_0
    return v1

    .line 981
    :cond_0
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, v0}, Lcom/androidemu/Emulator;->loadROM(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 982
    const v2, 0x7f06000f

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 983
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 984
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->finish()V

    goto :goto_0

    .line 988
    :cond_1
    iput-boolean v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    .line 990
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    .line 991
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3}, Lcom/androidemu/Emulator;->getVideoWidth()I

    move-result v3

    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4}, Lcom/androidemu/Emulator;->getVideoHeight()I

    move-result v4

    .line 990
    invoke-virtual {v1, v3, v4}, Lcom/androidemu/EmulatorView2;->setActualSize(II)V

    .line 993
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "quickLoadOnStart"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 994
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->quickLoad()V

    :cond_2
    move v1, v2

    .line 995
    goto :goto_0
.end method

.method private loadState(Ljava/lang/String;)V
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 1346
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1347
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1360
    :goto_0
    return-void

    .line 1350
    :cond_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 1354
    :try_start_0
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2, p1}, Lcom/androidemu/Emulator;->loadState(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1359
    :goto_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->resumeEmulator()V

    goto :goto_0

    .line 1356
    :catch_0
    move-exception v0

    .line 1357
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private static makeKeyStates(II)I
    .locals 2
    .param p0, "p1"    # I
    .param p1, "p2"    # I

    .prologue
    .line 514
    shl-int/lit8 v0, p1, 0x10

    const v1, 0xffff

    and-int/2addr v1, p0

    or-int/2addr v0, v1

    return v0
.end method

.method private onBluetoothClient()V
    .locals 2

    .prologue
    .line 1185
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/DeviceListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1186
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1187
    return-void
.end method

.method private onBluetoothConnect(Ljava/lang/String;)V
    .locals 4
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1174
    :try_start_0
    new-instance v1, Lcom/androidemu/gba/NetPlayService;

    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1175
    .local v1, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v1, p1}, Lcom/androidemu/gba/NetPlayService;->bluetoothConnect(Ljava/lang/String;)V

    .line 1176
    iput-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1180
    const v2, 0x7f060020

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1181
    const v3, 0x7f06002f

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity2;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1180
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity2;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v2

    .line 1181
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 1182
    .end local v1    # "np":Lcom/androidemu/gba/NetPlayService;
    :goto_0
    return-void

    .line 1177
    :catch_0
    move-exception v0

    .line 1178
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method private onBluetoothServer()V
    .locals 4

    .prologue
    .line 1154
    :try_start_0
    new-instance v1, Lcom/androidemu/gba/NetPlayService;

    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1155
    .local v1, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->bluetoothListen()V

    .line 1156
    iput-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1161
    const v2, 0x7f06001f

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1162
    const v3, 0x7f060030

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity2;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1161
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity2;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    .line 1163
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    .line 1164
    new-instance v3, Lcom/androidemu/gba/EmulatorActivity2$5;

    invoke-direct {v3, p0}, Lcom/androidemu/gba/EmulatorActivity2$5;-><init>(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 1163
    invoke-virtual {v2, v3}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V

    .line 1169
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->waitDialog:Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    invoke-virtual {v2}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->show()V

    .line 1170
    .end local v1    # "np":Lcom/androidemu/gba/NetPlayService;
    :goto_0
    return-void

    .line 1157
    :catch_0
    move-exception v0

    .line 1158
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method private onDisconnect()V
    .locals 2

    .prologue
    .line 1199
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-nez v0, :cond_0

    .line 1209
    :goto_0
    return-void

    .line 1202
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enableCheats"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1203
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enableGamepad2"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1204
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->stopAutoSyncClient()V

    .line 1207
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v0}, Lcom/androidemu/gba/NetPlayService;->disconnect()V

    .line 1208
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    goto :goto_0
.end method

.method private onFastForward()V
    .locals 1

    .prologue
    .line 1253
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v0, :cond_0

    .line 1258
    :goto_0
    return-void

    .line 1256
    :cond_0
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    .line 1257
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->fastForwardSpeed:F

    :goto_2
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->setGameSpeed(F)V

    goto :goto_0

    .line 1256
    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 1257
    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_2
.end method

.method private onLoadState()V
    .locals 2

    .prologue
    .line 1212
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/StateSlotsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1213
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1214
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1215
    return-void
.end method

.method private onNetPlaySync()V
    .locals 3

    .prologue
    .line 1190
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getTempStateFile()Ljava/io/File;

    move-result-object v0

    .line 1192
    .local v0, "file":Ljava/io/File;
    :try_start_0
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androidemu/Emulator;->saveState(Ljava/lang/String;)Z

    .line 1193
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity2;->readFile(Ljava/io/File;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androidemu/gba/NetPlayService;->sendSavedState([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1195
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1196
    return-void

    .line 1194
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private onSaveState()V
    .locals 3

    .prologue
    .line 1218
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/StateSlotsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1219
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1220
    const-string v1, "saveMode"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1221
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1222
    return-void
.end method

.method private onScreenshot()V
    .locals 9

    .prologue
    .line 1261
    new-instance v1, Ljava/io/File;

    const-string v6, "/sdcard/screenshot"

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1262
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v6

    if-nez v6, :cond_0

    .line 1263
    const-string v6, "SNesoid"

    const-string v7, "Could not create directory for screenshots"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1293
    :goto_0
    return-void

    .line 1266
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, ".png"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1267
    .local v3, "name":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1269
    .local v2, "file":Ljava/io/File;
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 1271
    const/4 v4, 0x0

    .line 1274
    .local v4, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1275
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .local v5, "out":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1276
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x64

    invoke-virtual {v0, v6, v7, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1277
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1279
    const v6, 0x7f060025

    .line 1280
    const/4 v7, 0x0

    .line 1279
    invoke-static {p0, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    .line 1280
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 1282
    iget-object v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    if-nez v6, :cond_1

    .line 1283
    new-instance v6, Lcom/androidemu/gba/MediaScanner;

    invoke-direct {v6, p0}, Lcom/androidemu/gba/MediaScanner;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    .line 1284
    :cond_1
    iget-object v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const-string v8, "image/png"

    invoke-virtual {v6, v7, v8}, Lcom/androidemu/gba/MediaScanner;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1287
    if-eqz v5, :cond_3

    .line 1288
    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v4, v5

    .line 1292
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :goto_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->resumeEmulator()V

    goto :goto_0

    .line 1286
    :catchall_0
    move-exception v6

    .line 1287
    :goto_2
    if-eqz v4, :cond_2

    .line 1288
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 1289
    :cond_2
    throw v6
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1290
    :catch_0
    move-exception v6

    goto :goto_1

    .end local v4    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 1286
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    goto :goto_2

    .end local v4    # "out":Ljava/io/FileOutputStream;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :cond_3
    move-object v4, v5

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method private onWifiConnect(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "portStr"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1125
    const/4 v0, 0x0

    .line 1127
    .local v0, "addr":Ljava/net/InetAddress;
    :try_start_0
    invoke-static {p1}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv4Address(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1128
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1130
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 1131
    const v2, 0x7f060033

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1132
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1150
    :goto_1
    return-void

    .line 1136
    :cond_1
    const/4 v1, 0x0

    .line 1138
    .local v1, "port":I
    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    .line 1140
    :goto_2
    if-gtz v1, :cond_2

    .line 1141
    const v2, 0x7f060034

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1142
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 1145
    :cond_2
    new-instance v2, Lcom/androidemu/gba/NetPlayService;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v2, v3}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    .line 1146
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v2, v0, v1}, Lcom/androidemu/gba/NetPlayService;->tcpConnect(Ljava/net/InetAddress;I)V

    .line 1148
    const v2, 0x7f06001e

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1149
    const v3, 0x7f06002f

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity2;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1148
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity2;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v2

    .line 1149
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    goto :goto_1

    .line 1139
    :catch_0
    move-exception v2

    goto :goto_2

    .line 1129
    .end local v1    # "port":I
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private onWifiServer()V
    .locals 13

    .prologue
    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v7, 0x0

    .line 1091
    const-string v8, "wifi"

    invoke-virtual {p0, v8}, Lcom/androidemu/gba/EmulatorActivity2;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 1092
    .local v6, "wifi":Landroid/net/wifi/WifiManager;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 1093
    .local v2, "info":Landroid/net/wifi/WifiInfo;
    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v3

    .line 1094
    .local v3, "ip":I
    :goto_1
    if-nez v3, :cond_2

    .line 1095
    const v8, 0x7f06002d

    invoke-static {p0, v8, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 1096
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 1122
    :goto_2
    return-void

    .line 1092
    .end local v2    # "info":Landroid/net/wifi/WifiInfo;
    .end local v3    # "ip":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .restart local v2    # "info":Landroid/net/wifi/WifiInfo;
    :cond_1
    move v3, v7

    .line 1093
    goto :goto_1

    .line 1100
    .restart local v3    # "ip":I
    :cond_2
    const/4 v0, 0x0

    .line 1102
    .local v0, "addr":Ljava/net/InetAddress;
    const/4 v8, 0x4

    :try_start_0
    new-array v8, v8, [B

    const/4 v9, 0x0

    .line 1103
    int-to-byte v10, v3

    aput-byte v10, v8, v9

    const/4 v9, 0x1

    .line 1104
    ushr-int/lit8 v10, v3, 0x8

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    const/4 v9, 0x2

    .line 1105
    ushr-int/lit8 v10, v3, 0x10

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    const/4 v9, 0x3

    .line 1106
    ushr-int/lit8 v10, v3, 0x18

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 1102
    invoke-static {v8}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1110
    :goto_3
    const/16 v5, 0x14f9

    .line 1112
    .local v5, "port":I
    :try_start_1
    new-instance v4, Lcom/androidemu/gba/NetPlayService;

    iget-object v8, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v4, v8}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1113
    .local v4, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v4, v0, v5}, Lcom/androidemu/gba/NetPlayService;->tcpListen(Ljava/net/InetAddress;I)I

    move-result v5

    .line 1114
    iput-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1119
    const v8, 0x7f06001d

    invoke-virtual {p0, v8}, Lcom/androidemu/gba/EmulatorActivity2;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 1120
    const v9, 0x7f06002e

    new-array v10, v11, [Ljava/lang/Object;

    .line 1121
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v10, v12

    .line 1120
    invoke-virtual {p0, v9, v10}, Lcom/androidemu/gba/EmulatorActivity2;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1119
    invoke-direct {p0, v8, v7}, Lcom/androidemu/gba/EmulatorActivity2;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v7

    .line 1121
    invoke-virtual {v7}, Landroid/app/Dialog;->show()V

    goto :goto_2

    .line 1115
    .end local v4    # "np":Lcom/androidemu/gba/NetPlayService;
    :catch_0
    move-exception v1

    .line 1116
    .local v1, "e":Ljava/io/IOException;
    goto :goto_2

    .line 1108
    .end local v1    # "e":Ljava/io/IOException;
    .end local v5    # "port":I
    :catch_1
    move-exception v8

    goto :goto_3
.end method

.method private pauseEmulator()V
    .locals 1

    .prologue
    .line 784
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->pause()V

    .line 785
    return-void
.end method

.method private quickLoad()V
    .locals 1

    .prologue
    .line 1383
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getQuickSlotFileName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->loadState(Ljava/lang/String;)V

    .line 1384
    return-void
.end method

.method private quickSave()V
    .locals 1

    .prologue
    .line 1379
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getQuickSlotFileName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->saveState(Ljava/lang/String;)V

    .line 1380
    return-void
.end method

.method private static readFile(Ljava/io/File;)[B
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1301
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1302
    .local v1, "in":Ljava/io/FileInputStream;
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v0, v2, [B

    .line 1304
    .local v0, "buffer":[B
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 1305
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1306
    :catchall_0
    move-exception v2

    .line 1307
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 1308
    throw v2

    .line 1307
    :cond_0
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 1309
    return-object v0
.end method

.method private resumeEmulator()V
    .locals 2

    .prologue
    .line 788
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 789
    const-string v0, "resume:"

    const-string v1, "resume?????"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 790
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->resume()V

    .line 792
    :cond_0
    const-string v0, "resume2:"

    const-string v1, "resume is ok!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 793
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->resume()V

    .line 794
    return-void
.end method

.method private saveState(Ljava/lang/String;)V
    .locals 5
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 1323
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 1325
    const/4 v1, 0x0

    .line 1328
    .local v1, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_0
    new-instance v2, Ljava/util/zip/ZipOutputStream;

    new-instance v3, Ljava/io/BufferedOutputStream;

    .line 1329
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1328
    invoke-direct {v2, v3}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1330
    .end local v1    # "out":Ljava/util/zip/ZipOutputStream;
    .local v2, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_1
    new-instance v3, Ljava/util/zip/ZipEntry;

    const-string v4, "screenshot.png"

    invoke-direct {v3, v4}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 1332
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1333
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1334
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1336
    if-eqz v2, :cond_1

    .line 1337
    :try_start_2
    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v1, v2

    .line 1341
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "out":Ljava/util/zip/ZipOutputStream;
    :goto_0
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, p1}, Lcom/androidemu/Emulator;->saveState(Ljava/lang/String;)Z

    .line 1342
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->resumeEmulator()V

    .line 1343
    return-void

    .line 1335
    :catchall_0
    move-exception v3

    .line 1336
    :goto_1
    if-eqz v1, :cond_0

    .line 1337
    :try_start_3
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 1338
    :cond_0
    throw v3
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1339
    :catch_0
    move-exception v3

    goto :goto_0

    .end local v1    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "out":Ljava/util/zip/ZipOutputStream;
    :catch_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "out":Ljava/util/zip/ZipOutputStream;
    goto :goto_0

    .line 1335
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v2    # "out":Ljava/util/zip/ZipOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "out":Ljava/util/zip/ZipOutputStream;
    goto :goto_1

    .end local v1    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "out":Ljava/util/zip/ZipOutputStream;
    :cond_1
    move-object v1, v2

    .end local v2    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "out":Ljava/util/zip/ZipOutputStream;
    goto :goto_0
.end method

.method private setFlipScreen(Landroid/content/SharedPreferences;Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "config"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v2, 0x0

    .line 806
    iget v0, p2, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 807
    const-string v0, "flipScreen"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    .line 811
    :goto_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "flipScreen"

    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 812
    return-void

    .line 809
    :cond_0
    iput-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    goto :goto_0
.end method

.method private setGameSpeed(F)V
    .locals 3
    .param p1, "speed"    # F

    .prologue
    .line 1247
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 1248
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "gameSpeed"

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    .line 1249
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->resumeEmulator()V

    .line 1250
    return-void
.end method

.method private startAutoSyncClient()V
    .locals 4

    .prologue
    .line 1237
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    .line 1238
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 1239
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->autoSyncClientInterval:I

    int-to-long v2, v2

    .line 1237
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1240
    return-void
.end method

.method private stopAutoSyncClient()V
    .locals 2

    .prologue
    .line 1243
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayHandler:Landroid/os/Handler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1244
    return-void
.end method

.method private static writeFile(Ljava/io/File;[B)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1314
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1316
    .local v0, "out":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1318
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1320
    return-void

    .line 1317
    :catchall_0
    move-exception v1

    .line 1318
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1319
    throw v1
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "request"    # I
    .param p2, "result"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, -0x1

    .line 482
    packed-switch p1, :pswitch_data_0

    .line 511
    :cond_0
    :goto_0
    return-void

    .line 484
    :pswitch_0
    if-ne p2, v1, :cond_0

    .line 485
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->loadState(Ljava/lang/String;)V

    goto :goto_0

    .line 489
    :pswitch_1
    if-ne p2, v1, :cond_0

    .line 490
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->saveState(Ljava/lang/String;)V

    goto :goto_0

    .line 494
    :pswitch_2
    if-ne p2, v1, :cond_0

    .line 495
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onBluetoothServer()V

    goto :goto_0

    .line 499
    :pswitch_3
    if-ne p2, v1, :cond_0

    .line 500
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onBluetoothClient()V

    goto :goto_0

    .line 504
    :pswitch_4
    if-ne p2, v1, :cond_0

    .line 505
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 506
    sget-object v2, Lcom/androidemu/gba/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 507
    .local v0, "address":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->onBluetoothConnect(Ljava/lang/String;)V

    goto :goto_0

    .line 482
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 290
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 292
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-direct {p0, v0, p1}, Lcom/androidemu/gba/EmulatorActivity2;->setFlipScreen(Landroid/content/SharedPreferences;Landroid/content/res/Configuration;)V

    .line 293
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 128
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 130
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 131
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->finish()V

    .line 241
    :goto_0
    return-void

    .line 134
    :cond_0
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->requestWindowFeature(I)Z

    .line 135
    const/4 v9, 0x3

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->setVolumeControlStream(I)V

    .line 137
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 138
    iget-object v8, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 139
    .local v8, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v8, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 140
    const-string v9, "data"

    const/4 v10, 0x0

    invoke-virtual {p0, v9, v10}, Lcom/androidemu/gba/EmulatorActivity2;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    .line 142
    .local v2, "datadir":Ljava/io/File;
    new-instance v9, Ljava/io/File;

    const-string v10, "game_config.txt"

    invoke-direct {v9, v2, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->copyAsset(Ljava/io/File;)Z

    .line 144
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/androidemu/Emulator;->createInstance2(Landroid/content/Context;Ljava/lang/String;)Lcom/androidemu/Emulator;

    move-result-object v9

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    .line 145
    invoke-static {p0}, Lcom/androidemu/EmuMedia;->setOnFrameDrawnListener(Lcom/androidemu/Emulator$OnFrameDrawnListener;)V

    .line 147
    const v9, 0x7f030004

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->setContentView(I)V

    .line 149
    const v9, 0x7f080008

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/androidemu/EmulatorView2;

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    .line 150
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v9}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v9

    invoke-interface {v9, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 151
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v9, p0}, Lcom/androidemu/EmulatorView2;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 152
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v9}, Lcom/androidemu/EmulatorView2;->requestFocus()Z

    .line 153
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    iget-object v10, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v9, v10}, Lcom/androidemu/EmulatorView2;->setEmulator(Lcom/androidemu/Emulator;)V

    .line 156
    const v9, 0x7f080007

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    .line 159
    .line 160
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 192
    .local v4, "layout":Landroid/widget/FrameLayout;
    new-instance v9, Lcom/androidemu/gba/input/Keyboard;

    iget-object v10, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-direct {v9, v10, p0}, Lcom/androidemu/gba/input/Keyboard;-><init>(Landroid/view/View;Lcom/androidemu/gba/input/GameKeyListener;)V

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    .line 194
    const/16 v9, 0x1a

    new-array v7, v9, [Ljava/lang/String;

    const/4 v9, 0x0

    .line 195
    const-string v10, "fullScreenMode"

    aput-object v10, v7, v9

    const/4 v9, 0x1

    .line 196
    const-string v10, "flipScreen"

    aput-object v10, v7, v9

    const/4 v9, 0x2

    .line 197
    const-string v10, "fastForwardSpeed"

    aput-object v10, v7, v9

    const/4 v9, 0x3

    .line 198
    const-string v10, "frameSkipMode"

    aput-object v10, v7, v9

    const/4 v9, 0x4

    .line 199
    const-string v10, "maxFrameSkips"

    aput-object v10, v7, v9

    const/4 v9, 0x5

    .line 200
    const-string v10, "refreshRate"

    aput-object v10, v7, v9

    const/4 v9, 0x6

    .line 201
    const-string v10, "enableLightGun"

    aput-object v10, v7, v9

    const/4 v9, 0x7

    .line 202
    const-string v10, "enableGamepad2"

    aput-object v10, v7, v9

    const/16 v9, 0x8

    .line 203
    const-string v10, "soundEnabled"

    aput-object v10, v7, v9

    const/16 v9, 0x9

    .line 204
    const-string v10, "soundVolume"

    aput-object v10, v7, v9

    const/16 v9, 0xa

    .line 205
    const-string v10, "transparencyEnabled"

    aput-object v10, v7, v9

    const/16 v9, 0xb

    .line 206
    const-string v10, "enableHiRes"

    aput-object v10, v7, v9

    const/16 v9, 0xc

    .line 207
    const-string v10, "enableTrackball"

    aput-object v10, v7, v9

    const/16 v9, 0xd

    .line 208
    const-string v10, "trackballSensitivity"

    aput-object v10, v7, v9

    const/16 v9, 0xe

    .line 209
    const-string v10, "useSensor"

    aput-object v10, v7, v9

    const/16 v9, 0xf

    .line 210
    const-string v10, "sensorSensitivity"

    aput-object v10, v7, v9

    const/16 v9, 0x10

    .line 211
    const-string v10, "enableVKeypad"

    aput-object v10, v7, v9

    const/16 v9, 0x11

    .line 212
    const-string v10, "scalingMode"

    aput-object v10, v7, v9

    const/16 v9, 0x12

    .line 213
    const-string v10, "aspectRatio"

    aput-object v10, v7, v9

    const/16 v9, 0x13

    .line 214
    const-string v10, "enableCheats"

    aput-object v10, v7, v9

    const/16 v9, 0x14

    .line 215
    const-string v10, "orientation"

    aput-object v10, v7, v9

    const/16 v9, 0x15

    .line 216
    const-string v10, "useInputMethod"

    aput-object v10, v7, v9

    const/16 v9, 0x16

    .line 217
    const-string v10, "quickLoad"

    aput-object v10, v7, v9

    const/16 v9, 0x17

    .line 218
    const-string v10, "quickSave"

    aput-object v10, v7, v9

    const/16 v9, 0x18

    .line 219
    const-string v10, "fastForward"

    aput-object v10, v7, v9

    const/16 v9, 0x19

    .line 220
    const-string v10, "screenshot"

    aput-object v10, v7, v9

    .line 223
    .local v7, "prefKeys":[Ljava/lang/String;
    array-length v10, v7

    const/4 v9, 0x0

    :goto_1
    if-lt v9, v10, :cond_2

    .line 225
    invoke-direct {p0, v8}, Lcom/androidemu/gba/EmulatorActivity2;->loadKeyBindings(Landroid/content/SharedPreferences;)V

    .line 227
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v10, "enableSRAM"

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 228
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v10, "apuEnabled"

    .line 229
    const-string v11, "apuEnabled"

    const/4 v12, 0x1

    invoke-interface {v8, v11, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    .line 228
    invoke-virtual {v9, v10, v11}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 230
    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/androidemu/gba/EmulatorActivity2;->path:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/gba_bios.bin"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->loadBIOS(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 231
    const-string v9, "game"

    const-string v10, "no load bios!!"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    :cond_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->loadROM()Z

    move-result v9

    if-nez v9, :cond_3

    .line 234
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->finish()V

    goto/16 :goto_0

    .line 223
    :cond_2
    aget-object v3, v7, v9

    .line 224
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v8, v3}, Lcom/androidemu/gba/EmulatorActivity2;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 223
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 237
    .end local v3    # "key":Ljava/lang/String;
    :cond_3
    new-instance v9, Landroid/content/Intent;

    const-class v10, Lcom/androidemu/gba/EmulatorService;

    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 238
    const-string v10, "com.androidemu.actions.FOREGROUND"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v9

    .line 237
    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity2;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 324
    packed-switch p1, :pswitch_data_0

    .line 332
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 326
    :pswitch_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->createQuitGameDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 328
    :pswitch_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->createReplaceGameDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 330
    :pswitch_2
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->createWifiConnectDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 324
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v2, 0x0

    .line 379
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 381
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 383
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothPresent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 384
    const v0, 0x7f080022

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 385
    const v0, 0x7f080023

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 387
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 262
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 264
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->unloadROM()V

    .line 266
    :cond_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onDisconnect()V

    .line 268
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/EmulatorService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->stopService(Landroid/content/Intent;)Z

    .line 269
    return-void
.end method

.method public onFrameDrawn(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 747
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v2}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    .line 748
    .local v1, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v1}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 749
    .local v0, "canvas2":Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_0

    .line 750
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v2, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->draw(Landroid/graphics/Canvas;)V

    .line 751
    :cond_0
    invoke-interface {v1, p1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 752
    return-void
.end method

.method public onFrameUpdate(I)I
    .locals 2
    .param p1, "keys"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 520
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1, p1}, Lcom/androidemu/gba/NetPlayService;->sendFrameUpdate(I)I

    move-result v0

    .line 521
    .local v0, "remote":I
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->isServer()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 522
    invoke-static {p1, v0}, Lcom/androidemu/gba/EmulatorActivity2;->makeKeyStates(II)I

    move-result v1

    .line 524
    :goto_0
    return v1

    :cond_0
    invoke-static {v0, p1}, Lcom/androidemu/gba/EmulatorActivity2;->makeKeyStates(II)I

    move-result v1

    goto :goto_0
.end method

.method public onGameKeyChanged()V
    .locals 4

    .prologue
    .line 658
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/Keyboard;->getKeyStates()I

    move-result v1

    .line 660
    .local v1, "states":I
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v2, :cond_3

    .line 661
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/SensorKeypad;->getKeyStates()I

    move-result v0

    .line 662
    .local v0, "keys":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    .line 663
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 664
    :cond_0
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_1

    .line 665
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 666
    :cond_1
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_2

    .line 667
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 668
    :cond_2
    and-int/lit8 v2, v0, 0x8

    if-eqz v2, :cond_3

    .line 669
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    const/4 v3, 0x3

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 671
    .end local v0    # "keys":I
    :cond_3
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    if-eqz v2, :cond_4

    .line 672
    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->flipGameKeys(I)I

    move-result v1

    .line 674
    :cond_4
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_5

    .line 675
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad;->getKeyStates()I

    move-result v2

    or-int/2addr v1, v2

    .line 678
    :cond_5
    and-int/lit8 v2, v1, 0x30

    const/16 v3, 0x30

    if-ne v2, v3, :cond_6

    .line 679
    and-int/lit8 v1, v1, -0x31

    .line 680
    :cond_6
    and-int/lit16 v2, v1, 0xc0

    const/16 v3, 0xc0

    if-ne v2, v3, :cond_7

    .line 681
    and-int/lit16 v1, v1, -0xc1

    .line 683
    :cond_7
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2, v1}, Lcom/androidemu/Emulator;->setKeyStates(I)V

    .line 684
    return-void
.end method

.method public onImageUpdate([I)V
    .locals 11
    .param p1, "data"    # [I

    .prologue
    const/16 v3, 0xf0

    const/4 v2, 0x0

    .line 778
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v1}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v10

    .line 779
    .local v10, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v10}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 780
    .local v0, "canvas":Landroid/graphics/Canvas;
    const/16 v7, 0xa0

    const/4 v9, 0x0

    move-object v1, p1

    move v4, v2

    move v5, v2

    move v6, v3

    move v8, v2

    invoke-virtual/range {v0 .. v9}, Landroid/graphics/Canvas;->drawBitmap([IIIIIIIZLandroid/graphics/Paint;)V

    .line 781
    invoke-interface {v10, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 782
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 348
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->quickLoadKey:I

    if-ne p1, v1, :cond_1

    .line 349
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->quickLoad()V

    .line 374
    :cond_0
    :goto_0
    return v0

    .line 352
    :cond_1
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->quickSaveKey:I

    if-ne p1, v1, :cond_2

    .line 353
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->quickSave()V

    goto :goto_0

    .line 356
    :cond_2
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->fastForwardKey:I

    if-ne p1, v1, :cond_3

    .line 357
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onFastForward()V

    goto :goto_0

    .line 360
    :cond_3
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->screenshotKey:I

    if-ne p1, v1, :cond_4

    .line 361
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onScreenshot()V

    goto :goto_0

    .line 365
    :cond_4
    const/16 v1, 0x1b

    if-eq p1, v1, :cond_0

    .line 366
    const/16 v1, 0x54

    if-eq p1, v1, :cond_0

    .line 369
    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    .line 370
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 371
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->showDialog(I)V

    goto :goto_0

    .line 374
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 313
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 320
    :goto_0
    return-void

    .line 316
    :cond_0
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2;->newIntent:Landroid/content/Intent;

    .line 318
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 319
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity2;->showDialog(I)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x3

    const/4 v0, 0x1

    .line 413
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 477
    :pswitch_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :cond_0
    :goto_0
    return v0

    .line 415
    :pswitch_1
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androidemu/gba/EmulatorSettings;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 420
    :pswitch_2
    :try_start_0
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v1, :cond_1

    .line 421
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->sendResetROM()V

    .line 422
    :cond_1
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v1}, Lcom/androidemu/Emulator;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 423
    :catch_0
    move-exception v1

    goto :goto_0

    .line 427
    :pswitch_3
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onFastForward()V

    goto :goto_0

    .line 431
    :pswitch_4
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onScreenshot()V

    goto :goto_0

    .line 435
    :pswitch_5
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androidemu/gba/CheatsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 439
    :pswitch_6
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onSaveState()V

    goto :goto_0

    .line 443
    :pswitch_7
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onLoadState()V

    goto :goto_0

    .line 447
    :pswitch_8
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onWifiServer()V

    goto :goto_0

    .line 451
    :pswitch_9
    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->showDialog(I)V

    goto :goto_0

    .line 455
    :pswitch_a
    invoke-direct {p0, v2}, Lcom/androidemu/gba/EmulatorActivity2;->checkBluetoothEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 456
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onBluetoothServer()V

    goto :goto_0

    .line 460
    :pswitch_b
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->checkBluetoothEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 461
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onBluetoothClient()V

    goto :goto_0

    .line 465
    :pswitch_c
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onDisconnect()V

    goto :goto_0

    .line 469
    :pswitch_d
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->onNetPlaySync()V

    goto :goto_0

    .line 474
    :pswitch_e
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {v1}, Landroid/os/Process;->killProcess(I)V

    goto :goto_0

    .line 413
    :pswitch_data_0
    .packed-switch 0x7f08001c
        :pswitch_d
        :pswitch_7
        :pswitch_6
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_a
        :pswitch_b
        :pswitch_8
        :pswitch_9
        :pswitch_c
        :pswitch_5
        :pswitch_2
        :pswitch_4
        :pswitch_e
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 273
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 275
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 276
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androidemu/gba/input/SensorKeypad;->setGameKeyListener(Lcom/androidemu/gba/input/GameKeyListener;)V

    .line 278
    :cond_0
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 337
    packed-switch p1, :pswitch_data_0

    .line 344
    :cond_0
    :goto_0
    return-void

    .line 339
    :pswitch_0
    const v1, 0x7f08001a

    invoke-virtual {p2, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 340
    .local v0, "v":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 341
    const/16 v1, 0x14f9

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 337
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 392
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 393
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->pauseEmulator()V

    .line 408
    const/4 v0, 0x1

    return v0
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 282
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 284
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-virtual {v0, p0}, Lcom/androidemu/gba/input/SensorKeypad;->setGameKeyListener(Lcom/androidemu/gba/input/GameKeyListener;)V

    .line 286
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 9
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x7

    const/4 v7, 0x2

    const/4 v3, 0x0

    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 528
    const-string v5, "gamepad"

    invoke-virtual {p2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 529
    invoke-direct {p0, p1}, Lcom/androidemu/gba/EmulatorActivity2;->loadKeyBindings(Landroid/content/SharedPreferences;)V

    .line 655
    .end local p0    # "this":Lcom/androidemu/gba/EmulatorActivity2;
    :cond_0
    :goto_0
    return-void

    .line 531
    .restart local p0    # "this":Lcom/androidemu/gba/EmulatorActivity2;
    :cond_1
    const-string v5, "fullScreenMode"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 532
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 533
    .local v0, "attrs":Landroid/view/WindowManager$LayoutParams;
    const-string v3, "fullScreenMode"

    invoke-interface {p1, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 534
    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v3, v3, 0x400

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 537
    :goto_1
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    goto :goto_0

    .line 536
    :cond_2
    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v3, v3, -0x401

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_1

    .line 539
    .end local v0    # "attrs":Landroid/view/WindowManager$LayoutParams;
    :cond_3
    const-string v5, "flipScreen"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 540
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/androidemu/gba/EmulatorActivity2;->setFlipScreen(Landroid/content/SharedPreferences;Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 542
    :cond_4
    const-string v5, "fastForwardSpeed"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 543
    const-string v3, "2x"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 545
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 544
    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->fastForwardSpeed:F

    .line 546
    iget-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->inFastForward:Z

    if-eqz v3, :cond_0

    .line 547
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->fastForwardSpeed:F

    invoke-direct {p0, v3}, Lcom/androidemu/gba/EmulatorActivity2;->setGameSpeed(F)V

    goto :goto_0

    .line 549
    .end local v2    # "value":Ljava/lang/String;
    :cond_5
    const-string v5, "frameSkipMode"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 550
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v4, "auto"

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 552
    :cond_6
    const-string v5, "maxFrameSkips"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 553
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 555
    :cond_7
    const-string v5, "maxFramesAhead"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 556
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v3, :cond_0

    .line 557
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/androidemu/gba/NetPlayService;->setMaxFramesAhead(I)V

    goto/16 :goto_0

    .line 559
    :cond_8
    const-string v5, "autoSyncClient"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 560
    const-string v5, "autoSyncClientInterval"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 562
    :cond_9
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v3}, Lcom/androidemu/gba/NetPlayService;->isServer()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 563
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->stopAutoSyncClient()V

    .line 564
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v5, "autoSyncClient"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 565
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 566
    const-string v4, "autoSyncClientInterval"

    const-string v5, "30"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 565
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->autoSyncClientInterval:I

    .line 567
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->autoSyncClientInterval:I

    mul-int/lit16 v3, v3, 0x3e8

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->autoSyncClientInterval:I

    .line 568
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity2;->startAutoSyncClient()V

    goto/16 :goto_0

    .line 571
    :cond_a
    const-string v5, "refreshRate"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 572
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const-string v4, "default"

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 574
    :cond_b
    const-string v5, "enableLightGun"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 575
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->lightGunEnabled:Z

    .line 576
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    iget-boolean v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->lightGunEnabled:Z

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 578
    :cond_c
    const-string v5, "enableGamepad2"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 579
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 581
    :cond_d
    const-string v5, "soundEnabled"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 582
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 584
    :cond_e
    const-string v5, "soundVolume"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 585
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const/16 v4, 0x64

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 587
    :cond_f
    const-string v5, "transparencyEnabled"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 588
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 590
    :cond_10
    const-string v5, "enableHiRes"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 591
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, p2, v4}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 593
    :cond_11
    const-string v5, "enableTrackball"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 594
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    .line 595
    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_12

    .line 594
    .end local p0    # "this":Lcom/androidemu/gba/EmulatorActivity2;
    :goto_2
    invoke-virtual {v4, p0}, Lcom/androidemu/EmulatorView2;->setOnTrackballListener(Lcom/androidemu/EmulatorView2$OnTrackballListener;)V

    goto/16 :goto_0

    .restart local p0    # "this":Lcom/androidemu/gba/EmulatorActivity2;
    :cond_12
    move-object p0, v3

    .line 595
    goto :goto_2

    .line 597
    :cond_13
    const-string v5, "trackballSensitivity"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 598
    invoke-interface {p1, p2, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    mul-int/lit8 v3, v3, 0x5

    add-int/lit8 v3, v3, 0xa

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->trackballSensitivity:I

    goto/16 :goto_0

    .line 600
    :cond_14
    const-string v5, "useSensor"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 601
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/androidemu/gba/EmulatorActivity2;->getSensorMappings(Ljava/lang/String;)[I

    move-result-object v4

    iput-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    .line 602
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensorMappings:[I

    if-nez v4, :cond_15

    .line 603
    iput-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    goto/16 :goto_0

    .line 604
    :cond_15
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-nez v3, :cond_0

    .line 605
    new-instance v3, Lcom/androidemu/gba/input/SensorKeypad;

    invoke-direct {v3, p0}, Lcom/androidemu/gba/input/SensorKeypad;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    .line 606
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    const-string v4, "sensorSensitivity"

    invoke-interface {p1, v4, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/androidemu/gba/input/SensorKeypad;->setSensitivity(I)V

    goto/16 :goto_0

    .line 608
    :cond_16
    const-string v5, "sensorSensitivity"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 609
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v3, :cond_0

    .line 610
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-interface {p1, p2, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/androidemu/gba/input/SensorKeypad;->setSensitivity(I)V

    goto/16 :goto_0

    .line 612
    :cond_17
    const-string v5, "enableVKeypad"

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 613
    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_18

    .line 614
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v4, :cond_0

    .line 615
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v4}, Lcom/androidemu/gba/input/VirtualKeypad;->destroy()V

    .line 616
    iput-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    goto/16 :goto_0

    .line 618
    :cond_18
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-nez v3, :cond_0

    .line 619
    new-instance v3, Lcom/androidemu/gba/input/VirtualKeypad;

    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-direct {v3, v4, p0}, Lcom/androidemu/gba/input/VirtualKeypad;-><init>(Landroid/view/View;Lcom/androidemu/gba/input/GameKeyListener;)V

    iput-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    .line 620
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v3, v4}, Lcom/androidemu/EmulatorView2;->setVkeypad(Lcom/androidemu/gba/input/VirtualKeypad;)V

    goto/16 :goto_0

    .line 623
    :cond_19
    const-string v3, "scalingMode"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 624
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    .line 625
    const-string v4, "stretch"

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 624
    invoke-static {v4}, Lcom/androidemu/gba/EmulatorActivity2;->getScalingMode(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/androidemu/EmulatorView2;->setScalingMode(I)V

    goto/16 :goto_0

    .line 627
    :cond_1a
    const-string v3, "aspectRatio"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 628
    const-string v3, "1.3333"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 629
    .local v1, "ratio":F
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v3, v1}, Lcom/androidemu/EmulatorView2;->setAspectRatio(F)V

    goto/16 :goto_0

    .line 631
    .end local v1    # "ratio":F
    :cond_1b
    const-string v3, "enableCheats"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 632
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/androidemu/Emulator;->enableCheats(Z)V

    goto/16 :goto_0

    .line 634
    :cond_1c
    const-string v3, "orientation"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 636
    const-string v3, "landscape"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 635
    invoke-static {v3}, Lcom/androidemu/gba/EmulatorActivity2;->getScreenOrientation(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity2;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 638
    :cond_1d
    const-string v3, "useInputMethod"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 639
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity2;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1e

    move v3, v4

    .line 641
    :goto_3
    const/high16 v4, 0x20000

    .line 639
    invoke-virtual {v5, v3, v4}, Landroid/view/Window;->setFlags(II)V

    goto/16 :goto_0

    .line 640
    :cond_1e
    const/high16 v3, 0x20000

    goto :goto_3

    .line 643
    :cond_1f
    const-string v3, "quickLoad"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 644
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->quickLoadKey:I

    goto/16 :goto_0

    .line 646
    :cond_20
    const-string v3, "quickSave"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 647
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->quickSaveKey:I

    goto/16 :goto_0

    .line 649
    :cond_21
    const-string v3, "fastForward"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    .line 650
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->fastForwardKey:I

    goto/16 :goto_0

    .line 652
    :cond_22
    const-string v3, "screenshot"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 653
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->screenshotKey:I

    goto/16 :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 755
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_0

    .line 756
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    iget-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/gba/input/VirtualKeypad;->onTouch(Landroid/view/MotionEvent;Z)Z

    move-result v2

    .line 775
    :goto_0
    return v2

    .line 758
    :cond_0
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->lightGunEnabled:Z

    if-eqz v2, :cond_2

    .line 759
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_2

    .line 760
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    .line 761
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceWidth:I

    .line 760
    mul-int/2addr v2, v3

    .line 761
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v3}, Lcom/androidemu/EmulatorView2;->getWidth()I

    move-result v3

    .line 760
    div-int v0, v2, v3

    .line 762
    .local v0, "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 763
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceHeight:I

    .line 762
    mul-int/2addr v2, v3

    .line 763
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v3}, Lcom/androidemu/EmulatorView2;->getHeight()I

    move-result v3

    .line 762
    div-int v1, v2, v3

    .line 764
    .local v1, "y":I
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    if-eqz v2, :cond_1

    .line 765
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceWidth:I

    sub-int v0, v2, v0

    .line 766
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceHeight:I

    sub-int v1, v2, v1

    .line 768
    :cond_1
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 769
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v2

    .line 770
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    .line 772
    const/4 v2, 0x1

    goto :goto_0

    .line 775
    .end local v0    # "x":I
    .end local v1    # "y":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onTrackball(Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 687
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 688
    .local v2, "dx":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 689
    .local v3, "dy":F
    iget-boolean v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->flipScreen:Z

    if-eqz v6, :cond_0

    .line 690
    neg-float v2, v2

    .line 691
    neg-float v3, v3

    .line 694
    :cond_0
    iget v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->trackballSensitivity:I

    int-to-float v6, v6

    mul-float/2addr v6, v2

    float-to-int v0, v6

    .line 695
    .local v0, "duration1":I
    iget v6, p0, Lcom/androidemu/gba/EmulatorActivity2;->trackballSensitivity:I

    int-to-float v6, v6

    mul-float/2addr v6, v3

    float-to-int v1, v6

    .line 696
    .local v1, "duration2":I
    const/4 v4, 0x0

    .line 697
    .local v4, "key1":I
    const/4 v5, 0x0

    .line 699
    .local v5, "key2":I
    if-gez v0, :cond_3

    .line 700
    const/16 v4, 0x20

    .line 704
    :cond_1
    :goto_0
    if-gez v1, :cond_4

    .line 705
    const/16 v5, 0x40

    .line 709
    :cond_2
    :goto_1
    if-nez v4, :cond_5

    if-nez v5, :cond_5

    .line 710
    const/4 v6, 0x0

    .line 713
    :goto_2
    return v6

    .line 701
    :cond_3
    if-lez v0, :cond_1

    .line 702
    const/16 v4, 0x10

    goto :goto_0

    .line 706
    :cond_4
    if-lez v1, :cond_2

    .line 707
    const/16 v5, 0x80

    goto :goto_1

    .line 713
    :cond_5
    const/4 v6, 0x1

    goto :goto_2
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 297
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 299
    if-eqz p1, :cond_1

    .line 301
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/Keyboard;->reset()V

    .line 302
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/VirtualKeypad;->reset()V

    .line 304
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androidemu/Emulator;->setKeyStates(I)V

    .line 306
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->resume()V

    .line 309
    :goto_0
    return-void

    .line 308
    :cond_1
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->pause()V

    goto :goto_0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 4
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 730
    iput p3, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceWidth:I

    .line 731
    iput p4, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceHeight:I

    .line 733
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_0

    .line 734
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v2, p3, p4}, Lcom/androidemu/gba/input/VirtualKeypad;->resize(II)V

    .line 736
    :cond_0
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2}, Lcom/androidemu/Emulator;->getVideoWidth()I

    move-result v1

    .line 737
    .local v1, "w":I
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2}, Lcom/androidemu/Emulator;->getVideoHeight()I

    move-result v0

    .line 738
    .local v0, "h":I
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    sub-int v3, p3, v1

    div-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 739
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    sub-int v3, p4, v0

    div-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/graphics/Rect;->top:I

    .line 740
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v1

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 741
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->surfaceRegion:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v3, v0

    iput v3, v2, Landroid/graphics/Rect;->bottom:I

    .line 743
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulatorView:Lcom/androidemu/EmulatorView2;

    invoke-virtual {v2, v3, v1, v0}, Lcom/androidemu/Emulator;->setRenderSurface(Lcom/androidemu/EmulatorView2;II)V

    .line 744
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 718
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v2, 0x0

    .line 721
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/VirtualKeypad;->destroy()V

    .line 724
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2;->emulator:Lcom/androidemu/Emulator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/androidemu/Emulator;->setRenderSurface(Lcom/androidemu/EmulatorView2;II)V

    .line 725
    return-void
.end method
