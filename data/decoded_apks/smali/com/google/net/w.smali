.class Lcom/google/net/w;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/net/r;


# direct methods
.method constructor <init>(Lcom/google/net/r;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/w;->a:Lcom/google/net/r;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/net/w;->a:Lcom/google/net/r;

    invoke-static {v0}, Lcom/google/net/r;->b(Lcom/google/net/r;)Lcom/google/net/b/f;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/google/net/b/f;->u:Z

    iget-object v0, p0, Lcom/google/net/w;->a:Lcom/google/net/r;

    iget-object v0, v0, Lcom/google/net/r;->a:Lcom/google/net/d/a;

    sget-object v1, Lcom/google/net/e/b;->ah:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/net/d/a;->h(Ljava/lang/String;)V

    return-void
.end method
