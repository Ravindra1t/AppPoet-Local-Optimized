.class public Lcom/androidemu/EmulatorView;
.super Landroid/view/SurfaceView;
.source "EmulatorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androidemu/EmulatorView$OnTrackballListener;
    }
.end annotation


# static fields
.field public static final SCALING_2X:I = 0x1

.field public static final SCALING_ORIGINAL:I = 0x0

.field public static final SCALING_PROPORTIONAL:I = 0x2

.field public static final SCALING_STRETCH:I = 0x3


# instance fields
.field private onTrackballListener:Lcom/androidemu/EmulatorView$OnTrackballListener;

.field private scalingMode:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "paramContext"    # Landroid/content/Context;
    .param p2, "paramAttributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x1

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const/4 v1, 0x2

    iput v1, p0, Lcom/androidemu/EmulatorView;->scalingMode:I

    .line 21
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 22
    .local v0, "localSurfaceHolder":Landroid/view/SurfaceHolder;
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 23
    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->setKeepScreenOn(Z)V

    .line 24
    invoke-virtual {p0, v2}, Lcom/androidemu/EmulatorView;->setFocusableInTouchMode(Z)V

    .line 25
    return-void
.end method

.method private updateSurfaceSize()V
    .locals 8

    .prologue
    .line 29
    const/16 v0, 0xf0

    .line 30
    .local v0, "i":I
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView;->getWidth()I

    move-result v3

    .line 31
    .local v3, "j":I
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView;->getHeight()I

    move-result v4

    .line 32
    .local v4, "k":I
    if-eqz v3, :cond_0

    if-nez v4, :cond_1

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 34
    :cond_1
    const/4 v5, 0x0

    .line 35
    .local v5, "m":I
    const/4 v6, 0x0

    .line 36
    .local v6, "n":I
    iget v7, p0, Lcom/androidemu/EmulatorView;->scalingMode:I

    .line 46
    if-lt v5, v0, :cond_2

    const/16 v7, 0xa0

    if-ge v6, v7, :cond_3

    .line 48
    :cond_2
    const/16 v6, 0xa0

    .line 49
    mul-int v7, v6, v3

    div-int v5, v7, v4

    .line 50
    if-ge v5, v0, :cond_3

    .line 52
    const/16 v5, 0xf0

    .line 53
    mul-int v7, v5, v4

    div-int v6, v7, v3

    .line 56
    :cond_3
    add-int/lit8 v7, v5, 0x3

    and-int/lit8 v1, v7, -0x4

    .line 57
    .local v1, "i1":I
    add-int/lit8 v7, v6, 0x3

    and-int/lit8 v2, v7, -0x4

    .line 58
    .local v2, "i2":I
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v7

    invoke-interface {v7, v5, v6}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    goto :goto_0
.end method


# virtual methods
.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "paramInt1"    # I
    .param p2, "paramInt2"    # I
    .param p3, "paramInt3"    # I
    .param p4, "paramInt4"    # I

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/androidemu/EmulatorView;->updateSurfaceSize()V

    .line 67
    return-void
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "paramMotionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/androidemu/EmulatorView;->onTrackballListener:Lcom/androidemu/EmulatorView$OnTrackballListener;

    .line 72
    .local v1, "localObject":Lcom/androidemu/EmulatorView$OnTrackballListener;
    const/4 v0, 0x1

    .line 73
    .local v0, "i":Z
    if-eqz v1, :cond_0

    .line 75
    iget-object v2, p0, Lcom/androidemu/EmulatorView;->onTrackballListener:Lcom/androidemu/EmulatorView$OnTrackballListener;

    invoke-interface {v2, p1}, Lcom/androidemu/EmulatorView$OnTrackballListener;->onTrackball(Landroid/view/MotionEvent;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 76
    .local v1, "localObject":Ljava/lang/Boolean;
    if-eqz v1, :cond_0

    .line 77
    const/4 v0, 0x1

    .line 82
    .end local v1    # "localObject":Ljava/lang/Boolean;
    :cond_0
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->onTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2
.end method

.method public setOnTrackballListener(Lcom/androidemu/EmulatorView$OnTrackballListener;)V
    .locals 0
    .param p1, "paramOnTrackballListener"    # Lcom/androidemu/EmulatorView$OnTrackballListener;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/androidemu/EmulatorView;->onTrackballListener:Lcom/androidemu/EmulatorView$OnTrackballListener;

    .line 89
    return-void
.end method

.method public setScalingMode(I)V
    .locals 1
    .param p1, "paramInt"    # I

    .prologue
    .line 93
    iget v0, p0, Lcom/androidemu/EmulatorView;->scalingMode:I

    if-eq v0, p1, :cond_0

    .line 95
    iput p1, p0, Lcom/androidemu/EmulatorView;->scalingMode:I

    .line 96
    invoke-direct {p0}, Lcom/androidemu/EmulatorView;->updateSurfaceSize()V

    .line 98
    :cond_0
    return-void
.end method
