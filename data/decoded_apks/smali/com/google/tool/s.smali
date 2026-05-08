.class final Lcom/google/tool/s;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/tool/b/a;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Lcom/google/tool/at;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/tool/at;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/s;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/tool/s;->b:Lcom/google/tool/at;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/tool/b/f;I)V
    .locals 3

    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/s;->a:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/google/tool/b/f;->c()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/tool/s;->b:Lcom/google/tool/at;

    invoke-static {v0, v1, v2}, Lcom/google/tool/JA;->a(Landroid/content/Context;Ljava/lang/String;Lcom/google/tool/at;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/google/tool/b/f;J)V
    .locals 0

    return-void
.end method
