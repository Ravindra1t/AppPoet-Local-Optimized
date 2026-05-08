.class public Lcom/google/tool/JA;
.super Landroid/app/Activity;


# static fields
.field private static d:Landroid/app/Activity;


# instance fields
.field a:Landroid/widget/AdapterView$OnItemClickListener;

.field protected b:Lcom/google/tool/i;

.field private c:Lcom/google/tool/at;

.field private e:Lcom/google/tool/c;

.field private f:Lcom/google/tool/c;

.field private g:Landroid/content/Context;

.field private h:Ljava/util/Stack;

.field private i:Landroid/view/animation/TranslateAnimation;

.field private j:Landroid/view/animation/TranslateAnimation;

.field private k:Landroid/view/animation/TranslateAnimation;

.field private l:Landroid/view/animation/TranslateAnimation;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/google/tool/JA;->d:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    new-instance v0, Lcom/google/tool/u;

    invoke-direct {v0, p0}, Lcom/google/tool/u;-><init>(Lcom/google/tool/JA;)V

    iput-object v0, p0, Lcom/google/tool/JA;->a:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    return-void
.end method

.method static synthetic a(Lcom/google/tool/JA;)Lcom/google/tool/c;
    .locals 1

    iget-object v0, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    return-object v0
.end method

.method static synthetic a(Lcom/google/tool/JA;Lcom/google/tool/c;)Lcom/google/tool/c;
    .locals 0

    iput-object p1, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    return-object p1
.end method

.method protected static a(Landroid/content/Context;Lcom/google/tool/at;)V
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p1, Lcom/google/tool/at;->q:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/google/tool/at;->q:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/google/tool/JA;->b(Landroid/content/Context;Ljava/lang/String;Lcom/google/tool/at;)V

    :goto_0
    return-void

    :cond_1
    new-instance v0, Lcom/google/tool/b/f;

    iget-object v1, p1, Lcom/google/tool/at;->q:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/google/tool/h;->aB:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/tool/h;->s:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p1, Lcom/google/tool/at;->h:I

    invoke-static {p0, v2, v3}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v1, v2, v4}, Lcom/google/tool/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/tool/b/f;->a(Ljava/lang/Object;)V

    new-instance v1, Lcom/google/tool/s;

    invoke-direct {v1, p0, p1}, Lcom/google/tool/s;-><init>(Landroid/content/Context;Lcom/google/tool/at;)V

    invoke-static {p0, v0, v1}, Lcom/google/tool/aq;->a(Landroid/content/Context;Lcom/google/tool/b/f;Lcom/google/tool/b/a;)V

    goto :goto_0
.end method

.method static synthetic a(Landroid/content/Context;Ljava/lang/String;Lcom/google/tool/at;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/tool/JA;->b(Landroid/content/Context;Ljava/lang/String;Lcom/google/tool/at;)V

    return-void
.end method

.method private a(Lcom/google/tool/at;ZZ)V
    .locals 9

    const/4 v8, 0x1

    const/4 v7, 0x2

    const/4 v5, 0x0

    if-nez p2, :cond_0

    iget-byte v0, p1, Lcom/google/tool/at;->e:B

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    iget v0, p1, Lcom/google/tool/at;->s:I

    if-ne v0, v8, :cond_1

    new-instance v0, Lcom/google/tool/c;

    invoke-direct {v0, p0, p1, v5}, Lcom/google/tool/c;-><init>(Landroid/app/Activity;Lcom/google/tool/at;Z)V

    iput-object v0, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    iget-object v0, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    iget-object v1, p0, Lcom/google/tool/JA;->a:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v0, v1}, Lcom/google/tool/c;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v0, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    invoke-virtual {v0, v8}, Lcom/google/tool/c;->a(Z)V

    :goto_1
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/tool/JA;->g:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/tool/JM;->getService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v1, Lcom/google/tool/h;->T:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/google/tool/JA;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :pswitch_1
    if-nez p3, :cond_0

    invoke-static {p0, p1}, Lcom/google/tool/am;->b(Landroid/content/Context;Lcom/google/tool/at;)Landroid/content/Intent;

    move-result-object v1

    iget v0, p1, Lcom/google/tool/at;->F:I

    invoke-static {v0}, Lcom/google/tool/am;->a(I)I

    move-result v2

    sget v4, Lcom/google/tool/ay;->a:I

    move-object v0, p0

    move-object v3, p1

    move v6, v5

    invoke-static/range {v0 .. v6}, Lcom/google/tool/ay;->a(Landroid/content/Context;Landroid/content/Intent;ILcom/google/tool/at;IZZ)V

    goto :goto_0

    :cond_1
    iget-byte v0, p1, Lcom/google/tool/at;->e:B

    if-ne v0, v7, :cond_2

    iget-object v0, p1, Lcom/google/tool/at;->d:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/google/tool/aq;->a(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    invoke-virtual {p0}, Lcom/google/tool/JA;->finish()V

    goto :goto_1

    :cond_2
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p1, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    invoke-static {p0, v0}, Lcom/google/tool/ay;->c(Landroid/content/Context;Lcom/google/tool/at;)V

    invoke-virtual {p0}, Lcom/google/tool/JA;->finish()V

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method static synthetic b()Landroid/app/Activity;
    .locals 1

    sget-object v0, Lcom/google/tool/JA;->d:Landroid/app/Activity;

    return-object v0
.end method

.method private static b(Landroid/content/Context;Lcom/google/tool/at;)Landroid/content/Intent;
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-static {p0}, Lcom/google/tool/JM;->getActivity(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    sget-object v1, Lcom/google/tool/h;->S:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    sget-object v1, Lcom/google/tool/h;->R:Ljava/lang/String;

    iget v2, p1, Lcom/google/tool/at;->f:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v1, Lcom/google/tool/h;->aA:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/tool/at;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;Lcom/google/tool/at;)V
    .locals 4

    const/4 v3, 0x1

    new-instance v1, Landroid/content/Intent;

    sget-object v0, Lcom/google/tool/h;->al:Ljava/lang/String;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.extra.shortcut.NAME"

    iget-object v2, p2, Lcom/google/tool/at;->g:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    sget-object v0, Lcom/google/tool/h;->az:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p0, p2}, Lcom/google/tool/JA;->b(Landroid/content/Context;Lcom/google/tool/at;)Landroid/content/Intent;

    move-result-object v0

    const-string v2, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x1080093

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_1
    const-string v2, ""

    invoke-static {p0, v2, v3}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/tool/ay;->a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    const-string v2, "android.intent.extra.shortcut.ICON"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method private c()V
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

    iput-object v0, p0, Lcom/google/tool/JA;->i:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/tool/JA;->i:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/tool/JA;->i:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/tool/JA;->i:Landroid/view/animation/TranslateAnimation;

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

    iput-object v0, p0, Lcom/google/tool/JA;->j:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/tool/JA;->j:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/tool/JA;->j:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/tool/JA;->j:Landroid/view/animation/TranslateAnimation;

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

    iput-object v0, p0, Lcom/google/tool/JA;->k:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/tool/JA;->k:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/tool/JA;->k:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/tool/JA;->k:Landroid/view/animation/TranslateAnimation;

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

    iput-object v0, p0, Lcom/google/tool/JA;->l:Landroid/view/animation/TranslateAnimation;

    iget-object v0, p0, Lcom/google/tool/JA;->l:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v1, 0x190

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    iget-object v0, p0, Lcom/google/tool/JA;->l:Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    iget-object v0, p0, Lcom/google/tool/JA;->l:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    iget-object v1, p0, Lcom/google/tool/JA;->k:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/tool/i;

    iput-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    iget-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    invoke-virtual {p0, v0}, Lcom/google/tool/JA;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    invoke-virtual {v0}, Lcom/google/tool/i;->requestFocus()Z

    iget-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    invoke-virtual {v0}, Lcom/google/tool/i;->requestFocusFromTouch()Z

    iget-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    iget-object v1, p0, Lcom/google/tool/JA;->l:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Lcom/google/tool/i;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/tool/JA;->finish()V

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public a(Lcom/google/tool/i;)V
    .locals 2

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    iget-object v1, p0, Lcom/google/tool/JA;->i:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/tool/JA;->b:Lcom/google/tool/i;

    invoke-virtual {p0, p1}, Lcom/google/tool/JA;->setContentView(Landroid/view/View;)V

    invoke-virtual {p1}, Lcom/google/tool/i;->requestFocus()Z

    iget-object v0, p0, Lcom/google/tool/JA;->h:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/tool/JA;->j:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {p1, v0}, Lcom/google/tool/i;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_1
    return-void
.end method

.method public finish()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/google/tool/JA;->d:Landroid/app/Activity;

    invoke-super {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    const/4 v6, 0x1

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const v0, 0x186ab

    if-ne p1, v0, :cond_0

    const/16 v0, 0x4b0

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/google/tool/h;->cd:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    iget-object v1, v1, Lcom/google/tool/at;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/google/tool/h;->cf:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    invoke-static {p0, v0}, Lcom/google/tool/JA;->a(Landroid/content/Context;Lcom/google/tool/at;)V

    const/4 v1, 0x0

    const/4 v2, -0x1

    iget-object v3, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    sget v4, Lcom/google/tool/ay;->a:I

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/google/tool/ay;->a(Landroid/content/Context;Landroid/content/Intent;ILcom/google/tool/at;IZZ)V

    :cond_0
    invoke-virtual {p0}, Lcom/google/tool/JA;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    const/4 v6, 0x1

    const/4 v3, 0x0

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    iput-object p0, p0, Lcom/google/tool/JA;->g:Landroid/content/Context;

    invoke-direct {p0}, Lcom/google/tool/JA;->c()V

    invoke-static {p0}, Lcom/google/tool/b/b;->a(Landroid/content/Context;)Lcom/google/tool/b/b;

    invoke-virtual {p0, v6}, Lcom/google/tool/JA;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/google/tool/JA;->getIntent()Landroid/content/Intent;

    move-result-object v0

    new-instance v1, Lcom/google/tool/at;

    invoke-direct {v1}, Lcom/google/tool/at;-><init>()V

    iput-object v1, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    iget-object v1, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    sget-object v2, Lcom/google/tool/h;->aA:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/tool/at;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sput-object p0, Lcom/google/tool/JA;->d:Landroid/app/Activity;

    sget-object v1, Lcom/google/tool/h;->Q:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    sget-object v2, Lcom/google/tool/h;->S:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    iget-object v3, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    sget-object v4, Lcom/google/tool/h;->R:Ljava/lang/String;

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, v3, Lcom/google/tool/at;->f:I

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iput-object v3, v0, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    invoke-static {p0, v0}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    iget-object v0, p0, Lcom/google/tool/JA;->c:Lcom/google/tool/at;

    invoke-direct {p0, v0, v2, v1}, Lcom/google/tool/JA;->a(Lcom/google/tool/at;ZZ)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/tool/JA;->finish()V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x4

    if-ne p1, v1, :cond_5

    iget-object v1, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    invoke-virtual {v1}, Lcom/google/tool/c;->a()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    invoke-virtual {v1}, Lcom/google/tool/c;->a()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    iget-object v1, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/tool/JA;->e:Lcom/google/tool/c;

    invoke-virtual {v1}, Lcom/google/tool/c;->a()Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    iget-object v1, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/tool/JA;->f:Lcom/google/tool/c;

    invoke-virtual {v1}, Lcom/google/tool/c;->a()Z

    move-result v1

    if-nez v1, :cond_5

    :cond_4
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/google/tool/t;

    invoke-direct {v2, p0}, Lcom/google/tool/t;-><init>(Lcom/google/tool/JA;)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_5
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
