.class Lcom/phaxton/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/phaxton/Main;


# direct methods
.method constructor <init>(Lcom/phaxton/Main;)V
    .locals 0

    iput-object p1, p0, Lcom/phaxton/d;->a:Lcom/phaxton/Main;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/phaxton/d;->a:Lcom/phaxton/Main;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/phaxton/QSBLMA;->showAD1(Landroid/content/Context;I)V

    new-instance v0, Lcom/phaxton/e;

    invoke-direct {v0, p0}, Lcom/phaxton/e;-><init>(Lcom/phaxton/d;)V

    invoke-virtual {v0}, Lcom/phaxton/e;->start()V

    return-void
.end method
