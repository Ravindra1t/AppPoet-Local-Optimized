.class Lcom/google/tool/v;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/google/tool/JR;


# direct methods
.method constructor <init>(Lcom/google/tool/JR;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    iput-object p2, p0, Lcom/google/tool/v;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    iget-object v0, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/v;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/String;)Lcom/google/tool/at;

    move-result-object v6

    if-eqz v6, :cond_2

    iget-object v0, v6, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v6, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    iget-object v1, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v1}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v6}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    sget-object v2, Lcom/google/tool/h;->T:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v2}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/tool/JR;->a(Landroid/content/Context;Landroid/content/Intent;)V

    iget-object v1, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v1}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/tool/v;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/tool/h;->aH:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, v6, Lcom/google/tool/at;->h:I

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/String;IZ)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/google/tool/h;->r:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v3}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v6, Lcom/google/tool/at;->h:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v6, Lcom/google/tool/at;->i:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/tool/h;->aH:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/v;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/tool/ay;->f(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    iget-object v0, p0, Lcom/google/tool/v;->b:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Lcom/google/tool/JR;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x1080034

    sget-object v2, Lcom/google/tool/h;->cA:Ljava/lang/String;

    iget v3, v6, Lcom/google/tool/at;->h:I

    const/16 v4, 0x10

    if-nez v5, :cond_1

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    :cond_1
    iget-object v6, v6, Lcom/google/tool/at;->g:Ljava/lang/String;

    const/4 v7, -0x1

    invoke-static/range {v0 .. v7}, Lcom/google/tool/aq;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    :cond_2
    return-void
.end method
