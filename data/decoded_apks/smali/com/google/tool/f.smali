.class Lcom/google/tool/f;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/google/tool/c;


# direct methods
.method constructor <init>(Lcom/google/tool/c;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/lang/String;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/google/tool/h;->aF:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    sget-object v2, Lcom/google/tool/h;->aG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/google/tool/h;->cl:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private a()V
    .locals 9

    const/4 v5, 0x1

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget v0, v0, Lcom/google/tool/at;->o:I

    div-int/lit16 v0, v0, 0x400

    invoke-static {}, Lcom/google/tool/ay;->d()J

    move-result-wide v1

    long-to-int v1, v1

    if-le v1, v0, :cond_2

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v2

    iget-object v2, v2, Lcom/google/tool/at;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/google/tool/h;->aH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v2

    iget v2, v2, Lcom/google/tool/at;->h:I

    invoke-static {v0, v1, v2}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    :cond_0
    :goto_0
    new-instance v8, Lcom/google/tool/b/f;

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v1, v1, Lcom/google/tool/at;->d:Ljava/lang/String;

    invoke-direct {v8, v1, v0, v5}, Lcom/google/tool/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget v0, v0, Lcom/google/tool/at;->E:I

    if-ne v0, v5, :cond_1

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/tool/aq;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/google/tool/b/f;->a(Ljava/lang/String;)V

    :cond_1
    const/4 v0, -0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v8, v0}, Lcom/google/tool/b/f;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x1080081

    sget-object v2, Lcom/google/tool/h;->cn:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    iget v3, v3, Lcom/google/tool/at;->h:I

    const/16 v4, 0x10

    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    iget-object v6, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v6}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v6

    iget-object v6, v6, Lcom/google/tool/at;->g:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Lcom/google/tool/aq;->a(Landroid/content/Context;ILjava/lang/String;IILandroid/content/Intent;Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/google/tool/m;

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/google/tool/m;-><init>(Landroid/content/Context;Lcom/google/tool/at;Landroid/os/Handler;)V

    invoke-static {v0, v8, v1}, Lcom/google/tool/aq;->a(Landroid/content/Context;Lcom/google/tool/b/f;Lcom/google/tool/b/a;)V

    :goto_1
    return-void

    :cond_2
    invoke-static {}, Lcom/google/tool/ay;->e()J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v0, v1, v3

    if-lez v0, :cond_3

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/google/tool/h;->r:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v2

    iget-object v2, v2, Lcom/google/tool/at;->i:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/google/tool/h;->aH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    goto/16 :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    sget-object v1, Lcom/google/tool/h;->cm:Ljava/lang/String;

    const/16 v2, 0xbb8

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    const/4 v7, 0x2

    const/4 v1, 0x0

    const/4 v5, 0x0

    const/4 v2, -0x1

    const/4 v6, 0x1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/google/tool/JA;->a(Landroid/content/Context;Lcom/google/tool/at;)V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/google/tool/h;->cd:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v4}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v4

    iget-object v4, v4, Lcom/google/tool/at;->g:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/google/tool/h;->ce:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget-byte v0, v0, Lcom/google/tool/at;->e:B

    const/4 v3, 0x7

    if-ne v0, v3, :cond_1

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    sget v4, Lcom/google/tool/ay;->a:I

    invoke-static/range {v0 .. v6}, Lcom/google/tool/ay;->a(Landroid/content/Context;Landroid/content/Intent;ILcom/google/tool/at;IZZ)V

    :cond_1
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->e(Lcom/google/tool/c;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0, v6}, Lcom/google/tool/c;->a(Lcom/google/tool/c;Z)Z

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->f(Lcom/google/tool/c;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v0, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v4}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/google/tool/JM;->getService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v3, Lcom/google/tool/h;->T:Ljava/lang/String;

    const/16 v4, 0xa

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_1
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget-byte v0, v0, Lcom/google/tool/at;->e:B

    if-eq v0, v6, :cond_2

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget-byte v0, v0, Lcom/google/tool/at;->e:B

    const/16 v3, 0xc

    if-ne v0, v3, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    sget v4, Lcom/google/tool/ay;->a:I

    invoke-static/range {v0 .. v6}, Lcom/google/tool/ay;->a(Landroid/content/Context;Landroid/content/Intent;ILcom/google/tool/at;IZZ)V

    :cond_3
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget-byte v0, v0, Lcom/google/tool/at;->e:B

    packed-switch v0, :pswitch_data_1

    :goto_2
    :pswitch_3
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    :cond_4
    invoke-static {}, Lcom/google/tool/a;->a()Lcom/google/tool/a;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v4}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v4

    iget v4, v4, Lcom/google/tool/at;->h:I

    invoke-virtual {v0, v3, v4, v6}, Lcom/google/tool/a;->a(Landroid/content/Context;II)V

    goto :goto_1

    :pswitch_4
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget-boolean v0, v0, Lcom/google/tool/at;->j:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v1, v1, Lcom/google/tool/at;->i:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/tool/ay;->e(Landroid/content/Context;Ljava/lang/String;)Z

    goto :goto_2

    :cond_5
    invoke-direct {p0}, Lcom/google/tool/f;->a()V

    goto :goto_2

    :pswitch_5
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v1, v1, Lcom/google/tool/at;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/tool/aq;->a(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    goto :goto_2

    :pswitch_6
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v0

    iget v0, v0, Lcom/google/tool/at;->B:I

    if-ne v0, v6, :cond_0

    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    sget v4, Lcom/google/tool/ay;->a:I

    invoke-static/range {v0 .. v6}, Lcom/google/tool/ay;->a(Landroid/content/Context;Landroid/content/Intent;ILcom/google/tool/at;IZZ)V

    goto/16 :goto_0

    :pswitch_7
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/google/tool/h;->aF:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    iget-object v3, v3, Lcom/google/tool/at;->m:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    iget-object v3, v3, Lcom/google/tool/at;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v3}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v3

    iget-object v3, v3, Lcom/google/tool/at;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v1

    sget-object v2, Lcom/google/tool/h;->cg:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :pswitch_8
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/google/tool/h;->ch:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v2}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v2

    iget-object v2, v2, Lcom/google/tool/at;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/google/tool/h;->ci:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5dc

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :pswitch_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/google/tool/h;->cj:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v1, v1, Lcom/google/tool/at;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/google/tool/h;->ck:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->d(Lcom/google/tool/c;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v1, v1, Lcom/google/tool/at;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v1}, Lcom/google/tool/c;->b(Lcom/google/tool/c;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, v0}, Lcom/google/tool/f;->a(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    :pswitch_a
    iget-object v0, p0, Lcom/google/tool/f;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->a(Lcom/google/tool/c;)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
