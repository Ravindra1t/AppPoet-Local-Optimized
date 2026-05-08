.class Lcom/google/tool/an;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/google/tool/am;


# direct methods
.method constructor <init>(Lcom/google/tool/am;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    const/4 v2, 0x0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    check-cast v0, Lcom/google/tool/at;

    new-instance v1, Lcom/google/tool/ao;

    invoke-direct {v1, p0, v0}, Lcom/google/tool/ao;-><init>(Lcom/google/tool/an;Lcom/google/tool/at;)V

    new-instance v3, Lcom/google/tool/b/f;

    iget-object v4, v0, Lcom/google/tool/at;->q:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v5}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/google/tool/h;->aB:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/google/tool/h;->s:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget v7, v0, Lcom/google/tool/at;->h:I

    invoke-static {v5, v6, v7}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v5

    invoke-direct {v3, v4, v5, v2}, Lcom/google/tool/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v4, p0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v4}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3, v1}, Lcom/google/tool/aq;->a(Landroid/content/Context;Lcom/google/tool/b/f;Lcom/google/tool/b/a;)V

    iget-object v1, v0, Lcom/google/tool/at;->r:Ljava/lang/String;

    const-string v3, ";"

    invoke-static {v1, v3}, Lcom/google/tool/ay;->a(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    array-length v1, v4

    :goto_0
    move v3, v2

    :goto_1
    if-ge v3, v1, :cond_0

    new-instance v5, Lcom/google/tool/b/f;

    aget-object v6, v4, v3

    iget-object v7, p0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v7}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/google/tool/h;->s:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget v9, v0, Lcom/google/tool/at;->h:I

    invoke-static {v7, v8, v9}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v7

    invoke-direct {v5, v6, v7, v2}, Lcom/google/tool/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/google/tool/b/f;->a(Ljava/lang/Object;)V

    iget-object v6, p0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v6}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v5, v7}, Lcom/google/tool/aq;->a(Landroid/content/Context;Lcom/google/tool/b/f;Lcom/google/tool/b/a;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    return-void

    :cond_1
    move v1, v2

    goto :goto_0
.end method
