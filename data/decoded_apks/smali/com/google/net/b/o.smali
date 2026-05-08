.class Lcom/google/net/b/o;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Lcom/google/net/b/k;

.field final synthetic b:Lcom/google/net/b/n;


# direct methods
.method constructor <init>(Lcom/google/net/b/n;[Lcom/google/net/b/k;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/b/o;->b:Lcom/google/net/b/n;

    iput-object p2, p0, Lcom/google/net/b/o;->a:[Lcom/google/net/b/k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/net/b/o;->b:Lcom/google/net/b/n;

    iget-object v0, v0, Lcom/google/net/b/n;->b:Lcom/google/net/b/m;

    invoke-static {v0}, Lcom/google/net/b/m;->b(Lcom/google/net/b/m;)Lcom/google/net/b/p;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/b/o;->a:[Lcom/google/net/b/k;

    invoke-interface {v0, v1}, Lcom/google/net/b/p;->a([Lcom/google/net/b/k;)V

    return-void
.end method
