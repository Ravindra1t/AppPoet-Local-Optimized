.class Lcom/google/tool/l;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Lcom/google/tool/i;


# direct methods
.method constructor <init>(Lcom/google/tool/i;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->c(Lcom/google/tool/i;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->e(Lcom/google/tool/i;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v1}, Lcom/google/tool/i;->d(Lcom/google/tool/i;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getWallpaperDesiredMinimumHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->f(Lcom/google/tool/i;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v1}, Lcom/google/tool/i;->d(Lcom/google/tool/i;)Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0xd

    invoke-static {v1, v2}, Lcom/google/tool/d/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/tool/i;->a(Lcom/google/tool/i;Z)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->e(Lcom/google/tool/i;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0}, Lcom/google/tool/i;->f(Lcom/google/tool/i;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v1}, Lcom/google/tool/i;->d(Lcom/google/tool/i;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/google/tool/d/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/google/tool/l;->a:Lcom/google/tool/i;

    invoke-static {v0, v2}, Lcom/google/tool/i;->a(Lcom/google/tool/i;Z)Z

    goto :goto_0
.end method
