.class Lcom/google/net/j;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/net/MainService;


# direct methods
.method constructor <init>(Lcom/google/net/MainService;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/j;->a:Lcom/google/net/MainService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lcom/google/net/Manager;->getInstance()Lcom/google/net/Manager;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/j;->a:Lcom/google/net/MainService;

    invoke-static {v1}, Lcom/google/net/MainService;->a(Lcom/google/net/MainService;)Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/google/net/Manager;->show(Landroid/content/Context;Z)V

    return-void
.end method
