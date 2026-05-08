.class Lcom/google/tool/ai;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/google/tool/at;

.field final synthetic b:Lcom/google/tool/ah;


# direct methods
.method constructor <init>(Lcom/google/tool/ah;Lcom/google/tool/at;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    iput-object p2, p0, Lcom/google/tool/ai;->a:Lcom/google/tool/at;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;Z)Z

    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v0}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/tool/r;->a(Landroid/content/Context;)Lcom/google/tool/r;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/ai;->a:Lcom/google/tool/at;

    iget v2, v2, Lcom/google/tool/at;->h:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v2}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/google/tool/ay;->o(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/tool/r;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_3

    const-class v0, Lcom/google/tool/ag;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/tool/ag;

    if-eqz v0, :cond_2

    iget v0, v0, Lcom/google/tool/ag;->a:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v0}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/tool/ay;->h(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    :goto_0
    const-class v0, Lcom/google/tool/ad;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/tool/ad;

    check-cast v0, [Lcom/google/tool/ad;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v1}, Lcom/google/tool/ah;->b(Lcom/google/tool/ah;)Lcom/google/tool/ak;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v1}, Lcom/google/tool/ah;->c(Lcom/google/tool/ah;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lcom/google/tool/aj;

    invoke-direct {v2, p0, v0}, Lcom/google/tool/aj;-><init>(Lcom/google/tool/ai;[Lcom/google/tool/ad;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_1
    const-wide/16 v0, 0xc8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;Z)Z

    return-void

    :cond_2
    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v0}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/tool/ay;->h(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v0}, Lcom/google/tool/ah;->a(Lcom/google/tool/ah;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/google/tool/ay;->h(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2
.end method
