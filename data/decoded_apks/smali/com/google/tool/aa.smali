.class Lcom/google/tool/aa;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/google/tool/JR;


# direct methods
.method constructor <init>(Lcom/google/tool/JR;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    iget-object v1, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    invoke-static {v1}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;Landroid/content/Context;)V

    :goto_0
    return-void

    :cond_0
    iget v8, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lcom/google/tool/ad;

    iget-object v0, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, v6, Lcom/google/tool/ad;->f:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/tool/ay;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x1080034

    sget-object v2, Lcom/google/tool/h;->cA:Ljava/lang/String;

    iget v3, v6, Lcom/google/tool/ad;->e:I

    const/16 v4, 0x10

    if-nez v5, :cond_1

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_1
    iget-object v6, v6, Lcom/google/tool/ad;->d:Ljava/lang/String;

    const/4 v7, -0x1

    invoke-static/range {v0 .. v7}, Lcom/google/tool/aq;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-static {}, Lcom/google/tool/a;->a()Lcom/google/tool/a;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/aa;->a:Lcom/google/tool/JR;

    invoke-static {v1}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v8, v2}, Lcom/google/tool/a;->a(Landroid/content/Context;II)V

    goto :goto_0
.end method
