.class public Lcom/phaxton/QSBLMS;
.super Landroid/app/Service;


# static fields
.field static a:Lcom/phaxton/a;


# instance fields
.field b:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-string v0, "LMS.()"

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    iput-object p0, p0, Lcom/phaxton/QSBLMS;->b:Landroid/content/Context;

    return-void
.end method

.method private static a(Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    invoke-virtual {v0, p0}, Lcom/phaxton/a;->b(Ljava/lang/String;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/phaxton/QSBLMS;->b:Landroid/content/Context;

    const-string v1, "SS"

    invoke-static {v0, v1}, Lcom/phaxton/a;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/phaxton/a;

    move-result-object v0

    sput-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    :cond_0
    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    const-string v1, "setActivity"

    iget-object v2, p0, Lcom/phaxton/QSBLMS;->b:Landroid/content/Context;

    const-class v3, Landroid/content/Context;

    invoke-virtual {v0, v1, v2, v3}, Lcom/phaxton/a;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    const-string v0, "onCreate"

    invoke-static {v0}, Lcom/phaxton/QSBLMS;->a(Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "LMS.onDestroy()"

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    if-eqz v0, :cond_0

    const-string v0, "onDestroy"

    invoke-static {v0}, Lcom/phaxton/QSBLMS;->a(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    const-string v0, "LMS.onLowMemory()"

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/Service;->onLowMemory()V

    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 6

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    new-array v2, v3, [Ljava/lang/Class;

    const-class v3, Landroid/content/Intent;

    aput-object v3, v2, v4

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v5

    const-string v3, "onStart"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 7

    const/4 v3, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "LMS.onStartCommand()"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    sget-object v0, Lcom/phaxton/QSBLMS;->a:Lcom/phaxton/a;

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    new-array v2, v3, [Ljava/lang/Class;

    const-class v3, Landroid/content/Intent;

    aput-object v3, v2, v4

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    const-string v3, "onStartCommand"

    invoke-virtual {v0, v3, v1, v2}, Lcom/phaxton/a;->a(Ljava/lang/String;[Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1

    const-string v0, "LMS.onUnbind()"

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    invoke-super {p0, p1}, Landroid/app/Service;->onUnbind(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method
