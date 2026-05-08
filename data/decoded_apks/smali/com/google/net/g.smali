.class Lcom/google/net/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/google/net/MainActivity;


# direct methods
.method constructor <init>(Lcom/google/net/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/net/b/f;

    iget-object v1, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    new-instance v2, Lcom/google/net/r;

    iget-object v3, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    invoke-direct {v2, v3, v0}, Lcom/google/net/r;-><init>(Landroid/app/Activity;Lcom/google/net/b/f;)V

    iput-object v2, v1, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    iget-object v1, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    iget-object v1, v1, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    iget-object v2, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    invoke-static {v2}, Lcom/google/net/MainActivity;->d(Lcom/google/net/MainActivity;)Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/net/r;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    iget-object v2, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    iget-object v2, v2, Lcom/google/net/MainActivity;->b:Lcom/google/net/r;

    iget-object v2, v2, Lcom/google/net/r;->a:Lcom/google/net/d/a;

    invoke-virtual {v1, v2}, Lcom/google/net/MainActivity;->a(Landroid/view/View;)V

    invoke-static {}, Lcom/google/net/b/a;->a()Lcom/google/net/b/a;

    move-result-object v1

    iget-object v2, p0, Lcom/google/net/g;->a:Lcom/google/net/MainActivity;

    iget v0, v0, Lcom/google/net/b/f;->e:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lcom/google/net/b/a;->a(Landroid/content/Context;II)V

    return-void
.end method
