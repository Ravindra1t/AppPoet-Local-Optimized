.class Lcom/phaxton/e;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/phaxton/d;


# direct methods
.method constructor <init>(Lcom/phaxton/d;)V
    .locals 0

    iput-object p1, p0, Lcom/phaxton/e;->a:Lcom/phaxton/d;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-wide/16 v0, 0x1388

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
