.class Lcom/google/tool/ao;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/tool/b/a;


# instance fields
.field final synthetic a:Lcom/google/tool/at;

.field final synthetic b:Lcom/google/tool/an;


# direct methods
.method constructor <init>(Lcom/google/tool/an;Lcom/google/tool/at;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/ao;->b:Lcom/google/tool/an;

    iput-object p2, p0, Lcom/google/tool/ao;->a:Lcom/google/tool/at;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/tool/b/f;I)V
    .locals 2

    const/4 v0, 0x4

    if-eq p2, v0, :cond_0

    const/4 v0, 0x5

    if-ne p2, v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/tool/ao;->b:Lcom/google/tool/an;

    new-instance v1, Lcom/google/tool/ap;

    invoke-direct {v1, p0}, Lcom/google/tool/ap;-><init>(Lcom/google/tool/ao;)V

    invoke-virtual {v0, v1}, Lcom/google/tool/an;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/google/tool/ao;->a:Lcom/google/tool/at;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/google/tool/at;->l:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/google/tool/ao;->b:Lcom/google/tool/an;

    iget-object v0, v0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v0}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/ao;->a:Lcom/google/tool/at;

    invoke-static {v0, v1}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/at;)Z

    invoke-static {}, Lcom/google/tool/JR;->a()V

    :cond_1
    return-void
.end method

.method public a(Lcom/google/tool/b/f;J)V
    .locals 0

    return-void
.end method
