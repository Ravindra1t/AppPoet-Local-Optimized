.class Lcom/google/net/b/r;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/google/net/b/q;


# direct methods
.method constructor <init>(Lcom/google/net/b/q;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/b/r;->b:Lcom/google/net/b/q;

    iput-object p2, p0, Lcom/google/net/b/r;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-super {p0}, Ljava/lang/Thread;->run()V

    iget-object v0, p0, Lcom/google/net/b/r;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/net/b/c;->a(Landroid/content/Context;)Lcom/google/net/b/c;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/b/r;->a:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/net/e/h;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/net/b/c;->b(Ljava/lang/String;)Lcom/google/net/b/i;

    return-void
.end method
