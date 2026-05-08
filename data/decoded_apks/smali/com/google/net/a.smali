.class public Lcom/google/net/a;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/io/File;

.field private static b:Ljava/io/File;

.field private static g:Lcom/google/net/a;


# instance fields
.field private c:Landroid/content/Context;

.field private d:I

.field private e:Lcom/google/net/b/f;

.field private f:Z

.field private h:Landroid/os/Handler;

.field private i:Lcom/google/net/p;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/google/net/a;->g:Lcom/google/net/a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/google/net/a;->e:Lcom/google/net/b/f;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/net/a;->f:Z

    new-instance v0, Lcom/google/net/d;

    invoke-direct {v0, p0}, Lcom/google/net/d;-><init>(Lcom/google/net/a;)V

    iput-object v0, p0, Lcom/google/net/a;->h:Landroid/os/Handler;

    iput-object v1, p0, Lcom/google/net/a;->i:Lcom/google/net/p;

    iput-object p1, p0, Lcom/google/net/a;->c:Landroid/content/Context;

    return-void
.end method

.method static synthetic a(Lcom/google/net/a;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/google/net/a;->h:Landroid/os/Handler;

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lcom/google/net/a;
    .locals 1

    sget-object v0, Lcom/google/net/a;->g:Lcom/google/net/a;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/net/a;

    invoke-direct {v0, p0}, Lcom/google/net/a;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/net/a;->g:Lcom/google/net/a;

    :cond_0
    sget-object v0, Lcom/google/net/a;->g:Lcom/google/net/a;

    return-object v0
.end method

.method static synthetic a(Lcom/google/net/a;Lcom/google/net/b/f;)Lcom/google/net/b/f;
    .locals 0

    iput-object p1, p0, Lcom/google/net/a;->e:Lcom/google/net/b/f;

    return-object p1
.end method

.method static synthetic a(Ljava/io/File;)Ljava/io/File;
    .locals 0

    sput-object p0, Lcom/google/net/a;->a:Ljava/io/File;

    return-object p0
.end method

.method static synthetic a(Lcom/google/net/a;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/net/a;->f:Z

    return p1
.end method

.method static synthetic b(Lcom/google/net/a;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/net/a;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic b()Ljava/io/File;
    .locals 1

    sget-object v0, Lcom/google/net/a;->a:Ljava/io/File;

    return-object v0
.end method

.method static synthetic b(Ljava/io/File;)Ljava/io/File;
    .locals 0

    sput-object p0, Lcom/google/net/a;->b:Ljava/io/File;

    return-object p0
.end method

.method static synthetic c(Lcom/google/net/a;)Lcom/google/net/b/f;
    .locals 1

    iget-object v0, p0, Lcom/google/net/a;->e:Lcom/google/net/b/f;

    return-object v0
.end method

.method static synthetic c()Ljava/io/File;
    .locals 1

    sget-object v0, Lcom/google/net/a;->b:Ljava/io/File;

    return-object v0
.end method

.method static synthetic d(Lcom/google/net/a;)I
    .locals 1

    iget v0, p0, Lcom/google/net/a;->d:I

    return v0
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lcom/google/net/a;->i:Lcom/google/net/p;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/net/a;->i:Lcom/google/net/p;

    invoke-interface {v0}, Lcom/google/net/p;->a()V

    :cond_0
    return-void
.end method

.method public a(I)V
    .locals 3

    iget-object v0, p0, Lcom/google/net/a;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/net/l;->a(Landroid/content/Context;)Lcom/google/net/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/net/l;->b()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/net/a;->f:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/google/net/e/b;->C:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/google/net/e/b;->D:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/net/a;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/net/e/h;->k(Landroid/content/Context;)Z

    iput p1, p0, Lcom/google/net/a;->d:I

    new-instance v0, Lcom/google/net/b;

    invoke-direct {v0, p0, p1}, Lcom/google/net/b;-><init>(Lcom/google/net/a;I)V

    invoke-virtual {v0}, Lcom/google/net/b;->start()V

    goto :goto_0
.end method
