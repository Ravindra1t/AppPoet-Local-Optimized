.class public Lcom/androidemu/gba/EmulatorActivity;
.super Landroid/app/Activity;
.source "EmulatorActivity.java"

# interfaces
.implements Lcom/androidemu/Emulator$FrameUpdateListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/View$OnTouchListener;
.implements Lcom/androidemu/EmulatorView$OnTrackballListener;
.implements Lcom/androidemu/Emulator$OnFrameDrawnListener;
.implements Lcom/androidemu/gba/input/GameKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;
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

.field private emulatorView:Lcom/androidemu/EmulatorView;

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

.field private waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v1, 0x4

    .line 763
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androidemu/gba/EmulatorActivity;->SENSOR_MAP_DPAD:[I

    .line 770
    new-array v0, v1, [I

    const/4 v1, 0x0

    .line 771
    const/16 v2, 0x200

    aput v2, v0, v1

    const/4 v1, 0x1

    .line 772
    const/16 v2, 0x100

    aput v2, v0, v1

    .line 770
    sput-object v0, Lcom/androidemu/gba/EmulatorActivity;->SENSOR_MAP_TRIGGERS:[I

    .line 60
    return-void

    .line 763
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
    .line 60
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 71
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

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->path:Ljava/lang/String;

    .line 95
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    .line 948
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity$1;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity$1;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    .line 60
    return-void
.end method

.method static synthetic access$0(Lcom/androidemu/gba/EmulatorActivity;)Lcom/androidemu/gba/NetPlayService;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    return-object v0
.end method

.method static synthetic access$1(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1162
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->applyNetplaySettings()V

    return-void
.end method

.method static synthetic access$10(Lcom/androidemu/gba/EmulatorActivity;Lcom/androidemu/gba/NetPlayService;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    return-void
.end method

.method static synthetic access$11(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1314
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->quickSave()V

    return-void
.end method

.method static synthetic access$12(Lcom/androidemu/gba/EmulatorActivity;)Landroid/content/Intent;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->newIntent:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$13(Lcom/androidemu/gba/EmulatorActivity;)Z
    .locals 1

    .prologue
    .line 893
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->loadROM()Z

    move-result v0

    return v0
.end method

.method static synthetic access$14(Lcom/androidemu/gba/EmulatorActivity;Landroid/content/Intent;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity;->newIntent:Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$15(Lcom/androidemu/gba/EmulatorActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1062
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/EmulatorActivity;->onWifiConnect(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$16(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1020
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->ensureDiscoverable()V

    return-void
.end method

.method static synthetic access$2(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1127
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onNetPlaySync()V

    return-void
.end method

.method static synthetic access$3(Lcom/androidemu/gba/EmulatorActivity;)Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    return-object v0
.end method

.method static synthetic access$4(Lcom/androidemu/gba/EmulatorActivity;Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    return-void
.end method

.method static synthetic access$5(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1136
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onDisconnect()V

    return-void
.end method

.method static synthetic access$6(Lcom/androidemu/gba/EmulatorActivity;)Lcom/androidemu/Emulator;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    return-object v0
.end method

.method static synthetic access$7(Lcom/androidemu/gba/EmulatorActivity;)Ljava/io/File;
    .locals 1

    .prologue
    .line 1233
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getTempStateFile()Ljava/io/File;

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
    .line 1250
    invoke-static {p0, p1}, Lcom/androidemu/gba/EmulatorActivity;->writeFile(Ljava/io/File;[B)V

    return-void
.end method

.method static synthetic access$9(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1174
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->startAutoSyncClient()V

    return-void
.end method

.method private applyNetplaySettings()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1163
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "enableGamepad2"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 1164
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "enableCheats"

    invoke-virtual {v0, v1, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 1165
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "maxFramesAhead"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1166
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "autoSyncClient"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1168
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    if-eqz v0, :cond_0

    .line 1169
    iput-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    .line 1170
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->setGameSpeed(F)V

    .line 1172
    :cond_0
    return-void
.end method

.method private checkBluetoothEnabled(I)Z
    .locals 2
    .param p1, "request"    # I

    .prologue
    .line 714
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 715
    const/4 v1, 0x1

    .line 719
    :goto_0
    return v1

    .line 717
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 718
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0, p1}, Lcom/androidemu/gba/EmulatorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 719
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;
    .param p2, "message"    # Ljava/lang/CharSequence;

    .prologue
    .line 938
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    if-eqz v0, :cond_0

    .line 939
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    invoke-virtual {v0}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->dismiss()V

    .line 940
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    .line 942
    :cond_0
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    iput-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    .line 943
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    invoke-virtual {v0, p1}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 944
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    invoke-virtual {v0, p2}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 945
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    return-object v0
.end method

.method private createQuitGameDialog()Landroid/app/Dialog;
    .locals 3

    .prologue
    .line 815
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity$2;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity$2;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    .line 828
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 829
    const v2, 0x7f060013

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 830
    const v2, 0x7f05000b

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 831
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 828
    return-object v1
.end method

.method private createReplaceGameDialog()Landroid/app/Dialog;
    .locals 3

    .prologue
    .line 836
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity$3;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity$3;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    .line 846
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 847
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 848
    const v2, 0x7f060011

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 849
    const v2, 0x7f060012

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 850
    const v2, 0x1040013

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 851
    const v2, 0x1040009

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 852
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 846
    return-object v1
.end method

.method private createWifiConnectDialog()Landroid/app/Dialog;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 857
    new-instance v0, Lcom/androidemu/gba/EmulatorActivity$4;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/EmulatorActivity$4;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    .line 868
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 869
    const v2, 0x7f06001e

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 870
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 871
    const v3, 0x7f03000d

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 870
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 872
    const v2, 0x104000a

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 873
    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 874
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 868
    return-object v1
.end method

.method private ensureDiscoverable()V
    .locals 2

    .prologue
    .line 1021
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothDiscoverable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1022
    new-instance v0, Landroid/content/Intent;

    .line 1023
    const-string v1, "android.bluetooth.adapter.action.REQUEST_DISCOVERABLE"

    .line 1022
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1024
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->startActivity(Landroid/content/Intent;)V

    .line 1026
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private flipGameKeys(I)I
    .locals 2
    .param p1, "keys"    # I

    .prologue
    .line 732
    and-int/lit16 v0, p1, -0xf1

    .line 733
    .local v0, "newKeys":I
    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_0

    .line 734
    or-int/lit8 v0, v0, 0x10

    .line 735
    :cond_0
    and-int/lit8 v1, p1, 0x10

    if-eqz v1, :cond_1

    .line 736
    or-int/lit8 v0, v0, 0x20

    .line 737
    :cond_1
    and-int/lit8 v1, p1, 0x40

    if-eqz v1, :cond_2

    .line 738
    or-int/lit16 v0, v0, 0x80

    .line 739
    :cond_2
    and-int/lit16 v1, p1, 0x80

    if-eqz v1, :cond_3

    .line 740
    or-int/lit8 v0, v0, 0x40

    .line 742
    :cond_3
    return v0
.end method

.method private getEmulatorEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 1
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 787
    const-string v0, "snes_comp"

    return-object v0
.end method

.method private getQuickSlotFileName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1311
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getROMFilePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androidemu/gba/StateSlotsActivity;->getSlotFileName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getROMFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 878
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getIntent()Landroid/content/Intent;

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
    .line 746
    const-string v0, "original"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 747
    const/4 v0, 0x0

    .line 752
    :goto_0
    return v0

    .line 748
    :cond_0
    const-string v0, "2x"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 749
    const/4 v0, 0x1

    goto :goto_0

    .line 750
    :cond_1
    const-string v0, "proportional"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 751
    const/4 v0, 0x2

    goto :goto_0

    .line 752
    :cond_2
    const/4 v0, 0x3

    goto :goto_0
.end method

.method private static getScreenOrientation(Ljava/lang/String;)I
    .locals 1
    .param p0, "orientation"    # Ljava/lang/String;

    .prologue
    .line 756
    const-string v0, "landscape"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 757
    const/4 v0, 0x0

    .line 760
    :goto_0
    return v0

    .line 758
    :cond_0
    const-string v0, "portrait"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 759
    const/4 v0, 0x1

    goto :goto_0

    .line 760
    :cond_1
    const/4 v0, -0x1

    goto :goto_0
.end method

.method private getScreenshot()Landroid/graphics/Bitmap;
    .locals 5

    .prologue
    .line 1299
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4}, Lcom/androidemu/Emulator;->getVideoWidth()I

    move-result v3

    .line 1300
    .local v3, "w":I
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4}, Lcom/androidemu/Emulator;->getVideoHeight()I

    move-result v2

    .line 1302
    .local v2, "h":I
    mul-int v4, v3, v2

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1303
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v4, v1}, Lcom/androidemu/Emulator;->getScreenshot(Ljava/nio/Buffer;)V

    .line 1305
    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1306
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 1307
    return-object v0
.end method

.method private static getSensorMappings(Ljava/lang/String;)[I
    .locals 1
    .param p0, "as"    # Ljava/lang/String;

    .prologue
    .line 778
    const-string v0, "dpad"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 779
    sget-object v0, Lcom/androidemu/gba/EmulatorActivity;->SENSOR_MAP_DPAD:[I

    .line 782
    :goto_0
    return-object v0

    .line 780
    :cond_0
    const-string v0, "triggers"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 781
    sget-object v0, Lcom/androidemu/gba/EmulatorActivity;->SENSOR_MAP_TRIGGERS:[I

    goto :goto_0

    .line 782
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTempStateFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 1234
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getCacheDir()Ljava/io/File;

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

    .line 882
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 884
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 885
    const/high16 v4, 0x7f050000

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 886
    .local v1, "filters":[Ljava/lang/String;
    array-length v4, v1

    move v3, v2

    :goto_0
    if-lt v3, v4, :cond_0

    .line 890
    :goto_1
    return v2

    .line 886
    :cond_0
    aget-object v0, v1, v3

    .line 887
    .local v0, "f":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 888
    const/4 v2, 0x1

    goto :goto_1

    .line 886
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private loadBIOS(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 922
    if-eqz p1, :cond_0

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, p1}, Lcom/androidemu/Emulator;->loadBIOS(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 924
    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 925
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "bios"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 926
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 927
    const/4 v2, 0x1

    .line 933
    .end local v1    # "editor":Landroid/content/SharedPreferences$Editor;
    :goto_0
    return v2

    .line 930
    :cond_0
    move-object v0, p1

    .line 933
    .local v0, "biosFileName":Ljava/lang/String;
    goto :goto_0
.end method

.method private loadKeyBindings(Landroid/content/SharedPreferences;)V
    .locals 9
    .param p1, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    const/4 v8, 0x0

    .line 791
    sget-object v1, Lcom/androidemu/gba/EmulatorSettings;->gameKeys:[I

    .line 792
    .local v1, "gameKeys":[I
    invoke-static {p0}, Lcom/androidemu/gba/DefaultPreferences;->getKeyMappings(Landroid/content/Context;)[I

    move-result-object v0

    .line 793
    .local v0, "defaultKeys":[I
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v4}, Lcom/androidemu/gba/input/Keyboard;->clearKeyMap()V

    .line 795
    sget-object v2, Lcom/androidemu/gba/EmulatorSettings;->gameKeysPref:[Ljava/lang/String;

    .line 796
    .local v2, "gameKeysPref":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-lt v3, v4, :cond_0

    .line 800
    sget-object v2, Lcom/androidemu/gba/EmulatorSettings;->gameKeysPref2:[Ljava/lang/String;

    .line 801
    const/4 v3, 0x0

    :goto_1
    array-length v4, v2

    if-lt v3, v4, :cond_1

    .line 805
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    const/4 v5, 0x1

    .line 806
    const-string v6, "gamepad_superscope_turbo"

    invoke-interface {p1, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 805
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 807
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    const/4 v5, 0x2

    .line 808
    const-string v6, "gamepad_superscope_pause"

    invoke-interface {p1, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 807
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 809
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    const/4 v5, 0x4

    .line 810
    const-string v6, "gamepad_superscope_cursor"

    invoke-interface {p1, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 809
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 811
    return-void

    .line 797
    :cond_0
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    aget v5, v1, v3

    .line 798
    aget-object v6, v2, v3

    aget v7, v0, v3

    invoke-interface {p1, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 797
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 796
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 802
    :cond_1
    iget-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    aget v5, v1, v3

    shl-int/lit8 v5, v5, 0x10

    .line 803
    aget-object v6, v2, v3

    invoke-interface {p1, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 802
    invoke-virtual {v4, v5, v6}, Lcom/androidemu/gba/input/Keyboard;->mapKey(II)V

    .line 801
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private loadROM()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 894
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getROMFilePath()Ljava/lang/String;

    move-result-object v0

    .line 896
    .local v0, "path":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->isROMSupported(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 897
    const v2, 0x7f060010

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 898
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 899
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->finish()V

    .line 916
    :goto_0
    return v1

    .line 902
    :cond_0
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, v0}, Lcom/androidemu/Emulator;->loadROM(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 903
    const v2, 0x7f06000f

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 904
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 905
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->finish()V

    goto :goto_0

    .line 909
    :cond_1
    iput-boolean v1, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    .line 914
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "quickLoadOnStart"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 915
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->quickLoad()V

    :cond_2
    move v1, v2

    .line 916
    goto :goto_0
.end method

.method private loadState(Ljava/lang/String;)V
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 1284
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1285
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1296
    :goto_0
    return-void

    .line 1288
    :cond_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 1290
    :try_start_0
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v1, :cond_1

    .line 1291
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity;->readFile(Ljava/io/File;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androidemu/gba/NetPlayService;->sendSavedState([B)V

    .line 1292
    :cond_1
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v1, p1}, Lcom/androidemu/Emulator;->loadState(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1295
    :goto_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->resumeEmulator()V

    goto :goto_0

    .line 1294
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private static makeKeyStates(II)I
    .locals 2
    .param p0, "p1"    # I
    .param p1, "p2"    # I

    .prologue
    .line 473
    shl-int/lit8 v0, p1, 0x10

    const v1, 0xffff

    and-int/2addr v1, p0

    or-int/2addr v0, v1

    return v0
.end method

.method private onBluetoothClient()V
    .locals 2

    .prologue
    .line 1123
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/DeviceListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1124
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1125
    return-void
.end method

.method private onBluetoothConnect(Ljava/lang/String;)V
    .locals 4
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1112
    :try_start_0
    new-instance v1, Lcom/androidemu/gba/NetPlayService;

    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1113
    .local v1, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v1, p1}, Lcom/androidemu/gba/NetPlayService;->bluetoothConnect(Ljava/lang/String;)V

    .line 1114
    iput-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1118
    const v2, 0x7f060020

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1119
    const v3, 0x7f06002f

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1118
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v2

    .line 1119
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 1120
    .end local v1    # "np":Lcom/androidemu/gba/NetPlayService;
    :goto_0
    return-void

    .line 1115
    :catch_0
    move-exception v0

    .line 1116
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method private onBluetoothServer()V
    .locals 4

    .prologue
    .line 1092
    :try_start_0
    new-instance v1, Lcom/androidemu/gba/NetPlayService;

    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1093
    .local v1, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->bluetoothListen()V

    .line 1094
    iput-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1099
    const v2, 0x7f06001f

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1100
    const v3, 0x7f060030

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1099
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    .line 1101
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    .line 1102
    new-instance v3, Lcom/androidemu/gba/EmulatorActivity$5;

    invoke-direct {v3, p0}, Lcom/androidemu/gba/EmulatorActivity$5;-><init>(Lcom/androidemu/gba/EmulatorActivity;)V

    .line 1101
    invoke-virtual {v2, v3}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V

    .line 1107
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->waitDialog:Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;

    invoke-virtual {v2}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->show()V

    .line 1108
    .end local v1    # "np":Lcom/androidemu/gba/NetPlayService;
    :goto_0
    return-void

    .line 1095
    :catch_0
    move-exception v0

    .line 1096
    .local v0, "e":Ljava/io/IOException;
    goto :goto_0
.end method

.method private onDisconnect()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1137
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-nez v0, :cond_0

    .line 1147
    :goto_0
    return-void

    .line 1140
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enableCheats"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1141
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "enableGamepad2"

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 1142
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->stopAutoSyncClient()V

    .line 1144
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0, v2}, Lcom/androidemu/Emulator;->setFrameUpdateListener(Lcom/androidemu/Emulator$FrameUpdateListener;)V

    .line 1145
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v0}, Lcom/androidemu/gba/NetPlayService;->disconnect()V

    .line 1146
    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    goto :goto_0
.end method

.method private onFastForward()V
    .locals 1

    .prologue
    .line 1191
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v0, :cond_0

    .line 1196
    :goto_0
    return-void

    .line 1194
    :cond_0
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_1
    iput-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    .line 1195
    iget-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/androidemu/gba/EmulatorActivity;->fastForwardSpeed:F

    :goto_2
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->setGameSpeed(F)V

    goto :goto_0

    .line 1194
    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 1195
    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_2
.end method

.method private onLoadState()V
    .locals 2

    .prologue
    .line 1150
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/StateSlotsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1151
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1152
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1153
    return-void
.end method

.method private onNetPlaySync()V
    .locals 3

    .prologue
    .line 1128
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getTempStateFile()Ljava/io/File;

    move-result-object v0

    .line 1130
    .local v0, "file":Ljava/io/File;
    :try_start_0
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androidemu/Emulator;->saveState(Ljava/lang/String;)Z

    .line 1131
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity;->readFile(Ljava/io/File;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/androidemu/gba/NetPlayService;->sendSavedState([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1133
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 1134
    return-void

    .line 1132
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private onSaveState()V
    .locals 3

    .prologue
    .line 1156
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/StateSlotsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1157
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1158
    const-string v1, "saveMode"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1159
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1160
    return-void
.end method

.method private onScreenshot()V
    .locals 9

    .prologue
    .line 1199
    new-instance v1, Ljava/io/File;

    const-string v6, "/sdcard/screenshot"

    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1200
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    move-result v6

    if-nez v6, :cond_0

    .line 1201
    const-string v6, "SNesoid"

    const-string v7, "Could not create directory for screenshots"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1231
    :goto_0
    return-void

    .line 1204
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

    .line 1205
    .local v3, "name":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1207
    .local v2, "file":Ljava/io/File;
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 1209
    const/4 v4, 0x0

    .line 1212
    .local v4, "out":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1213
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .local v5, "out":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1214
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x64

    invoke-virtual {v0, v6, v7, v5}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1215
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1217
    const v6, 0x7f060025

    .line 1218
    const/4 v7, 0x0

    .line 1217
    invoke-static {p0, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v6

    .line 1218
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 1220
    iget-object v6, p0, Lcom/androidemu/gba/EmulatorActivity;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    if-nez v6, :cond_1

    .line 1221
    new-instance v6, Lcom/androidemu/gba/MediaScanner;

    invoke-direct {v6, p0}, Lcom/androidemu/gba/MediaScanner;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/androidemu/gba/EmulatorActivity;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    .line 1222
    :cond_1
    iget-object v6, p0, Lcom/androidemu/gba/EmulatorActivity;->mediaScanner:Lcom/androidemu/gba/MediaScanner;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const-string v8, "image/png"

    invoke-virtual {v6, v7, v8}, Lcom/androidemu/gba/MediaScanner;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1225
    if-eqz v5, :cond_3

    .line 1226
    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v4, v5

    .line 1230
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :goto_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->resumeEmulator()V

    goto :goto_0

    .line 1224
    :catchall_0
    move-exception v6

    .line 1225
    :goto_2
    if-eqz v4, :cond_2

    .line 1226
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 1227
    :cond_2
    throw v6
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1228
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

    .line 1224
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

    .line 1063
    const/4 v0, 0x0

    .line 1065
    .local v0, "addr":Ljava/net/InetAddress;
    :try_start_0
    invoke-static {p1}, Lorg/apache/http/conn/util/InetAddressUtils;->isIPv4Address(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1066
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1068
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 1069
    const v2, 0x7f060033

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1070
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1088
    :goto_1
    return-void

    .line 1074
    :cond_1
    const/4 v1, 0x0

    .line 1076
    .local v1, "port":I
    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v1

    .line 1078
    :goto_2
    if-gtz v1, :cond_2

    .line 1079
    const v2, 0x7f060034

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1080
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 1083
    :cond_2
    new-instance v2, Lcom/androidemu/gba/NetPlayService;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v2, v3}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    .line 1084
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v2, v0, v1}, Lcom/androidemu/gba/NetPlayService;->tcpConnect(Ljava/net/InetAddress;I)V

    .line 1086
    const v2, 0x7f06001e

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 1087
    const v3, 0x7f06002f

    invoke-virtual {p0, v3}, Lcom/androidemu/gba/EmulatorActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1086
    invoke-direct {p0, v2, v3}, Lcom/androidemu/gba/EmulatorActivity;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v2

    .line 1087
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    goto :goto_1

    .line 1077
    :catch_0
    move-exception v2

    goto :goto_2

    .line 1067
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

    .line 1029
    const-string v8, "wifi"

    invoke-virtual {p0, v8}, Lcom/androidemu/gba/EmulatorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/wifi/WifiManager;

    .line 1030
    .local v6, "wifi":Landroid/net/wifi/WifiManager;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 1031
    .local v2, "info":Landroid/net/wifi/WifiInfo;
    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v3

    .line 1032
    .local v3, "ip":I
    :goto_1
    if-nez v3, :cond_2

    .line 1033
    const v8, 0x7f06002d

    invoke-static {p0, v8, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    .line 1034
    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 1060
    :goto_2
    return-void

    .line 1030
    .end local v2    # "info":Landroid/net/wifi/WifiInfo;
    .end local v3    # "ip":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .restart local v2    # "info":Landroid/net/wifi/WifiInfo;
    :cond_1
    move v3, v7

    .line 1031
    goto :goto_1

    .line 1038
    .restart local v3    # "ip":I
    :cond_2
    const/4 v0, 0x0

    .line 1040
    .local v0, "addr":Ljava/net/InetAddress;
    const/4 v8, 0x4

    :try_start_0
    new-array v8, v8, [B

    const/4 v9, 0x0

    .line 1041
    int-to-byte v10, v3

    aput-byte v10, v8, v9

    const/4 v9, 0x1

    .line 1042
    ushr-int/lit8 v10, v3, 0x8

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    const/4 v9, 0x2

    .line 1043
    ushr-int/lit8 v10, v3, 0x10

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    const/4 v9, 0x3

    .line 1044
    ushr-int/lit8 v10, v3, 0x18

    int-to-byte v10, v10

    aput-byte v10, v8, v9

    .line 1040
    invoke-static {v8}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 1048
    :goto_3
    const/16 v5, 0x14f9

    .line 1050
    .local v5, "port":I
    :try_start_1
    new-instance v4, Lcom/androidemu/gba/NetPlayService;

    iget-object v8, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    invoke-direct {v4, v8}, Lcom/androidemu/gba/NetPlayService;-><init>(Landroid/os/Handler;)V

    .line 1051
    .local v4, "np":Lcom/androidemu/gba/NetPlayService;
    invoke-virtual {v4, v0, v5}, Lcom/androidemu/gba/NetPlayService;->tcpListen(Ljava/net/InetAddress;I)I

    move-result v5

    .line 1052
    iput-object v4, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1057
    const v8, 0x7f06001d

    invoke-virtual {p0, v8}, Lcom/androidemu/gba/EmulatorActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    .line 1058
    const v9, 0x7f06002e

    new-array v10, v11, [Ljava/lang/Object;

    .line 1059
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v10, v12

    .line 1058
    invoke-virtual {p0, v9, v10}, Lcom/androidemu/gba/EmulatorActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 1057
    invoke-direct {p0, v8, v7}, Lcom/androidemu/gba/EmulatorActivity;->createNetWaitDialog(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/Dialog;

    move-result-object v7

    .line 1059
    invoke-virtual {v7}, Landroid/app/Dialog;->show()V

    goto :goto_2

    .line 1053
    .end local v4    # "np":Lcom/androidemu/gba/NetPlayService;
    :catch_0
    move-exception v1

    .line 1054
    .local v1, "e":Ljava/io/IOException;
    goto :goto_2

    .line 1046
    .end local v1    # "e":Ljava/io/IOException;
    .end local v5    # "port":I
    :catch_1
    move-exception v8

    goto :goto_3
.end method

.method private pauseEmulator()V
    .locals 1

    .prologue
    .line 705
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->pause()V

    .line 706
    return-void
.end method

.method private quickLoad()V
    .locals 1

    .prologue
    .line 1319
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getQuickSlotFileName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->loadState(Ljava/lang/String;)V

    .line 1320
    return-void
.end method

.method private quickSave()V
    .locals 1

    .prologue
    .line 1315
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getQuickSlotFileName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->saveState(Ljava/lang/String;)V

    .line 1316
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
    .line 1239
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1240
    .local v1, "in":Ljava/io/FileInputStream;
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v0, v2, [B

    .line 1242
    .local v0, "buffer":[B
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 1243
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1244
    :catchall_0
    move-exception v2

    .line 1245
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 1246
    throw v2

    .line 1245
    :cond_0
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 1247
    return-object v0
.end method

.method private resumeEmulator()V
    .locals 1

    .prologue
    .line 709
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->resume()V

    .line 711
    :cond_0
    return-void
.end method

.method private saveState(Ljava/lang/String;)V
    .locals 5
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 1261
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 1263
    const/4 v1, 0x0

    .line 1266
    .local v1, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_0
    new-instance v2, Ljava/util/zip/ZipOutputStream;

    new-instance v3, Ljava/io/BufferedOutputStream;

    .line 1267
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1266
    invoke-direct {v2, v3}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1268
    .end local v1    # "out":Ljava/util/zip/ZipOutputStream;
    .local v2, "out":Ljava/util/zip/ZipOutputStream;
    :try_start_1
    new-instance v3, Ljava/util/zip/ZipEntry;

    const-string v4, "screenshot.png"

    invoke-direct {v3, v4}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 1270
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1271
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {v0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1272
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1274
    if-eqz v2, :cond_1

    .line 1275
    :try_start_2
    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v1, v2

    .line 1279
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "out":Ljava/util/zip/ZipOutputStream;
    .restart local v1    # "out":Ljava/util/zip/ZipOutputStream;
    :goto_0
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v3, p1}, Lcom/androidemu/Emulator;->saveState(Ljava/lang/String;)Z

    .line 1280
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->resumeEmulator()V

    .line 1281
    return-void

    .line 1273
    :catchall_0
    move-exception v3

    .line 1274
    :goto_1
    if-eqz v1, :cond_0

    .line 1275
    :try_start_3
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 1276
    :cond_0
    throw v3
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 1277
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

    .line 1273
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

    .line 723
    iget v0, p2, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 724
    const-string v0, "flipScreen"

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    .line 728
    :goto_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "flipScreen"

    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 729
    return-void

    .line 726
    :cond_0
    iput-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    goto :goto_0
.end method

.method private setGameSpeed(F)V
    .locals 3
    .param p1, "speed"    # F

    .prologue
    .line 1185
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 1186
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v1, "gameSpeed"

    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    .line 1187
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->resumeEmulator()V

    .line 1188
    return-void
.end method

.method private startAutoSyncClient()V
    .locals 4

    .prologue
    .line 1175
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    .line 1176
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 1177
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity;->autoSyncClientInterval:I

    int-to-long v2, v2

    .line 1175
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 1178
    return-void
.end method

.method private stopAutoSyncClient()V
    .locals 2

    .prologue
    .line 1181
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayHandler:Landroid/os/Handler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 1182
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
    .line 1252
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1254
    .local v0, "out":Ljava/io/FileOutputStream;
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1256
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1258
    return-void

    .line 1255
    :catchall_0
    move-exception v1

    .line 1256
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 1257
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

    .line 441
    packed-switch p1, :pswitch_data_0

    .line 470
    :cond_0
    :goto_0
    return-void

    .line 443
    :pswitch_0
    if-ne p2, v1, :cond_0

    .line 444
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->loadState(Ljava/lang/String;)V

    goto :goto_0

    .line 448
    :pswitch_1
    if-ne p2, v1, :cond_0

    .line 449
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->saveState(Ljava/lang/String;)V

    goto :goto_0

    .line 453
    :pswitch_2
    if-ne p2, v1, :cond_0

    .line 454
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onBluetoothServer()V

    goto :goto_0

    .line 458
    :pswitch_3
    if-ne p2, v1, :cond_0

    .line 459
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onBluetoothClient()V

    goto :goto_0

    .line 463
    :pswitch_4
    if-ne p2, v1, :cond_0

    .line 464
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 465
    sget-object v2, Lcom/androidemu/gba/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "address":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->onBluetoothConnect(Ljava/lang/String;)V

    goto :goto_0

    .line 441
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
    .line 252
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 254
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-direct {p0, v0, p1}, Lcom/androidemu/gba/EmulatorActivity;->setFlipScreen(Landroid/content/SharedPreferences;Landroid/content/res/Configuration;)V

    .line 255
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 123
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 125
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 126
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->finish()V

    .line 220
    :goto_0
    return-void

    .line 129
    :cond_0
    const/4 v9, 0x1

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->requestWindowFeature(I)Z

    .line 130
    const/4 v9, 0x3

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->setVolumeControlStream(I)V

    .line 132
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 133
    iget-object v8, p0, Lcom/androidemu/gba/EmulatorActivity;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 134
    .local v8, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v8, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 136
    const-string v9, "data"

    const/4 v10, 0x0

    invoke-virtual {p0, v9, v10}, Lcom/androidemu/gba/EmulatorActivity;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    .line 138
    .local v2, "datadir":Ljava/io/File;
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 139
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    .line 138
    invoke-static {v9, v10}, Lcom/androidemu/Emulator;->createInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/androidemu/Emulator;

    move-result-object v9

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    .line 140
    invoke-static {p0}, Lcom/androidemu/EmuMedia;->setOnFrameDrawnListener(Lcom/androidemu/Emulator$OnFrameDrawnListener;)V

    .line 142
    const v9, 0x7f030003

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->setContentView(I)V

    .line 144
    const v9, 0x7f080008

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/androidemu/EmulatorView;

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    .line 145
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-virtual {v9}, Lcom/androidemu/EmulatorView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v9

    invoke-interface {v9, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 146
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-virtual {v9, p0}, Lcom/androidemu/EmulatorView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 147
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-virtual {v9}, Lcom/androidemu/EmulatorView;->requestFocus()Z

    .line 150
    new-instance v9, Lcom/androidemu/gba/input/Keyboard;

    iget-object v10, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-direct {v9, v10, p0}, Lcom/androidemu/gba/input/Keyboard;-><init>(Landroid/view/View;Lcom/androidemu/gba/input/GameKeyListener;)V

    iput-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    .line 152
    const v9, 0x7f080007

    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    .line 154
    .line 155
    .line 157
    .line 158
    .line 159
    .line 161
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 170
    .local v4, "layout":Landroid/widget/FrameLayout;
    const/16 v9, 0x1a

    new-array v7, v9, [Ljava/lang/String;

    const/4 v9, 0x0

    .line 171
    const-string v10, "fullScreenMode"

    aput-object v10, v7, v9

    const/4 v9, 0x1

    .line 172
    const-string v10, "flipScreen"

    aput-object v10, v7, v9

    const/4 v9, 0x2

    .line 173
    const-string v10, "fastForwardSpeed"

    aput-object v10, v7, v9

    const/4 v9, 0x3

    .line 174
    const-string v10, "frameSkipMode"

    aput-object v10, v7, v9

    const/4 v9, 0x4

    .line 175
    const-string v10, "maxFrameSkips"

    aput-object v10, v7, v9

    const/4 v9, 0x5

    .line 176
    const-string v10, "refreshRate"

    aput-object v10, v7, v9

    const/4 v9, 0x6

    .line 177
    const-string v10, "enableLightGun"

    aput-object v10, v7, v9

    const/4 v9, 0x7

    .line 178
    const-string v10, "enableGamepad2"

    aput-object v10, v7, v9

    const/16 v9, 0x8

    .line 179
    const-string v10, "soundEnabled"

    aput-object v10, v7, v9

    const/16 v9, 0x9

    .line 180
    const-string v10, "soundVolume"

    aput-object v10, v7, v9

    const/16 v9, 0xa

    .line 181
    const-string v10, "transparencyEnabled"

    aput-object v10, v7, v9

    const/16 v9, 0xb

    .line 182
    const-string v10, "enableHiRes"

    aput-object v10, v7, v9

    const/16 v9, 0xc

    .line 183
    const-string v10, "enableTrackball"

    aput-object v10, v7, v9

    const/16 v9, 0xd

    .line 184
    const-string v10, "trackballSensitivity"

    aput-object v10, v7, v9

    const/16 v9, 0xe

    .line 185
    const-string v10, "useSensor"

    aput-object v10, v7, v9

    const/16 v9, 0xf

    .line 186
    const-string v10, "sensorSensitivity"

    aput-object v10, v7, v9

    const/16 v9, 0x10

    .line 187
    const-string v10, "enableVKeypad"

    aput-object v10, v7, v9

    const/16 v9, 0x11

    .line 188
    const-string v10, "scalingMode"

    aput-object v10, v7, v9

    const/16 v9, 0x12

    .line 189
    const-string v10, "aspectRatio"

    aput-object v10, v7, v9

    const/16 v9, 0x13

    .line 190
    const-string v10, "enableCheats"

    aput-object v10, v7, v9

    const/16 v9, 0x14

    .line 191
    const-string v10, "orientation"

    aput-object v10, v7, v9

    const/16 v9, 0x15

    .line 192
    const-string v10, "useInputMethod"

    aput-object v10, v7, v9

    const/16 v9, 0x16

    .line 193
    const-string v10, "quickLoad"

    aput-object v10, v7, v9

    const/16 v9, 0x17

    .line 194
    const-string v10, "quickSave"

    aput-object v10, v7, v9

    const/16 v9, 0x18

    .line 195
    const-string v10, "fastForward"

    aput-object v10, v7, v9

    const/16 v9, 0x19

    .line 196
    const-string v10, "screenshot"

    aput-object v10, v7, v9

    .line 199
    .local v7, "prefKeys":[Ljava/lang/String;
    array-length v10, v7

    const/4 v9, 0x0

    :goto_1
    if-lt v9, v10, :cond_2

    .line 201
    invoke-direct {p0, v8}, Lcom/androidemu/gba/EmulatorActivity;->loadKeyBindings(Landroid/content/SharedPreferences;)V

    .line 203
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v10, "enableSRAM"

    const/4 v11, 0x1

    invoke-virtual {v9, v10, v11}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 204
    iget-object v9, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v10, "apuEnabled"

    .line 205
    const-string v11, "apuEnabled"

    const/4 v12, 0x1

    invoke-interface {v8, v11, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    .line 204
    invoke-virtual {v9, v10, v11}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    .line 207
    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/androidemu/gba/EmulatorActivity;->path:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/gba_bios.bin"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->loadBIOS(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 208
    const-string v9, "game"

    const-string v10, "no load bios!!"

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    :cond_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->loadROM()Z

    move-result v9

    if-nez v9, :cond_3

    .line 212
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->finish()V

    goto/16 :goto_0

    .line 199
    :cond_2
    aget-object v3, v7, v9

    .line 200
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v8, v3}, Lcom/androidemu/gba/EmulatorActivity;->onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 199
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 215
    .end local v3    # "key":Ljava/lang/String;
    :cond_3
    new-instance v9, Landroid/content/Intent;

    const-class v10, Lcom/androidemu/gba/EmulatorService;

    invoke-direct {v9, p0, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 216
    const-string v10, "com.androidemu.actions.FOREGROUND"

    invoke-virtual {v9, v10}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v9

    .line 215
    invoke-virtual {p0, v9}, Lcom/androidemu/gba/EmulatorActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 286
    packed-switch p1, :pswitch_data_0

    .line 294
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 288
    :pswitch_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->createQuitGameDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 290
    :pswitch_1
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->createReplaceGameDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 292
    :pswitch_2
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->createWifiConnectDialog()Landroid/app/Dialog;

    move-result-object v0

    goto :goto_0

    .line 286
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

    .line 341
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 343
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 345
    invoke-static {}, Lcom/androidemu/gba/wrapper/Wrapper;->isBluetoothPresent()Z

    move-result v0

    if-nez v0, :cond_0

    .line 346
    const v0, 0x7f080022

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 347
    const v0, 0x7f080023

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 349
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 224
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 226
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->unloadROM()V

    .line 228
    :cond_0
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onDisconnect()V

    .line 230
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/androidemu/gba/EmulatorService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->stopService(Landroid/content/Intent;)Z

    .line 231
    return-void
.end method

.method public onFrameDrawn(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 676
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 677
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0, p1}, Lcom/androidemu/gba/input/VirtualKeypad;->draw(Landroid/graphics/Canvas;)V

    .line 678
    :cond_0
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
    .line 479
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1, p1}, Lcom/androidemu/gba/NetPlayService;->sendFrameUpdate(I)I

    move-result v0

    .line 480
    .local v0, "remote":I
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->isServer()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 481
    invoke-static {p1, v0}, Lcom/androidemu/gba/EmulatorActivity;->makeKeyStates(II)I

    move-result v1

    .line 483
    :goto_0
    return v1

    :cond_0
    invoke-static {v0, p1}, Lcom/androidemu/gba/EmulatorActivity;->makeKeyStates(II)I

    move-result v1

    goto :goto_0
.end method

.method public onGameKeyChanged()V
    .locals 4

    .prologue
    .line 582
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/Keyboard;->getKeyStates()I

    move-result v1

    .line 584
    .local v1, "states":I
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v2, :cond_3

    .line 585
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/SensorKeypad;->getKeyStates()I

    move-result v0

    .line 586
    .local v0, "keys":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    .line 587
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 588
    :cond_0
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_1

    .line 589
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 590
    :cond_1
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_2

    .line 591
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    const/4 v3, 0x2

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 592
    :cond_2
    and-int/lit8 v2, v0, 0x8

    if-eqz v2, :cond_3

    .line 593
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    const/4 v3, 0x3

    aget v2, v2, v3

    or-int/2addr v1, v2

    .line 595
    .end local v0    # "keys":I
    :cond_3
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    if-eqz v2, :cond_4

    .line 596
    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->flipGameKeys(I)I

    move-result v1

    .line 598
    :cond_4
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_5

    .line 599
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad;->getKeyStates()I

    move-result v2

    or-int/2addr v1, v2

    .line 602
    :cond_5
    and-int/lit8 v2, v1, 0x30

    const/16 v3, 0x30

    if-ne v2, v3, :cond_6

    .line 603
    and-int/lit8 v1, v1, -0x31

    .line 604
    :cond_6
    and-int/lit16 v2, v1, 0xc0

    const/16 v3, 0xc0

    if-ne v2, v3, :cond_7

    .line 605
    and-int/lit16 v1, v1, -0xc1

    .line 607
    :cond_7
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2, v1}, Lcom/androidemu/Emulator;->setKeyStates(I)V

    .line 608
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 310
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity;->quickLoadKey:I

    if-ne p1, v1, :cond_1

    .line 311
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->quickLoad()V

    .line 336
    :cond_0
    :goto_0
    return v0

    .line 314
    :cond_1
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity;->quickSaveKey:I

    if-ne p1, v1, :cond_2

    .line 315
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->quickSave()V

    goto :goto_0

    .line 318
    :cond_2
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity;->fastForwardKey:I

    if-ne p1, v1, :cond_3

    .line 319
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onFastForward()V

    goto :goto_0

    .line 322
    :cond_3
    iget v1, p0, Lcom/androidemu/gba/EmulatorActivity;->screenshotKey:I

    if-ne p1, v1, :cond_4

    .line 323
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onScreenshot()V

    goto :goto_0

    .line 327
    :cond_4
    const/16 v1, 0x1b

    if-eq p1, v1, :cond_0

    .line 328
    const/16 v1, 0x54

    if-eq p1, v1, :cond_0

    .line 331
    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    .line 332
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 333
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->showDialog(I)V

    goto :goto_0

    .line 336
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 275
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 282
    :goto_0
    return-void

    .line 278
    :cond_0
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity;->newIntent:Landroid/content/Intent;

    .line 280
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 281
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity;->showDialog(I)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x3

    const/4 v0, 0x1

    .line 373
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 436
    :pswitch_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :cond_0
    :goto_0
    return v0

    .line 375
    :pswitch_1
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androidemu/gba/EmulatorSettings;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 380
    :pswitch_2
    :try_start_0
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v1, :cond_1

    .line 381
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    invoke-virtual {v1}, Lcom/androidemu/gba/NetPlayService;->sendResetROM()V

    .line 382
    :cond_1
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v1}, Lcom/androidemu/Emulator;->reset()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 383
    :catch_0
    move-exception v1

    goto :goto_0

    .line 387
    :pswitch_3
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onFastForward()V

    goto :goto_0

    .line 391
    :pswitch_4
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onScreenshot()V

    goto :goto_0

    .line 395
    :pswitch_5
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/androidemu/gba/CheatsActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 399
    :pswitch_6
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onSaveState()V

    goto :goto_0

    .line 403
    :pswitch_7
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onLoadState()V

    goto :goto_0

    .line 407
    :pswitch_8
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onWifiServer()V

    goto :goto_0

    .line 411
    :pswitch_9
    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->showDialog(I)V

    goto :goto_0

    .line 415
    :pswitch_a
    invoke-direct {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->checkBluetoothEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 416
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onBluetoothServer()V

    goto :goto_0

    .line 420
    :pswitch_b
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/androidemu/gba/EmulatorActivity;->checkBluetoothEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 421
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onBluetoothClient()V

    goto :goto_0

    .line 425
    :pswitch_c
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onDisconnect()V

    goto :goto_0

    .line 429
    :pswitch_d
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->onNetPlaySync()V

    goto :goto_0

    .line 433
    :pswitch_e
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->finish()V

    goto :goto_0

    .line 373
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
    .line 235
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 237
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 238
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v0, :cond_0

    .line 239
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androidemu/gba/input/SensorKeypad;->setGameKeyListener(Lcom/androidemu/gba/input/GameKeyListener;)V

    .line 240
    :cond_0
    return-void
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    .line 299
    packed-switch p1, :pswitch_data_0

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 301
    :pswitch_0
    const v1, 0x7f08001a

    invoke-virtual {p2, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 302
    .local v0, "v":Landroid/widget/TextView;
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 303
    const/16 v1, 0x14f9

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 299
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const v4, 0x7f080020

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 354
    invoke-super {p0, p1}, Landroid/app/Activity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    .line 355
    invoke-direct {p0}, Lcom/androidemu/gba/EmulatorActivity;->pauseEmulator()V

    .line 357
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->netPlayService:Lcom/androidemu/gba/NetPlayService;

    if-eqz v3, :cond_0

    move v0, v1

    .line 362
    .local v0, "netplay":Z
    :goto_0
    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    if-eqz v0, :cond_1

    :goto_1
    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 365
    invoke-interface {p1, v4}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 366
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    if-eqz v2, :cond_2

    const v2, 0x7f060023

    .line 365
    :goto_2
    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 368
    return v1

    .end local v0    # "netplay":Z
    :cond_0
    move v0, v2

    .line 357
    goto :goto_0

    .restart local v0    # "netplay":Z
    :cond_1
    move v2, v1

    .line 362
    goto :goto_1

    .line 367
    :cond_2
    const v2, 0x7f060022

    goto :goto_2
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 244
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 246
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-virtual {v0, p0}, Lcom/androidemu/gba/input/SensorKeypad;->setGameKeyListener(Lcom/androidemu/gba/input/GameKeyListener;)V

    .line 248
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 8
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x7

    const/4 v6, 0x2

    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 487
    const-string v4, "gamepad"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 488
    invoke-direct {p0, p1}, Lcom/androidemu/gba/EmulatorActivity;->loadKeyBindings(Landroid/content/SharedPreferences;)V

    .line 579
    .end local p0    # "this":Lcom/androidemu/gba/EmulatorActivity;
    :cond_0
    :goto_0
    return-void

    .line 490
    .restart local p0    # "this":Lcom/androidemu/gba/EmulatorActivity;
    :cond_1
    const-string v4, "fullScreenMode"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 491
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 492
    .local v0, "attrs":Landroid/view/WindowManager$LayoutParams;
    const-string v2, "fullScreenMode"

    invoke-interface {p1, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 493
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v2, v2, 0x400

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 496
    :goto_1
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    goto :goto_0

    .line 495
    :cond_2
    iget v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v2, v2, -0x401

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_1

    .line 498
    .end local v0    # "attrs":Landroid/view/WindowManager$LayoutParams;
    :cond_3
    const-string v4, "flipScreen"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 499
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/androidemu/gba/EmulatorActivity;->setFlipScreen(Landroid/content/SharedPreferences;Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 501
    :cond_4
    const-string v4, "fastForwardSpeed"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 502
    const-string v2, "2x"

    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 504
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 503
    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->fastForwardSpeed:F

    .line 505
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->inFastForward:Z

    if-eqz v2, :cond_0

    .line 506
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity;->fastForwardSpeed:F

    invoke-direct {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->setGameSpeed(F)V

    goto :goto_0

    .line 508
    .end local v1    # "value":Ljava/lang/String;
    :cond_5
    const-string v4, "frameSkipMode"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 509
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v3, "auto"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 511
    :cond_6
    const-string v4, "maxFrameSkips"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 512
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 514
    :cond_7
    const-string v4, "refreshRate"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 515
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const-string v3, "default"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 517
    :cond_8
    const-string v4, "soundEnabled"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 518
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 520
    :cond_9
    const-string v4, "soundVolume"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 521
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const/16 v3, 0x64

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/Emulator;->setOption(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 523
    :cond_a
    const-string v4, "enableTrackball"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 524
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    .line 525
    invoke-interface {p1, p2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 524
    .end local p0    # "this":Lcom/androidemu/gba/EmulatorActivity;
    :goto_2
    invoke-virtual {v3, p0}, Lcom/androidemu/EmulatorView;->setOnTrackballListener(Lcom/androidemu/EmulatorView$OnTrackballListener;)V

    goto/16 :goto_0

    .restart local p0    # "this":Lcom/androidemu/gba/EmulatorActivity;
    :cond_b
    move-object p0, v2

    .line 525
    goto :goto_2

    .line 527
    :cond_c
    const-string v4, "trackballSensitivity"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 528
    invoke-interface {p1, p2, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x5

    add-int/lit8 v2, v2, 0xa

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->trackballSensitivity:I

    goto/16 :goto_0

    .line 530
    :cond_d
    const-string v4, "useSensor"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 531
    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/androidemu/gba/EmulatorActivity;->getSensorMappings(Ljava/lang/String;)[I

    move-result-object v3

    iput-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    .line 532
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->sensorMappings:[I

    if-nez v3, :cond_e

    .line 533
    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    goto/16 :goto_0

    .line 534
    :cond_e
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-nez v2, :cond_0

    .line 535
    new-instance v2, Lcom/androidemu/gba/input/SensorKeypad;

    invoke-direct {v2, p0}, Lcom/androidemu/gba/input/SensorKeypad;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    .line 536
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    const-string v3, "sensorSensitivity"

    invoke-interface {p1, v3, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/androidemu/gba/input/SensorKeypad;->setSensitivity(I)V

    goto/16 :goto_0

    .line 538
    :cond_f
    const-string v4, "sensorSensitivity"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 539
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    if-eqz v2, :cond_0

    .line 540
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->sensor:Lcom/androidemu/gba/input/SensorKeypad;

    invoke-interface {p1, p2, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/androidemu/gba/input/SensorKeypad;->setSensitivity(I)V

    goto/16 :goto_0

    .line 542
    :cond_10
    const-string v4, "enableVKeypad"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 543
    invoke-interface {p1, p2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_11

    .line 544
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v3, :cond_0

    .line 545
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad;->destroy()V

    .line 546
    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    goto/16 :goto_0

    .line 548
    :cond_11
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-nez v2, :cond_0

    .line 549
    new-instance v2, Lcom/androidemu/gba/input/VirtualKeypad;

    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-direct {v2, v3, p0}, Lcom/androidemu/gba/input/VirtualKeypad;-><init>(Landroid/view/View;Lcom/androidemu/gba/input/GameKeyListener;)V

    iput-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    goto/16 :goto_0

    .line 551
    :cond_12
    const-string v2, "scalingMode"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 552
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    .line 553
    const-string v3, "stretch"

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 552
    invoke-static {v3}, Lcom/androidemu/gba/EmulatorActivity;->getScalingMode(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/androidemu/EmulatorView;->setScalingMode(I)V

    goto/16 :goto_0

    .line 555
    :cond_13
    const-string v2, "enableCheats"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 556
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-interface {p1, p2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/androidemu/Emulator;->enableCheats(Z)V

    goto/16 :goto_0

    .line 558
    :cond_14
    const-string v2, "orientation"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 560
    const-string v2, "landscape"

    invoke-interface {p1, p2, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 559
    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity;->getScreenOrientation(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/EmulatorActivity;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 562
    :cond_15
    const-string v2, "useInputMethod"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 563
    invoke-virtual {p0}, Lcom/androidemu/gba/EmulatorActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_16

    move v2, v3

    .line 565
    :goto_3
    const/high16 v3, 0x20000

    .line 563
    invoke-virtual {v4, v2, v3}, Landroid/view/Window;->setFlags(II)V

    goto/16 :goto_0

    .line 564
    :cond_16
    const/high16 v2, 0x20000

    goto :goto_3

    .line 567
    :cond_17
    const-string v2, "quickLoad"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 568
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->quickLoadKey:I

    goto/16 :goto_0

    .line 570
    :cond_18
    const-string v2, "quickSave"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 571
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->quickSaveKey:I

    goto/16 :goto_0

    .line 573
    :cond_19
    const-string v2, "fastForward"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 574
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->fastForwardKey:I

    goto/16 :goto_0

    .line 576
    :cond_1a
    const-string v2, "screenshot"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 577
    invoke-interface {p1, p2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/androidemu/gba/EmulatorActivity;->screenshotKey:I

    goto/16 :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 681
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v2, :cond_0

    .line 682
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    iget-boolean v3, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    invoke-virtual {v2, p2, v3}, Lcom/androidemu/gba/input/VirtualKeypad;->onTouch(Landroid/view/MotionEvent;Z)Z

    move-result v2

    .line 701
    :goto_0
    return v2

    .line 684
    :cond_0
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->lightGunEnabled:Z

    if-eqz v2, :cond_2

    .line 685
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_2

    .line 686
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    .line 687
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceWidth:I

    .line 686
    mul-int/2addr v2, v3

    .line 687
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-virtual {v3}, Lcom/androidemu/EmulatorView;->getWidth()I

    move-result v3

    .line 686
    div-int v0, v2, v3

    .line 688
    .local v0, "x":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v2, v2

    .line 689
    iget v3, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceHeight:I

    .line 688
    mul-int/2addr v2, v3

    .line 689
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity;->emulatorView:Lcom/androidemu/EmulatorView;

    invoke-virtual {v3}, Lcom/androidemu/EmulatorView;->getHeight()I

    move-result v3

    .line 688
    div-int v1, v2, v3

    .line 690
    .local v1, "y":I
    iget-boolean v2, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    if-eqz v2, :cond_1

    .line 691
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceWidth:I

    sub-int v0, v2, v0

    .line 692
    iget v2, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceHeight:I

    sub-int v1, v2, v1

    .line 694
    :cond_1
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 695
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v2

    .line 696
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    .line 697
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v2, v0, v1}, Lcom/androidemu/Emulator;->fireLightGun(II)V

    .line 698
    const/4 v2, 0x1

    goto :goto_0

    .line 701
    .end local v0    # "x":I
    .end local v1    # "y":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onTrackball(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 611
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 612
    .local v2, "dx":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 613
    .local v3, "dy":F
    iget-boolean v6, p0, Lcom/androidemu/gba/EmulatorActivity;->flipScreen:Z

    if-eqz v6, :cond_0

    .line 614
    neg-float v2, v2

    .line 615
    neg-float v3, v3

    .line 618
    :cond_0
    iget v6, p0, Lcom/androidemu/gba/EmulatorActivity;->trackballSensitivity:I

    int-to-float v6, v6

    mul-float/2addr v6, v2

    float-to-int v0, v6

    .line 619
    .local v0, "duration1":I
    iget v6, p0, Lcom/androidemu/gba/EmulatorActivity;->trackballSensitivity:I

    int-to-float v6, v6

    mul-float/2addr v6, v3

    float-to-int v1, v6

    .line 620
    .local v1, "duration2":I
    const/4 v4, 0x0

    .line 621
    .local v4, "key1":I
    const/4 v5, 0x0

    .line 623
    .local v5, "key2":I
    if-gez v0, :cond_3

    .line 624
    const/16 v4, 0x20

    .line 628
    :cond_1
    :goto_0
    if-gez v1, :cond_4

    .line 629
    const/16 v5, 0x40

    .line 633
    :cond_2
    :goto_1
    if-nez v4, :cond_5

    if-nez v5, :cond_5

    .line 634
    const/4 v6, 0x0

    .line 638
    :goto_2
    return v6

    .line 625
    :cond_3
    if-lez v0, :cond_1

    .line 626
    const/16 v4, 0x10

    goto :goto_0

    .line 630
    :cond_4
    if-lez v1, :cond_2

    .line 631
    const/16 v5, 0x80

    goto :goto_1

    .line 636
    :cond_5
    iget-object v6, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v7

    .line 637
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v8

    .line 636
    invoke-virtual {v6, v4, v7, v5, v8}, Lcom/androidemu/Emulator;->processTrackball(IIII)V

    .line 638
    const/4 v6, 0x1

    goto :goto_2
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 259
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 261
    if-eqz p1, :cond_1

    .line 263
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->keyboard:Lcom/androidemu/gba/input/Keyboard;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/Keyboard;->reset()V

    .line 264
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/VirtualKeypad;->reset()V

    .line 266
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androidemu/Emulator;->setKeyStates(I)V

    .line 268
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->resume()V

    .line 271
    :goto_0
    return-void

    .line 270
    :cond_1
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->pause()V

    goto :goto_0
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 9
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 655
    const/16 v5, 0xf0

    .line 656
    .local v5, "i":I
    const/16 v6, 0xa0

    .line 658
    .local v6, "j":I
    iput p3, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceWidth:I

    .line 659
    iput p4, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceHeight:I

    .line 661
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 662
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0, p3, p4}, Lcom/androidemu/gba/input/VirtualKeypad;->resize(II)V

    .line 664
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->getVideoWidth()I

    move-result v8

    .line 665
    .local v8, "w":I
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->getVideoHeight()I

    move-result v7

    .line 666
    .local v7, "h":I
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    sub-int v1, p3, v8

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 667
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    sub-int v1, p4, v7

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 668
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v8

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 669
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v7

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 671
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    .line 672
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity;->surfaceRegion:Landroid/graphics/Rect;

    iget v4, v1, Landroid/graphics/Rect;->top:I

    move v1, p3

    move v2, p4

    .line 671
    invoke-virtual/range {v0 .. v6}, Lcom/androidemu/Emulator;->setSurfaceRegion(IIIIII)V

    .line 673
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 642
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0, p1}, Lcom/androidemu/Emulator;->setSurface(Landroid/view/SurfaceHolder;)V

    .line 643
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 646
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v0, :cond_0

    .line 647
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/VirtualKeypad;->destroy()V

    .line 649
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity;->emulator:Lcom/androidemu/Emulator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/androidemu/Emulator;->setSurface(Landroid/view/SurfaceHolder;)V

    .line 650
    return-void
.end method
