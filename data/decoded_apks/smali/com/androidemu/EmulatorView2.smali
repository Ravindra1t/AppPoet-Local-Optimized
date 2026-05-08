.class public Lcom/androidemu/EmulatorView2;
.super Landroid/opengl/GLSurfaceView;
.source "EmulatorView2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androidemu/EmulatorView2$OnTrackballListener;
    }
.end annotation


# static fields
.field public static final SCALING_2X:I = 0x1

.field public static final SCALING_ORIGINAL:I = 0x0

.field public static final SCALING_PROPORTIONAL:I = 0x2

.field public static final SCALING_STRETCH:I = 0x3


# instance fields
.field private actualHeight:I

.field private actualWidth:I

.field private aspectRatio:F

.field private emulator:Lcom/androidemu/Emulator;

.field private onTrackballListener:Lcom/androidemu/EmulatorView2$OnTrackballListener;

.field private scalingMode:I

.field private vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    const/4 v1, 0x2

    iput v1, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    .line 39
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 41
    .local v0, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v0, v3}, Landroid/view/SurfaceHolder;->setKeepScreenOn(Z)V

    .line 45
    const/16 v1, 0xf0

    const/16 v2, 0xa0

    invoke-interface {v0, v1, v2}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 49
    invoke-virtual {p0, v3}, Lcom/androidemu/EmulatorView2;->setFocusableInTouchMode(Z)V

    .line 50
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->requestFocus()Z

    .line 51
    return-void
.end method

.method private updateSurfaceSize()V
    .locals 6

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->getWidth()I

    move-result v2

    .line 81
    .local v2, "viewWidth":I
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->getHeight()I

    move-result v1

    .line 82
    .local v1, "viewHeight":I
    if-eqz v2, :cond_0

    if-eqz v1, :cond_0

    .line 83
    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    if-nez v4, :cond_1

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 86
    :cond_1
    const/4 v3, 0x0

    .line 87
    .local v3, "w":I
    const/4 v0, 0x0

    .line 89
    .local v0, "h":I
    iget v4, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    const/4 v5, 0x3

    if-eq v4, v5, :cond_2

    iget v4, p0, Lcom/androidemu/EmulatorView2;->aspectRatio:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_2

    .line 90
    int-to-float v4, v2

    iget v5, p0, Lcom/androidemu/EmulatorView2;->aspectRatio:F

    div-float/2addr v4, v5

    float-to-int v2, v4

    .line 92
    :cond_2
    iget v4, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    packed-switch v4, :pswitch_data_0

    .line 111
    :cond_3
    :goto_1
    :pswitch_0
    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    if-lt v3, v4, :cond_4

    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    if-ge v0, v4, :cond_5

    .line 112
    :cond_4
    iget v0, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    .line 113
    mul-int v4, v0, v2

    div-int v3, v4, v1

    .line 114
    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    if-ge v3, v4, :cond_5

    .line 115
    iget v3, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    .line 116
    mul-int v4, v3, v1

    div-int v0, v4, v2

    .line 119
    :cond_5
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v4

    invoke-interface {v4, v3, v0}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    goto :goto_0

    .line 94
    :pswitch_1
    move v3, v2

    .line 95
    move v0, v1

    .line 96
    goto :goto_1

    .line 99
    :pswitch_2
    div-int/lit8 v3, v2, 0x2

    .line 100
    div-int/lit8 v0, v1, 0x2

    .line 101
    goto :goto_1

    .line 104
    :pswitch_3
    iget v4, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    mul-int/2addr v4, v2

    iget v5, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    mul-int/2addr v5, v1

    if-lt v4, v5, :cond_3

    .line 105
    iget v3, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    .line 106
    iget v0, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    goto :goto_1

    .line 92
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public getVkeypad()Lcom/androidemu/gba/input/VirtualKeypad;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/androidemu/EmulatorView2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    return-object v0
.end method

.method public onImageUpdate([I)V
    .locals 11
    .param p1, "data"    # [I

    .prologue
    const/16 v3, 0xf0

    const/4 v2, 0x0

    .line 183
    invoke-virtual {p0}, Lcom/androidemu/EmulatorView2;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v10

    .line 184
    .local v10, "holder":Landroid/view/SurfaceHolder;
    invoke-interface {v10}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v0

    .line 185
    .local v0, "canvas":Landroid/graphics/Canvas;
    const/16 v7, 0xa0

    const/4 v9, 0x0

    move-object v1, p1

    move v4, v2

    move v5, v2

    move v6, v3

    move v8, v2

    invoke-virtual/range {v0 .. v9}, Landroid/graphics/Canvas;->drawBitmap([IIIIIIIZLandroid/graphics/Paint;)V

    .line 186
    iget-object v1, p0, Lcom/androidemu/EmulatorView2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/androidemu/EmulatorView2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    invoke-virtual {v1, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->draw(Landroid/graphics/Canvas;)V

    .line 188
    :cond_0
    invoke-interface {v10, v0}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 189
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 150
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 151
    .local v2, "specWidth":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 154
    .local v1, "specHeight":I
    iget v4, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    packed-switch v4, :pswitch_data_0

    .line 175
    :pswitch_0
    invoke-super {p0, p1, p2}, Landroid/opengl/GLSurfaceView;->onMeasure(II)V

    .line 180
    :goto_0
    return-void

    .line 156
    :pswitch_1
    const/16 v3, 0xf0

    .line 157
    .local v3, "w":I
    const/16 v0, 0xa0

    .line 179
    .local v0, "h":I
    :cond_0
    :goto_1
    invoke-virtual {p0, v3, v0}, Lcom/androidemu/EmulatorView2;->setMeasuredDimension(II)V

    goto :goto_0

    .line 160
    .end local v0    # "h":I
    .end local v3    # "w":I
    :pswitch_2
    if-lt v2, v1, :cond_1

    .line 161
    move v3, v2

    .line 162
    .restart local v3    # "w":I
    move v0, v1

    .line 163
    .restart local v0    # "h":I
    goto :goto_1

    .line 167
    .end local v0    # "h":I
    .end local v3    # "w":I
    :cond_1
    :pswitch_3
    move v0, v1

    .line 168
    .restart local v0    # "h":I
    mul-int/lit16 v4, v0, 0xf0

    div-int/lit16 v3, v4, 0xa0

    .line 169
    .restart local v3    # "w":I
    if-le v3, v2, :cond_0

    .line 170
    move v3, v2

    .line 171
    mul-int/lit16 v4, v3, 0xa0

    div-int/lit16 v0, v4, 0xf0

    .line 173
    goto :goto_1

    .line 154
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/androidemu/EmulatorView2;->updateSurfaceSize()V

    .line 125
    return-void
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/androidemu/EmulatorView2;->onTrackballListener:Lcom/androidemu/EmulatorView2$OnTrackballListener;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/androidemu/EmulatorView2;->onTrackballListener:Lcom/androidemu/EmulatorView2$OnTrackballListener;

    invoke-interface {v0, p1}, Lcom/androidemu/EmulatorView2$OnTrackballListener;->onTrackball(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    const/4 v0, 0x1

    .line 133
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/opengl/GLSurfaceView;->onTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public setActualSize(II)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 58
    iget v0, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    if-eq v0, p2, :cond_1

    .line 59
    :cond_0
    iput p1, p0, Lcom/androidemu/EmulatorView2;->actualWidth:I

    .line 60
    iput p2, p0, Lcom/androidemu/EmulatorView2;->actualHeight:I

    .line 61
    invoke-direct {p0}, Lcom/androidemu/EmulatorView2;->updateSurfaceSize()V

    .line 63
    :cond_1
    return-void
.end method

.method public setAspectRatio(F)V
    .locals 1
    .param p1, "ratio"    # F

    .prologue
    .line 73
    iget v0, p0, Lcom/androidemu/EmulatorView2;->aspectRatio:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 74
    iput p1, p0, Lcom/androidemu/EmulatorView2;->aspectRatio:F

    .line 75
    invoke-direct {p0}, Lcom/androidemu/EmulatorView2;->updateSurfaceSize()V

    .line 77
    :cond_0
    return-void
.end method

.method public setEmulator(Lcom/androidemu/Emulator;)V
    .locals 0
    .param p1, "e"    # Lcom/androidemu/Emulator;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/androidemu/EmulatorView2;->emulator:Lcom/androidemu/Emulator;

    .line 148
    return-void
.end method

.method public setOnTrackballListener(Lcom/androidemu/EmulatorView2$OnTrackballListener;)V
    .locals 0
    .param p1, "l"    # Lcom/androidemu/EmulatorView2$OnTrackballListener;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/androidemu/EmulatorView2;->onTrackballListener:Lcom/androidemu/EmulatorView2$OnTrackballListener;

    .line 55
    return-void
.end method

.method public setScalingMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 66
    iget v0, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    if-eq v0, p1, :cond_0

    .line 67
    iput p1, p0, Lcom/androidemu/EmulatorView2;->scalingMode:I

    .line 68
    invoke-direct {p0}, Lcom/androidemu/EmulatorView2;->updateSurfaceSize()V

    .line 70
    :cond_0
    return-void
.end method

.method public setVkeypad(Lcom/androidemu/gba/input/VirtualKeypad;)V
    .locals 0
    .param p1, "vkeypad"    # Lcom/androidemu/gba/input/VirtualKeypad;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/androidemu/EmulatorView2;->vkeypad:Lcom/androidemu/gba/input/VirtualKeypad;

    .line 203
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 144
    iget-object v0, p0, Lcom/androidemu/EmulatorView2;->emulator:Lcom/androidemu/Emulator;

    invoke-virtual {v0, p0, p3, p4}, Lcom/androidemu/Emulator;->setRenderSurface(Lcom/androidemu/EmulatorView2;II)V

    .line 145
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 136
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    const/4 v2, 0x0

    .line 139
    iget-object v0, p0, Lcom/androidemu/EmulatorView2;->emulator:Lcom/androidemu/Emulator;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/androidemu/Emulator;->setRenderSurface(Lcom/androidemu/EmulatorView2;II)V

    .line 140
    return-void
.end method
