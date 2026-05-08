.class public Lcom/phaxton/Main;
.super Landroid/app/Activity;


# instance fields
.field a:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Lcom/phaxton/c;

    invoke-direct {v0, p0}, Lcom/phaxton/c;-><init>(Lcom/phaxton/Main;)V

    iput-object v0, p0, Lcom/phaxton/Main;->a:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method private a(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/phaxton/g;->a(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string v0, "onCreate"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p0, v0}, Lcom/phaxton/Main;->setContentView(Landroid/view/View;)V

    const-string v1, "10042"

    invoke-static {p0, v1}, Lcom/phaxton/QSBLMA;->initSDK(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "\u70b9\u51fb\u663e\u793a\u8d77\u5f39"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/phaxton/d;

    invoke-direct {v2, p0}, Lcom/phaxton/d;-><init>(Lcom/phaxton/Main;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v3, "\u70b9\u51fb\u521d\u59cb\u5316\ufffd?\ufffd?\u7136\u540e\u6309back\u952e\ufffd?\u51fa\u5e76\u663e\u793a\ufffd?\ufffd\ufffd\u5e7f\u544a"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v3, Lcom/phaxton/f;

    invoke-direct {v3, p0}, Lcom/phaxton/f;-><init>(Lcom/phaxton/Main;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    const-string v0, "onDestroy"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/phaxton/Main;->a:Landroid/content/DialogInterface$OnClickListener;

    invoke-static {p0, v0}, Lcom/phaxton/QSBLMA;->showAD2(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;)V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onRestart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onRestart()V

    const-string v0, "onRestart"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const-string v0, "onResume"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onStart()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    const-string v0, "onStart"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    return-void
.end method

.method protected onStop()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    const-string v0, "onStop"

    invoke-direct {p0, v0}, Lcom/phaxton/Main;->a(Ljava/lang/String;)V

    return-void
.end method
