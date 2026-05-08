.class Lcom/google/tool/j;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/google/tool/i;


# direct methods
.method constructor <init>(Lcom/google/tool/i;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/j;->a:Lcom/google/tool/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2

    iget-object v0, p0, Lcom/google/tool/j;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->a(Lcom/google/tool/i;)Lcom/google/tool/a/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/tool/a/a;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/j;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->a(Lcom/google/tool/i;)Lcom/google/tool/a/a;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/tool/a/a;->setVisibility(I)V

    iget-object v0, p0, Lcom/google/tool/j;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->b(Lcom/google/tool/i;)Lcom/google/tool/a/a;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/google/tool/a/a;->setSelection(I)V

    :cond_0
    return-void
.end method
