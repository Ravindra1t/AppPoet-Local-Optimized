.class Lcom/google/net/c;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/net/b;


# direct methods
.method constructor <init>(Lcom/google/net/b;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/c;->a:Lcom/google/net/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/net/c;->a:Lcom/google/net/b;

    iget-object v0, v0, Lcom/google/net/b;->b:Lcom/google/net/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/net/a;->a(Lcom/google/net/a;Z)Z

    return-void
.end method
