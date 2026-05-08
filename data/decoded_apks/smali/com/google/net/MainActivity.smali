.class public Lcom/google/net/MainActivity;
.super Landroid/app/Activity;


# instance fields
.field a:Lcom/google/net/r;

.field b:Lcom/google/net/r;

.field protected c:Landroid/view/View;

.field private d:Lcom/google/net/b/f;

.field private e:Landroid/os/Handler;

.field private f:Ljava/util/Stack;

.field private g:Landroid/view/animation/TranslateAnimation;

.field private h:Landroid/view/animation/TranslateAnimation;

.field private i:Landroid/view/animation/TranslateAnimation;

.field private j:Landroid/view/animation/TranslateAnimation;

.field private k:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/net/MainActivity;->d:Lcom/google/net/b/f;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/google/net/MainActivity;->e:Landroid/os/Handler;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/net/MainActivity;->f:Ljava/util/Stack;

    new-instance v0, Lcom/google/net/g;

    invoke-direct {v0, p0}, Lcom/google/net/g;-><init>(Lcom/google/net/MainActivity;)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->k:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method static synthetic a(Lcom/google/net/MainActivity;)Ljava/util/Stack;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainActivity;->f:Ljava/util/Stack;

    return-object v0
.end method

.method static synthetic b(Lcom/google/net/MainActivity;)Landroid/view/animation/TranslateAnimation;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainActivity;->g:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method private b()V
    .locals 9

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, -0x40800000    # -1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->g:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/net/MainActivity;->g:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->g:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->g:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->h:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/net/MainActivity;->h:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->h:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->h:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->i:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/net/MainActivity;->i:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->i:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->i:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    const/high16 v2, -0x40800000    # -1.0f

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->j:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/net/MainActivity;->j:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->j:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->j:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method

.method static synthetic c(Lcom/google/net/MainActivity;)Landroid/view/animation/TranslateAnimation;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainActivity;->h:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method static synthetic d(Lcom/google/net/MainActivity;)Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainActivity;->k:Landroid/widget/AdapterView$OnItemClickListener;

    return-object v0
.end method


# virtual methods
.method public a()Landroid/view/View;
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/google/net/MainActivity;->f:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-le v0, v2, :cond_0

    iget-object v0, p0, Lcom/google/net/MainActivity;->f:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    iget-object v1, p0, Lcom/google/net/MainActivity;->i:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->f:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setFocusable(Z)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/google/net/MainActivity;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocusFromTouch()Z

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    iget-object v1, p0, Lcom/google/net/MainActivity;->j:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->c:Landroid/view/View;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/net/MainActivity;->finish()V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/google/net/MainActivity;->e:Landroid/os/Handler;

    new-instance v1, Lcom/google/net/f;

    invoke-direct {v1, p0, p1}, Lcom/google/net/f;-><init>(Lcom/google/net/MainActivity;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v3, 0x1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/google/net/a/b;->a(Landroid/content/Context;)Lcom/google/net/a/b;

    invoke-virtual {p0, v3}, Lcom/google/net/MainActivity;->requestWindowFeature(I)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/google/net/e/b;->aT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/net/e/d;->a(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/net/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    sget-object v1, Lcom/google/net/e/b;->Q:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/google/net/b/f;

    invoke-direct {v1}, Lcom/google/net/b/f;-><init>()V

    invoke-virtual {v1, v0}, Lcom/google/net/b/f;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/net/MainActivity;->b()V

    iput-object v1, p0, Lcom/google/net/MainActivity;->d:Lcom/google/net/b/f;

    new-instance v0, Lcom/google/net/r;

    invoke-direct {v0, p0, v1}, Lcom/google/net/r;-><init>(Landroid/app/Activity;Lcom/google/net/b/f;)V

    iput-object v0, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    iget-object v0, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    iget-object v1, p0, Lcom/google/net/MainActivity;->k:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/google/net/r;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    invoke-virtual {v0}, Lcom/google/net/r;->a()V

    iget-object v0, p0, Lcom/google/net/MainActivity;->d:Lcom/google/net/b/f;

    iget v0, v0, Lcom/google/net/b/f;->y:I

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/google/net/MainActivity;->d:Lcom/google/net/b/f;

    iput v3, v0, Lcom/google/net/b/f;->x:I

    iget-object v0, p0, Lcom/google/net/MainActivity;->d:Lcom/google/net/b/f;

    invoke-static {p0, v0}, Lcom/google/net/e/h;->d(Landroid/content/Context;Lcom/google/net/b/f;)Z

    new-instance v0, Lcom/google/net/b/q;

    invoke-direct {v0}, Lcom/google/net/b/q;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/net/b/q;->a(Landroid/content/Context;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/google/net/MainActivity;->finish()V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    iget-object v1, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    invoke-virtual {v1}, Lcom/google/net/r;->b()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    invoke-virtual {v1}, Lcom/google/net/r;->b()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    iget-object v1, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/net/MainActivity;->a:Lcom/google/net/r;

    invoke-virtual {v1}, Lcom/google/net/r;->b()Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    iget-object v1, p0, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    invoke-virtual {v1}, Lcom/google/net/r;->b()Z

    move-result v1

    if-nez v1, :cond_5

    :cond_4
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/google/net/h;

    invoke-direct {v2, p0}, Lcom/google/net/h;-><init>(Lcom/google/net/MainActivity;)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_5
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
