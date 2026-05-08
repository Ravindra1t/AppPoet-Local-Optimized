.class Lcom/androidemu/gba/input/VirtualKeypad$Control;
.super Ljava/lang/Object;
.source "VirtualKeypad.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androidemu/gba/input/VirtualKeypad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Control"
.end annotation


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private bounds:Landroid/graphics/RectF;

.field private disabled:Z

.field private hidden:Z

.field private resId:I


# direct methods
.method constructor <init>(I)V
    .locals 1
    .param p1, "r"    # I

    .prologue
    .line 404
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 402
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    .line 405
    iput p1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->resId:I

    .line 406
    return-void
.end method

.method static synthetic access$0(Lcom/androidemu/gba/input/VirtualKeypad$Control;)Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 401
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method


# virtual methods
.method final disable(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 433
    iput-boolean p1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->disabled:Z

    .line 434
    return-void
.end method

.method final draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 459
    iget-boolean v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hidden:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->disabled:Z

    if-nez v0, :cond_0

    .line 460
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 461
    :cond_0
    return-void
.end method

.method final getHeight()I
    .locals 1

    .prologue
    .line 421
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    return v0
.end method

.method final getWidth()I
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    return v0
.end method

.method final getX()F
    .locals 1

    .prologue
    .line 409
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    return v0
.end method

.method final getY()F
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    return v0
.end method

.method final hide(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 429
    iput-boolean p1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hidden:Z

    .line 430
    return-void
.end method

.method final hitTest(FF)Z
    .locals 1
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 437
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    return v0
.end method

.method final isEnabled()Z
    .locals 1

    .prologue
    .line 425
    iget-boolean v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->disabled:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method final load(Landroid/content/res/Resources;FF)V
    .locals 4
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "sx"    # F
    .param p3, "sy"    # F

    .prologue
    .line 445
    iget v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->resId:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    .line 446
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    .line 447
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    float-to-int v1, v1

    .line 448
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p3

    float-to-int v2, v2

    const/4 v3, 0x1

    .line 446
    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    .line 449
    return-void
.end method

.method final move(FF)V
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 441
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bounds:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, p2

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 442
    return-void
.end method

.method final reload(Landroid/content/res/Resources;I)V
    .locals 4
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "id"    # I

    .prologue
    .line 452
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 453
    .local v1, "w":I
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 454
    .local v0, "h":I
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    .line 455
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x1

    invoke-static {v2, v1, v0, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad$Control;->bitmap:Landroid/graphics/Bitmap;

    .line 456
    return-void
.end method
