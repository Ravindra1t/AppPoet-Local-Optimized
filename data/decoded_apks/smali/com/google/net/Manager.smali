.class public Lcom/google/net/Manager;
.super Ljava/lang/Object;


# static fields
.field protected static final DIALOG:I = 0x2

.field protected static final WINDOW_FULL:I = 0x0

.field public static final WINDOW_NOT_FULL:I = 0x1

.field private static m:Lcom/google/net/Manager;


# instance fields
.field private ShowTimejiange:J

.field private id:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/google/net/Manager;->m:Lcom/google/net/Manager;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/32 v0, 0x493e0

    iput-wide v0, p0, Lcom/google/net/Manager;->ShowTimejiange:J

    return-void
.end method

.method public static getInstance()Lcom/google/net/Manager;
    .locals 1

    sget-object v0, Lcom/google/net/Manager;->m:Lcom/google/net/Manager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/net/Manager;

    invoke-direct {v0}, Lcom/google/net/Manager;-><init>()V

    sput-object v0, Lcom/google/net/Manager;->m:Lcom/google/net/Manager;

    :cond_0
    sget-object v0, Lcom/google/net/Manager;->m:Lcom/google/net/Manager;

    return-object v0
.end method


# virtual methods
.method public canShowNext(Landroid/content/Context;)Z
    .locals 1

    invoke-static {p1}, Lcom/google/net/l;->a(Landroid/content/Context;)Lcom/google/net/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/net/l;->b()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChannelId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/google/net/e/h;->b(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public setId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/google/net/e/h;->a(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public setPosition(Landroid/content/Context;II)V
    .locals 1

    invoke-static {p1}, Lcom/google/net/l;->a(Landroid/content/Context;)Lcom/google/net/l;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/google/net/l;->a(II)V

    return-void
.end method

.method public show(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/net/Manager;->show(Landroid/content/Context;Z)V

    return-void
.end method

.method public show(Landroid/content/Context;Z)V
    .locals 9

    const/4 v8, 0x1

    invoke-static {p1, p2}, Lcom/google/net/e/h;->a(Landroid/content/Context;Z)Z

    if-nez p2, :cond_0

    invoke-static {p1}, Lcom/google/net/e/h;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/net/e/h;->l(Landroid/content/Context;Ljava/lang/String;)Z

    :cond_0
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {}, Lcom/google/net/e/h;->d()J

    move-result-wide v2

    invoke-static {p1}, Lcom/google/net/e/h;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/google/net/Manager;->id:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/net/Manager;->id:Ljava/lang/String;

    sget-object v5, Lcom/google/net/e/b;->aI:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {p1}, Lcom/google/net/a;->a(Landroid/content/Context;)Lcom/google/net/a;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/google/net/a;->a(I)V

    :goto_0
    return-void

    :cond_1
    sub-long v4, v0, v2

    iget-wide v6, p0, Lcom/google/net/Manager;->ShowTimejiange:J

    cmp-long v4, v4, v6

    if-gtz v4, :cond_2

    const-wide/16 v4, 0x3c

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    :cond_2
    invoke-static {p1}, Lcom/google/net/a;->a(Landroid/content/Context;)Lcom/google/net/a;

    move-result-object v2

    invoke-virtual {v2, v8}, Lcom/google/net/a;->a(I)V

    invoke-static {v0, v1}, Lcom/google/net/e/h;->a(J)V

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/google/net/e/b;->C:Ljava/lang/String;

    sget-object v1, Lcom/google/net/e/b;->aP:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
