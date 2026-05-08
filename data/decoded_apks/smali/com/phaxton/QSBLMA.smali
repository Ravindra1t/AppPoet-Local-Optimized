.class public Lcom/phaxton/QSBLMA;
.super Landroid/app/Activity;


# static fields
.field static a:Lcom/phaxton/a;

.field private static b:Ljava/lang/String;

.field public static final isDebug:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/phaxton/QSBLMA;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/phaxton/QSBLMA;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private static a(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    invoke-virtual {v0, p0}, Lcom/phaxton/a;->b(Ljava/lang/String;)Ljava/lang/Object;

    return-void
.end method

.method private static a(Landroid/content/Context;)Z
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    sget-object v2, Lcom/phaxton/a;->c:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method private static b(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/phaxton/a;->b:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/phaxton/SaveFile;->getStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    sget-object v1, Lcom/phaxton/a;->c:Ljava/lang/String;

    invoke-static {p0, v1, v0}, Lcom/phaxton/SaveFile;->saveFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;

    return-void
.end method

.method private static c(Landroid/content/Context;)V
    .locals 3

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/phaxton/QSBLMA;->b(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    const-string v0, "SA"

    invoke-static {p0, v0}, Lcom/phaxton/a;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/phaxton/a;

    move-result-object v0

    sput-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const-string v1, "setActivity"

    const-class v2, Landroid/app/Activity;

    invoke-virtual {v0, v1, p0, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static closeAD(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/phaxton/QSBLMA;->closeAD(Landroid/content/Context;I)V

    return-void
.end method

.method public static closeAD(Landroid/content/Context;I)V
    .locals 5

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const-string v3, "closeAD"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static initAD2(Landroid/content/Context;)V
    .locals 3

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const-string v1, "initAd2"

    const-class v2, Landroid/app/Activity;

    invoke-virtual {v0, v1, p0, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static initSDK(Landroid/content/Context;)V
    .locals 1

    const-string v0, ""

    invoke-static {p0, v0}, Lcom/phaxton/QSBLMA;->initSDK(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static initSDK(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lcom/phaxton/QSBLMA;->b:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/app/Activity;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const-string v3, "initSDK"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static onDestroySDK(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    if-eqz v0, :cond_0

    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static showAD(Landroid/content/Context;I)V
    .locals 5

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const-string v3, "showADFloat"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static showAD1(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/phaxton/QSBLMA;->showAD1(Landroid/content/Context;I)V

    return-void
.end method

.method public static showAD1(Landroid/content/Context;I)V
    .locals 5

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const-string v3, "startAd1"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static showAD2(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 3

    :try_start_0
    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    sget-object v0, Lcom/phaxton/QSBLMA;->a:Lcom/phaxton/a;

    const-string v1, "startAd2"

    const-class v2, Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, p1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/phaxton/QSBLMA;->c(Landroid/content/Context;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onRestart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    const-string v0, "onRestart"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const-string v0, "onResume"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onStart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    const-string v0, "onStart"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onStop()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    const-string v0, "onStop"

    invoke-static {v0}, Lcom/phaxton/QSBLMA;->a(Ljava/lang/String;)V

    return-void
.end method
