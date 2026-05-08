.class public Lcom/google/net/e;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/net/a/a;


# static fields
.field private static d:Landroid/os/Handler;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/google/net/b/f;

.field private c:Landroid/os/Handler;

.field private e:I

.field private f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/net/b/f;Landroid/os/Handler;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lcom/google/net/e;->e:I

    iput v0, p0, Lcom/google/net/e;->f:I

    iput-object p1, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iput-object p3, p0, Lcom/google/net/e;->c:Landroid/os/Handler;

    return-void
.end method

.method private a(I)V
    .locals 5

    const/4 v4, 0x1

    sget-object v0, Lcom/google/net/e;->d:Landroid/os/Handler;

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    packed-switch p1, :pswitch_data_0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    sget-object v1, Lcom/google/net/e;->d:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void

    :pswitch_0
    const-string v2, "advertId"

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "progress"

    iget v3, p0, Lcom/google/net/e;->f:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    :pswitch_1
    const-string v2, "advertId"

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "dFinish"

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :pswitch_2
    const-string v2, "advertId"

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "abort"

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static a(Landroid/os/Handler;)V
    .locals 0

    sput-object p0, Lcom/google/net/e;->d:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public a(Lcom/google/net/a/f;I)V
    .locals 11

    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, -0x1

    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v0

    packed-switch p2, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/net/e/b;->K:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/google/net/e/b;->W:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/google/net/e/b;->X:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/google/net/e/b;->al:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    const v1, 0x1080082

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    const/16 v4, 0x20

    iget-object v5, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/google/net/e/h;->a(Landroid/content/Context;Ljava/io/File;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget-object v6, v6, Lcom/google/net/b/f;->d:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/google/net/q;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-direct {p0, v9}, Lcom/google/net/e;->a(I)V

    iget-object v0, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v0, v0, Lcom/google/net/b/f;->y:I

    if-ne v0, v8, :cond_2

    iget-object v0, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iput v10, v0, Lcom/google/net/b/f;->x:I

    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    invoke-static {v0, v1}, Lcom/google/net/e/h;->d(Landroid/content/Context;Lcom/google/net/b/f;)Z

    new-instance v0, Lcom/google/net/b/q;

    invoke-direct {v0}, Lcom/google/net/b/q;-><init>()V

    iget-object v1, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/net/b/q;->a(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    invoke-static {v0, v1}, Lcom/google/net/e/h;->e(Landroid/content/Context;Lcom/google/net/b/f;)Z

    :goto_2
    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget-object v2, v2, Lcom/google/net/b/f;->f:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/google/net/e/h;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    invoke-static {v0, v1}, Lcom/google/net/e/h;->f(Landroid/content/Context;Lcom/google/net/b/f;)Z

    invoke-static {}, Lcom/google/net/b/a;->a()Lcom/google/net/b/a;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v2, v2, Lcom/google/net/b/f;->e:I

    invoke-virtual {v0, v1, v2, v9}, Lcom/google/net/b/a;->a(Landroid/content/Context;II)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/google/net/e;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    sget-object v0, Lcom/google/net/e/b;->aR:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/google/net/e/b;->aS:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/net/a/f;->o()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/google/net/e;->c:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/net/e/b;->K:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v2, Lcom/google/net/e/b;->am:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/net/a/f;->m()I

    move-result v0

    if-ne v0, v8, :cond_4

    sget-object v2, Lcom/google/net/e/b;->an:Ljava/lang/String;

    :cond_4
    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    const v1, 0x1080078

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    const/16 v4, -0x63

    iget-object v5, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    invoke-static {v5, v6}, Lcom/google/net/e/h;->b(Landroid/content/Context;Lcom/google/net/b/f;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget-object v6, v6, Lcom/google/net/b/f;->g:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/google/net/q;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-direct {p0, v10}, Lcom/google/net/e;->a(I)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public a(Lcom/google/net/a/f;J)V
    .locals 9

    const/4 v8, 0x1

    invoke-virtual {p1}, Lcom/google/net/a/f;->c()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/net/e/b;->K:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/net/a/f;->j()I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    invoke-virtual {p1}, Lcom/google/net/a/f;->i()I

    move-result v1

    div-int/2addr v0, v1

    iget v1, p0, Lcom/google/net/e;->f:I

    sub-int v1, v0, v1

    if-lt v1, v8, :cond_0

    iput v0, p0, Lcom/google/net/e;->f:I

    iget-object v0, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    const v1, 0x1080081

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/google/net/e/b;->aj:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget v3, v3, Lcom/google/net/b/f;->e:I

    const/16 v4, -0x63

    iget-object v5, p0, Lcom/google/net/e;->a:Landroid/content/Context;

    iget-object v6, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    invoke-static {v5, v6}, Lcom/google/net/e/h;->b(Landroid/content/Context;Lcom/google/net/b/f;)Landroid/content/Intent;

    move-result-object v5

    iget-object v6, p0, Lcom/google/net/e;->b:Lcom/google/net/b/f;

    iget-object v6, v6, Lcom/google/net/b/f;->d:Ljava/lang/String;

    iget v7, p0, Lcom/google/net/e;->f:I

    invoke-static/range {v0 .. v7}, Lcom/google/net/q;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    invoke-direct {p0, v8}, Lcom/google/net/e;->a(I)V

    :cond_0
    return-void
.end method
