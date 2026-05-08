.class Lcom/google/net/h;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/net/MainActivity;


# direct methods
.method constructor <init>(Lcom/google/net/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/h;->a:Lcom/google/net/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/google/net/h;->a:Lcom/google/net/MainActivity;

    invoke-virtual {v0}, Lcom/google/net/MainActivity;->a()Landroid/view/View;

    return-void
.end method
