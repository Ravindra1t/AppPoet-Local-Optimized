.class public Lcom/androidemu/EmuMedia;
.super Ljava/lang/Object;
.source "EmuMedia.java"


# static fields
.field private static bitmap:Landroid/graphics/Bitmap;

.field private static dirty:Landroid/graphics/Rect;

.field private static firstBlt:Z

.field private static holder:Landroid/view/SurfaceHolder;

.field private static onFrameDrawnListener:Lcom/androidemu/Emulator$OnFrameDrawnListener;

.field private static overlay:Landroid/graphics/Picture;

.field private static region:Landroid/graphics/Rect;

.field private static surfaceHeight:I

.field private static surfaceWidth:I

.field private static track:Landroid/media/AudioTrack;

.field private static volume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    .line 20
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 23
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    move-result v0

    sput v0, Lcom/androidemu/EmuMedia;->volume:F

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static audioCreate(III)Z
    .locals 10
    .param p0, "rate"    # I
    .param p1, "bits"    # I
    .param p2, "channels"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v3, 0x3

    const/4 v0, 0x2

    const/4 v8, 0x1

    .line 134
    const/16 v1, 0x10

    if-ne p1, v1, :cond_0

    move v4, v0

    .line 137
    .local v4, "format":I
    :goto_0
    if-ne p2, v0, :cond_1

    .line 142
    .local v3, "channelConfig":I
    :goto_1
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_2

    .line 143
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v0

    if-ne v0, p0, :cond_2

    .line 144
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioFormat()I

    move-result v0

    if-ne v0, v4, :cond_2

    .line 145
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getChannelCount()I

    move-result v0

    if-ne v0, p2, :cond_2

    move v0, v8

    .line 172
    :goto_2
    return v0

    .end local v3    # "channelConfig":I
    .end local v4    # "format":I
    :cond_0
    move v4, v3

    .line 136
    goto :goto_0

    .restart local v4    # "format":I
    :cond_1
    move v3, v0

    .line 139
    goto :goto_1

    .line 148
    .restart local v3    # "channelConfig":I
    :cond_2
    invoke-static {p0, v3, v4}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v0

    mul-int/lit8 v5, v0, 0x2

    .line 150
    .local v5, "bufferSize":I
    const/16 v0, 0x5dc

    if-ge v5, v0, :cond_3

    .line 151
    const/16 v5, 0x5dc

    .line 154
    :cond_3
    :try_start_0
    new-instance v0, Landroid/media/AudioTrack;

    .line 155
    const/4 v1, 0x3

    .line 160
    const/4 v6, 0x1

    move v2, p0

    .line 154
    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    sput-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    .line 162
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    if-nez v0, :cond_4

    .line 163
    const/4 v0, 0x0

    sput-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :cond_4
    :goto_3
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-nez v0, :cond_5

    .line 169
    const/4 v0, 0x0

    goto :goto_2

    .line 165
    :catch_0
    move-exception v7

    .line 166
    .local v7, "e":Ljava/lang/IllegalArgumentException;
    sput-object v9, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    goto :goto_3

    .line 171
    .end local v7    # "e":Ljava/lang/IllegalArgumentException;
    :cond_5
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    sget v1, Lcom/androidemu/EmuMedia;->volume:F

    sget v2, Lcom/androidemu/EmuMedia;->volume:F

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    move v0, v8

    .line 172
    goto :goto_2
.end method

.method static audioDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 185
    sget-object v0, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 187
    sget-object v0, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 188
    sput-object v1, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    .line 190
    :cond_0
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_1

    .line 191
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 192
    sput-object v1, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    .line 194
    :cond_1
    return-void
.end method

.method static audioPause()V
    .locals 1

    .prologue
    .line 209
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 210
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->pause()V

    .line 211
    :cond_0
    return-void
.end method

.method static audioPlay([BI)V
    .locals 2
    .param p0, "data"    # [B
    .param p1, "size"    # I

    .prologue
    .line 214
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 215
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Landroid/media/AudioTrack;->write([BII)I

    .line 216
    :cond_0
    return-void
.end method

.method static audioSetVolume(I)V
    .locals 5
    .param p0, "vol"    # I

    .prologue
    .line 176
    invoke-static {}, Landroid/media/AudioTrack;->getMinVolume()F

    move-result v1

    .line 177
    .local v1, "min":F
    invoke-static {}, Landroid/media/AudioTrack;->getMaxVolume()F

    move-result v0

    .line 178
    .local v0, "max":F
    sub-float v2, v0, v1

    int-to-float v3, p0

    mul-float/2addr v2, v3

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    add-float/2addr v2, v1

    sput v2, Lcom/androidemu/EmuMedia;->volume:F

    .line 180
    sget-object v2, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v2, :cond_0

    .line 181
    sget-object v2, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    sget v3, Lcom/androidemu/EmuMedia;->volume:F

    sget v4, Lcom/androidemu/EmuMedia;->volume:F

    invoke-virtual {v2, v3, v4}, Landroid/media/AudioTrack;->setStereoVolume(FF)I

    .line 182
    :cond_0
    return-void
.end method

.method static audioStart()V
    .locals 1

    .prologue
    .line 197
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 198
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    .line 199
    :cond_0
    return-void
.end method

.method static audioStop()V
    .locals 1

    .prologue
    .line 202
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 203
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 204
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    .line 206
    :cond_0
    return-void
.end method

.method static bitBlt(Ljava/nio/Buffer;Z)V
    .locals 32
    .param p0, "paramBuffer"    # Ljava/nio/Buffer;
    .param p1, "paramBoolean"    # Z

    .prologue
    .line 66
    sget-object v18, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    .line 67
    .local v18, "localBitmap1":Landroid/graphics/Bitmap;
    if-eqz p0, :cond_0

    .line 69
    sget-object v18, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    .line 70
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 76
    :cond_0
    const/16 v20, 0x0

    .line 77
    .local v20, "localCanvas":Landroid/graphics/Canvas;
    const/16 v31, 0x1

    sput-boolean v31, Lcom/androidemu/EmuMedia;->firstBlt:Z

    .line 78
    if-nez p1, :cond_1

    .line 80
    sget-object v21, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 81
    .local v21, "localRect1":Landroid/graphics/Rect;
    sget-object v22, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    .line 82
    .local v22, "localRect2":Landroid/graphics/Rect;
    invoke-virtual/range {v21 .. v22}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 85
    .end local v21    # "localRect1":Landroid/graphics/Rect;
    .end local v22    # "localRect2":Landroid/graphics/Rect;
    :cond_1
    sget-object v28, Lcom/androidemu/EmuMedia;->holder:Landroid/view/SurfaceHolder;

    .line 86
    .local v28, "localSurfaceHolder":Landroid/view/SurfaceHolder;
    sget-object v23, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 87
    .local v23, "localRect3":Landroid/graphics/Rect;
    sget-object v24, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 88
    .local v24, "localRect4":Landroid/graphics/Rect;
    sget v8, Lcom/androidemu/EmuMedia;->surfaceWidth:I

    .line 89
    .local v8, "i":I
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v16, v0

    .line 90
    .local v16, "j":I
    sub-int v17, v8, v16

    .line 91
    .local v17, "k":I
    move/from16 v0, v17

    move-object/from16 v1, v24

    iput v0, v1, Landroid/graphics/Rect;->left:I

    .line 92
    sget-object v25, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 93
    .local v25, "localRect5":Landroid/graphics/Rect;
    sget v29, Lcom/androidemu/EmuMedia;->surfaceWidth:I

    .line 94
    .local v29, "m":I
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v30, v0

    .line 95
    .local v30, "n":I
    sub-int v9, v29, v30

    .line 96
    .local v9, "i1":I
    move-object/from16 v0, v25

    iput v9, v0, Landroid/graphics/Rect;->right:I

    .line 97
    sget-object v26, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 98
    .local v26, "localRect6":Landroid/graphics/Rect;
    sget v10, Lcom/androidemu/EmuMedia;->surfaceHeight:I

    .line 99
    .local v10, "i2":I
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v11, v0, Landroid/graphics/Rect;->bottom:I

    .line 100
    .local v11, "i3":I
    sub-int v12, v10, v11

    .line 101
    .local v12, "i4":I
    move-object/from16 v0, v26

    iput v12, v0, Landroid/graphics/Rect;->top:I

    .line 102
    sget-object v27, Lcom/androidemu/EmuMedia;->dirty:Landroid/graphics/Rect;

    .line 103
    .local v27, "localRect7":Landroid/graphics/Rect;
    sget v13, Lcom/androidemu/EmuMedia;->surfaceHeight:I

    .line 104
    .local v13, "i5":I
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v14, v0, Landroid/graphics/Rect;->top:I

    .line 105
    .local v14, "i6":I
    sub-int v15, v13, v14

    .line 106
    .local v15, "i7":I
    move-object/from16 v0, v27

    iput v15, v0, Landroid/graphics/Rect;->bottom:I

    .line 107
    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v20

    .line 109
    if-eqz v18, :cond_5

    .line 110
    sget-boolean v3, Lcom/androidemu/EmuMedia;->firstBlt:Z

    .line 112
    .local v3, "bool":Z
    const/high16 v31, -0x1000000

    move-object/from16 v0, v20

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 113
    if-eqz p1, :cond_2

    .line 115
    sget v31, Lcom/androidemu/EmuMedia;->surfaceWidth:I

    div-int/lit8 v31, v31, 0x2

    move/from16 v0, v31

    int-to-float v4, v0

    .line 116
    .local v4, "f1":F
    sget v31, Lcom/androidemu/EmuMedia;->surfaceHeight:I

    div-int/lit8 v31, v31, 0x2

    move/from16 v0, v31

    int-to-float v5, v0

    .line 117
    .local v5, "f2":F
    const v31, 0x4e866800

    move-object/from16 v0, v20

    move/from16 v1, v31

    invoke-virtual {v0, v1, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 119
    .end local v4    # "f1":F
    .end local v5    # "f2":F
    :cond_2
    move-object/from16 v19, v18

    .line 120
    .local v19, "localBitmap2":Landroid/graphics/Bitmap;
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v31, v0

    move/from16 v0, v31

    int-to-float v6, v0

    .line 121
    .local v6, "f3":F
    sget-object v31, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    move-object/from16 v0, v31

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v31, v0

    move/from16 v0, v31

    int-to-float v7, v0

    .line 122
    .local v7, "f4":F
    const/16 v31, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v6, v7, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 123
    sget-object v31, Lcom/androidemu/EmuMedia;->overlay:Landroid/graphics/Picture;

    if-eqz v31, :cond_3

    .line 124
    sget-object v31, Lcom/androidemu/EmuMedia;->overlay:Landroid/graphics/Picture;

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/graphics/Picture;->draw(Landroid/graphics/Canvas;)V

    .line 125
    :cond_3
    sget-object v31, Lcom/androidemu/EmuMedia;->onFrameDrawnListener:Lcom/androidemu/Emulator$OnFrameDrawnListener;

    if-eqz v31, :cond_4

    .line 126
    sget-object v31, Lcom/androidemu/EmuMedia;->onFrameDrawnListener:Lcom/androidemu/Emulator$OnFrameDrawnListener;

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/androidemu/Emulator$OnFrameDrawnListener;->onFrameDrawn(Landroid/graphics/Canvas;)V

    .line 127
    :cond_4
    sget-object v31, Lcom/androidemu/EmuMedia;->holder:Landroid/view/SurfaceHolder;

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 131
    .end local v3    # "bool":Z
    .end local v6    # "f3":F
    .end local v7    # "f4":F
    .end local v19    # "localBitmap2":Landroid/graphics/Bitmap;
    :cond_5
    return-void
.end method

.method static destroy()V
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    .line 33
    sget-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/androidemu/EmuMedia;->track:Landroid/media/AudioTrack;

    .line 36
    :cond_0
    return-void
.end method

.method public static setOnFrameDrawnListener(Lcom/androidemu/Emulator$OnFrameDrawnListener;)V
    .locals 0
    .param p0, "l"    # Lcom/androidemu/Emulator$OnFrameDrawnListener;

    .prologue
    .line 40
    sput-object p0, Lcom/androidemu/EmuMedia;->onFrameDrawnListener:Lcom/androidemu/Emulator$OnFrameDrawnListener;

    .line 41
    return-void
.end method

.method static setOverlay(Landroid/graphics/Picture;)V
    .locals 0
    .param p0, "paramPicture"    # Landroid/graphics/Picture;

    .prologue
    .line 219
    sput-object p0, Lcom/androidemu/EmuMedia;->overlay:Landroid/graphics/Picture;

    .line 220
    return-void
.end method

.method static setSurface(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p0, "h"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 44
    sput-object p0, Lcom/androidemu/EmuMedia;->holder:Landroid/view/SurfaceHolder;

    .line 45
    return-void
.end method

.method static setSurfaceRegion(IIIIII)Landroid/graphics/Bitmap;
    .locals 7
    .param p0, "paramInt1"    # I
    .param p1, "paramInt2"    # I
    .param p2, "paramInt3"    # I
    .param p3, "paramInt4"    # I
    .param p4, "paramInt5"    # I
    .param p5, "paramInt6"    # I

    .prologue
    .line 48
    sget-boolean v0, Lcom/androidemu/EmuMedia;->firstBlt:Z

    .line 49
    .local v0, "bool":Z
    sput p0, Lcom/androidemu/EmuMedia;->surfaceWidth:I

    .line 50
    sput p1, Lcom/androidemu/EmuMedia;->surfaceHeight:I

    .line 51
    sget-object v4, Lcom/androidemu/EmuMedia;->region:Landroid/graphics/Rect;

    .line 52
    .local v4, "localRect":Landroid/graphics/Rect;
    add-int v1, p2, p4

    .line 53
    .local v1, "i":I
    add-int v2, p3, p5

    .line 54
    .local v2, "j":I
    invoke-virtual {v4, p2, p3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 55
    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_0

    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    if-ne v5, p4, :cond_0

    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-eq v5, p5, :cond_2

    .line 57
    :cond_0
    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_1

    .line 58
    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 59
    :cond_1
    sget-object v3, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    .line 60
    .local v3, "localConfig":Landroid/graphics/Bitmap$Config;
    const/16 v5, 0xf0

    const/16 v6, 0xa0

    invoke-static {v5, v6, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    sput-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    .line 62
    .end local v3    # "localConfig":Landroid/graphics/Bitmap$Config;
    :cond_2
    sget-object v5, Lcom/androidemu/EmuMedia;->bitmap:Landroid/graphics/Bitmap;

    return-object v5
.end method
