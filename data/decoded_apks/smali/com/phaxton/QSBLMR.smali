.class public Lcom/phaxton/QSBLMR;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static a:Lcom/phaxton/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    :try_start_0
    const-string v0, "LMR.onReceive(context)"

    invoke-static {v0}, Lcom/phaxton/g;->b(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/phaxton/QSBLMR;->a:Lcom/phaxton/a;

    if-nez v0, :cond_2

    const-string v0, "SR"

    invoke-static {p1, v0}, Lcom/phaxton/a;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/phaxton/a;

    move-result-object v0

    sput-object v0, Lcom/phaxton/QSBLMR;->a:Lcom/phaxton/a;

    :cond_2
    sget-object v0, Lcom/phaxton/QSBLMR;->a:Lcom/phaxton/a;

    if-nez v0, :cond_3

    const-string v0, "LMR.onReceive(classLoaderManage)"

    invoke-static {v0}, Lcom/phaxton/g;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_3
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LMR.onReceive()"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/phaxton/QSBLMR;->a:Lcom/phaxton/a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    sget-object v0, Lcom/phaxton/QSBLMR;->a:Lcom/phaxton/a;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/content/Context;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-class v4, Landroid/content/Intent;

    aput-object v4, v2, v3

    const-string v3, "onReceive"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
