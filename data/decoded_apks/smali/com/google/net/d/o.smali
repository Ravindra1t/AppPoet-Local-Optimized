.class public Lcom/google/net/d/o;
.super Landroid/app/Dialog;


# instance fields
.field private a:Z

.field private b:Lcom/google/net/b/f;

.field private c:Lcom/google/net/d/q;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;Lcom/google/net/b/f;)V
    .locals 6

    invoke-direct {p0, p1, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/net/d/o;->a:Z

    iput-object p4, p0, Lcom/google/net/d/o;->b:Lcom/google/net/b/f;

    new-instance v0, Lcom/google/net/d/p;

    iget-object v1, p0, Lcom/google/net/d/o;->b:Lcom/google/net/b/f;

    iget v1, v1, Lcom/google/net/b/f;->q:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/net/d/p;-><init>(Lcom/google/net/d/o;JJ)V

    invoke-virtual {v0}, Lcom/google/net/d/p;->start()Landroid/os/CountDownTimer;

    return-void
.end method

.method static synthetic a(Lcom/google/net/d/o;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/net/d/o;->a:Z

    return p1
.end method


# virtual methods
.method public a(Lcom/google/net/d/q;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/d/o;->c:Lcom/google/net/d/q;

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    iget-boolean v0, p0, Lcom/google/net/d/o;->a:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    iget-object v0, p0, Lcom/google/net/d/o;->c:Lcom/google/net/d/q;

    invoke-interface {v0}, Lcom/google/net/d/q;->a()V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Dialog;->onWindowFocusChanged(Z)V

    return-void
.end method
