.class Lcom/google/net/n;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/net/d/q;


# instance fields
.field final synthetic a:Lcom/google/net/l;


# direct methods
.method constructor <init>(Lcom/google/net/l;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/n;->a:Lcom/google/net/l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    iget-object v0, p0, Lcom/google/net/n;->a:Lcom/google/net/l;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/net/l;->a(Lcom/google/net/l;Z)Z

    iget-object v0, p0, Lcom/google/net/n;->a:Lcom/google/net/l;

    invoke-static {v0}, Lcom/google/net/l;->a(Lcom/google/net/l;)Landroid/os/CountDownTimer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/net/n;->a:Lcom/google/net/l;

    invoke-static {v0}, Lcom/google/net/l;->a(Lcom/google/net/l;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/google/net/n;->a:Lcom/google/net/l;

    invoke-static {v0}, Lcom/google/net/l;->b(Lcom/google/net/l;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/net/a;->a(Landroid/content/Context;)Lcom/google/net/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/net/a;->a()V

    return-void
.end method
