.class Lcom/google/tool/w;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Lcom/google/tool/JR;


# direct methods
.method constructor <init>(Lcom/google/tool/JR;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/w;->a:Lcom/google/tool/JR;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/tool/w;->a:Lcom/google/tool/JR;

    invoke-static {v0}, Lcom/google/tool/JR;->b(Lcom/google/tool/JR;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/tool/x;

    invoke-direct {v1, p0}, Lcom/google/tool/x;-><init>(Lcom/google/tool/w;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
