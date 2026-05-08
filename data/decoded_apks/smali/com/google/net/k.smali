.class final Lcom/google/net/k;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/google/net/MainService;


# direct methods
.method public constructor <init>(Lcom/google/net/MainService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/k;->a:Lcom/google/net/MainService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    iget-object v0, p0, Lcom/google/net/k;->a:Lcom/google/net/MainService;

    invoke-static {v0}, Lcom/google/net/MainService;->b(Lcom/google/net/MainService;)Landroid/os/PowerManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/net/k;->a:Lcom/google/net/MainService;

    invoke-static {v0}, Lcom/google/net/MainService;->c(Lcom/google/net/MainService;)V

    :cond_0
    iget-object v0, p0, Lcom/google/net/k;->a:Lcom/google/net/MainService;

    invoke-static {v0}, Lcom/google/net/MainService;->d(Lcom/google/net/MainService;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/net/k;->a:Lcom/google/net/MainService;

    invoke-static {v0}, Lcom/google/net/MainService;->e(Lcom/google/net/MainService;)Lcom/google/net/k;

    move-result-object v0

    const/4 v1, 0x0

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/net/k;->sendEmptyMessageDelayed(IJ)Z

    :cond_1
    return-void
.end method
