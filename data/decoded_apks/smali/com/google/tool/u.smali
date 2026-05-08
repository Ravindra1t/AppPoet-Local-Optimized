.class Lcom/google/tool/u;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Lcom/google/tool/JA;


# direct methods
.method constructor <init>(Lcom/google/tool/JA;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6

    const/4 v5, 0x0

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/tool/ad;

    invoke-static {v0}, Lcom/google/tool/ay;->a(Lcom/google/tool/ad;)Lcom/google/tool/at;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    new-instance v3, Lcom/google/tool/c;

    invoke-static {}, Lcom/google/tool/JA;->b()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4, v1, v5}, Lcom/google/tool/c;-><init>(Landroid/app/Activity;Lcom/google/tool/at;Z)V

    invoke-static {v2, v3}, Lcom/google/tool/JA;->a(Lcom/google/tool/JA;Lcom/google/tool/c;)Lcom/google/tool/c;

    iget-object v1, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    invoke-static {v1}, Lcom/google/tool/JA;->a(Lcom/google/tool/JA;)Lcom/google/tool/c;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    iget-object v2, v2, Lcom/google/tool/JA;->a:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v1, v2}, Lcom/google/tool/c;->a(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v1, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    iget-object v2, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    invoke-static {v2}, Lcom/google/tool/JA;->a(Lcom/google/tool/JA;)Lcom/google/tool/c;

    move-result-object v2

    iget-object v2, v2, Lcom/google/tool/c;->a:Lcom/google/tool/i;

    invoke-virtual {v1, v2}, Lcom/google/tool/JA;->a(Lcom/google/tool/i;)V

    iget-object v1, p0, Lcom/google/tool/u;->a:Lcom/google/tool/JA;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v0, Lcom/google/tool/ad;->e:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/tool/ay;->h(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
