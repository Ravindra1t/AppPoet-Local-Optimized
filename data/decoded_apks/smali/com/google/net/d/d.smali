.class Lcom/google/net/d/d;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/google/net/d/a;


# direct methods
.method constructor <init>(Lcom/google/net/d/a;)V
    .locals 0

    iput-object p1, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0}, Lcom/google/net/d/a;->c(Lcom/google/net/d/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0}, Lcom/google/net/d/a;->d(Lcom/google/net/d/a;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    iget-object v1, v1, Lcom/google/net/d/a;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getWallpaperDesiredMinimumHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0}, Lcom/google/net/d/a;->e(Lcom/google/net/d/a;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    iget-object v1, v1, Lcom/google/net/d/a;->a:Landroid/content/Context;

    const/16 v2, 0xd

    invoke-static {v1, v2}, Lcom/google/net/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/net/d/a;->a(Lcom/google/net/d/a;Z)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0}, Lcom/google/net/d/a;->d(Lcom/google/net/d/a;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0}, Lcom/google/net/d/a;->e(Lcom/google/net/d/a;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    iget-object v1, v1, Lcom/google/net/d/a;->a:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/google/net/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/net/d/d;->a:Lcom/google/net/d/a;

    invoke-static {v0, v2}, Lcom/google/net/d/a;->a(Lcom/google/net/d/a;Z)Z

    goto :goto_0
.end method
