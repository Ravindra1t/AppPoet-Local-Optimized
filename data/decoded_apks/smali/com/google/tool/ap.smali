.class Lcom/google/tool/ap;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/tool/ao;


# direct methods
.method constructor <init>(Lcom/google/tool/ao;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/ap;->a:Lcom/google/tool/ao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/tool/ap;->a:Lcom/google/tool/ao;

    iget-object v0, v0, Lcom/google/tool/ao;->b:Lcom/google/tool/an;

    iget-object v0, v0, Lcom/google/tool/an;->a:Lcom/google/tool/am;

    invoke-static {v0}, Lcom/google/tool/am;->a(Lcom/google/tool/am;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/ap;->a:Lcom/google/tool/ao;

    iget-object v1, v1, Lcom/google/tool/ao;->a:Lcom/google/tool/at;

    invoke-static {v0, v1}, Lcom/google/tool/am;->a(Landroid/content/Context;Lcom/google/tool/at;)V

    return-void
.end method
