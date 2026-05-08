.class public Lcom/androidemu/gba/input/VirtualKeypad;
.super Ljava/lang/Object;
.source "VirtualKeypad.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/androidemu/gba/input/VirtualKeypad$Control;
    }
.end annotation


# static fields
.field private static final BUTTONS_4WAY:[I

.field private static final DPAD_4WAY:[I

.field private static final DPAD_DEADZONE_VALUES:[F


# instance fields
.field private buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

.field private context:Landroid/content/Context;

.field private controls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/androidemu/gba/input/VirtualKeypad$Control;",
            ">;"
        }
    .end annotation
.end field

.field private dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

.field private dpad4Way:Z

.field private dpadDeadZone:F

.field private emulator:Lcom/androidemu/Emulator;

.field private gameKeyListener:Lcom/androidemu/gba/input/GameKeyListener;

.field private inBetweenPress:Z

.field private keyStates:I

.field private leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

.field private pointSizeThreshold:F

.field private rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

.field private scaleX:F

.field private scaleY:F

.field private selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

.field private transparency:I

.field private vibrator:Landroid/os/Vibrator;

.field private vibratorEnabled:Z

.field private view:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 23
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androidemu/gba/input/VirtualKeypad;->DPAD_4WAY:[I

    .line 30
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/androidemu/gba/input/VirtualKeypad;->BUTTONS_4WAY:[I

    .line 37
    const/4 v0, 0x5

    new-array v0, v0, [F

    fill-array-data v0, :array_2

    sput-object v0, Lcom/androidemu/gba/input/VirtualKeypad;->DPAD_DEADZONE_VALUES:[F

    .line 21
    return-void

    .line 23
    :array_0
    .array-data 4
        0x20
        0x40
        0x10
        0x80
    .end array-data

    .line 30
    :array_1
    .array-data 4
        0x20000
        0x10000
        0x1
        0x2
    .end array-data

    .line 37
    :array_2
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3e0f5c29    # 0.14f
        0x3e2ab368    # 0.1667f
        0x3e4ccccd    # 0.2f
        0x3e800000    # 0.25f
    .end array-data
.end method

.method public constructor <init>(Landroid/view/View;Lcom/androidemu/gba/input/GameKeyListener;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "l"    # Lcom/androidemu/gba/input/GameKeyListener;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    sget-object v0, Lcom/androidemu/gba/input/VirtualKeypad;->DPAD_DEADZONE_VALUES:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->controls:Ljava/util/ArrayList;

    .line 63
    invoke-static {}, Lcom/androidemu/Emulator;->getInstance()Lcom/androidemu/Emulator;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->emulator:Lcom/androidemu/Emulator;

    .line 66
    iput-object p1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    .line 67
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    .line 68
    iput-object p2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->gameKeyListener:Lcom/androidemu/gba/input/GameKeyListener;

    .line 70
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    .line 71
    const-string v1, "vibrator"

    .line 70
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->vibrator:Landroid/os/Vibrator;

    .line 73
    const v0, 0x7f020002

    invoke-direct {p0, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 74
    const v0, 0x7f020001

    invoke-direct {p0, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 75
    const v0, 0x7f02000c

    invoke-direct {p0, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 76
    const v0, 0x7f02000e

    invoke-direct {p0, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 77
    const v0, 0x7f020010

    invoke-direct {p0, v0}, Lcom/androidemu/gba/input/VirtualKeypad;->createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 78
    return-void
.end method

.method private createControl(I)Lcom/androidemu/gba/input/VirtualKeypad$Control;
    .locals 2
    .param p1, "resId"    # I

    .prologue
    .line 151
    new-instance v0, Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-direct {v0, p1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;-><init>(I)V

    .line 152
    .local v0, "c":Lcom/androidemu/gba/input/VirtualKeypad$Control;
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->controls:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    return-object v0
.end method

.method private findControl(FF)Lcom/androidemu/gba/input/VirtualKeypad$Control;
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 332
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->controls:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 336
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 332
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 333
    .local v0, "c":Lcom/androidemu/gba/input/VirtualKeypad$Control;
    invoke-virtual {v0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hitTest(FF)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method private get4WayDirection(FF)I
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/high16 v0, 0x3f000000    # 0.5f

    const/4 v2, 0x0

    .line 267
    sub-float/2addr p1, v0

    .line 268
    sub-float/2addr p2, v0

    .line 270
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_1

    .line 271
    cmpg-float v0, p1, v2

    if-gez v0, :cond_0

    const/4 v0, 0x0

    .line 272
    :goto_0
    return v0

    .line 271
    :cond_0
    const/4 v0, 0x2

    goto :goto_0

    .line 272
    :cond_1
    cmpg-float v0, p2, v2

    if-gez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    goto :goto_0
.end method

.method private getButtonsStates(FFF)I
    .locals 3
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "size"    # F

    .prologue
    .line 296
    sget-object v1, Lcom/androidemu/gba/input/VirtualKeypad;->BUTTONS_4WAY:[I

    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->get4WayDirection(FF)I

    move-result v2

    aget v0, v1, v2

    .line 298
    .local v0, "states":I
    iget v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->pointSizeThreshold:F

    cmpl-float v1, p3, v1

    if-lez v1, :cond_0

    .line 299
    sparse-switch v0, :sswitch_data_0

    .line 310
    :cond_0
    :goto_0
    return v0

    .line 302
    :sswitch_0
    const v0, 0x20002

    .line 303
    goto :goto_0

    .line 306
    :sswitch_1
    const v0, 0x10001

    goto :goto_0

    .line 299
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0x10000 -> :sswitch_1
        0x20000 -> :sswitch_0
    .end sparse-switch
.end method

.method private static getControlScale(Landroid/content/SharedPreferences;)F
    .locals 3
    .param p0, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 142
    const-string v1, "vkeypadSize"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "value":Ljava/lang/String;
    const-string v1, "small"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    const/high16 v1, 0x3f800000    # 1.0f

    .line 147
    :goto_0
    return v1

    .line 145
    :cond_0
    const-string v1, "large"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    const v1, 0x3faaaa8f

    goto :goto_0

    .line 147
    :cond_1
    const v1, 0x3f99999a    # 1.2f

    goto :goto_0
.end method

.method private getControlStates(Lcom/androidemu/gba/input/VirtualKeypad$Control;FFF)I
    .locals 2
    .param p1, "c"    # Lcom/androidemu/gba/input/VirtualKeypad$Control;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "size"    # F

    .prologue
    .line 340
    invoke-virtual {p1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getX()F

    move-result v0

    sub-float v0, p2, v0

    invoke-virtual {p1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float p2, v0, v1

    .line 341
    invoke-virtual {p1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getY()F

    move-result v0

    sub-float v0, p3, v0

    invoke-virtual {p1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float p3, v0, v1

    .line 343
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    if-ne p1, v0, :cond_0

    .line 344
    invoke-direct {p0, p2, p3}, Lcom/androidemu/gba/input/VirtualKeypad;->getDpadStates(FF)I

    move-result v0

    .line 354
    :goto_0
    return v0

    .line 345
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    if-ne p1, v0, :cond_1

    .line 346
    invoke-direct {p0, p2, p3, p4}, Lcom/androidemu/gba/input/VirtualKeypad;->getButtonsStates(FFF)I

    move-result v0

    goto :goto_0

    .line 347
    :cond_1
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    if-ne p1, v0, :cond_2

    .line 348
    invoke-direct {p0, p2, p3}, Lcom/androidemu/gba/input/VirtualKeypad;->getSelectStartStates(FF)I

    move-result v0

    goto :goto_0

    .line 349
    :cond_2
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    if-ne p1, v0, :cond_3

    .line 350
    const/16 v0, 0x200

    goto :goto_0

    .line 351
    :cond_3
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    if-ne p1, v0, :cond_4

    .line 352
    const/16 v0, 0x100

    goto :goto_0

    .line 354
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDpadStates(FF)I
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/high16 v4, 0x3f000000    # 0.5f

    .line 276
    iget-boolean v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad4Way:Z

    if-eqz v3, :cond_1

    .line 277
    sget-object v3, Lcom/androidemu/gba/input/VirtualKeypad;->DPAD_4WAY:[I

    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->get4WayDirection(FF)I

    move-result v4

    aget v2, v3, v4

    .line 292
    :cond_0
    :goto_0
    return v2

    .line 279
    :cond_1
    const/high16 v0, 0x3f000000    # 0.5f

    .line 280
    .local v0, "cx":F
    const/high16 v1, 0x3f000000    # 0.5f

    .line 281
    .local v1, "cy":F
    const/4 v2, 0x0

    .line 283
    .local v2, "states":I
    iget v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    sub-float v3, v4, v3

    cmpg-float v3, p1, v3

    if-gez v3, :cond_3

    .line 284
    or-int/lit8 v2, v2, 0x20

    .line 287
    :cond_2
    :goto_1
    iget v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    sub-float v3, v4, v3

    cmpg-float v3, p2, v3

    if-gez v3, :cond_4

    .line 288
    or-int/lit8 v2, v2, 0x40

    goto :goto_0

    .line 285
    :cond_3
    iget v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    add-float/2addr v3, v4

    cmpl-float v3, p1, v3

    if-lez v3, :cond_2

    .line 286
    or-int/lit8 v2, v2, 0x10

    goto :goto_1

    .line 289
    :cond_4
    iget v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    add-float/2addr v3, v4

    cmpl-float v3, p2, v3

    if-lez v3, :cond_0

    .line 290
    or-int/lit16 v2, v2, 0x80

    goto :goto_0
.end method

.method private getEventX(Landroid/view/MotionEvent;IZ)F
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "index"    # I
    .param p3, "flip"    # Z

    .prologue
    .line 318
    invoke-static {p1, p2}, Lcom/androidemu/gba/wrapper/Wrapper;->MotionEvent_getX(Landroid/view/MotionEvent;I)F

    move-result v0

    .line 319
    .local v0, "x":F
    if-eqz p3, :cond_0

    .line 320
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    int-to-float v1, v1

    sub-float v0, v1, v0

    .line 321
    :cond_0
    iget v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleX:F

    mul-float/2addr v1, v0

    return v1
.end method

.method private getEventY(Landroid/view/MotionEvent;IZ)F
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "index"    # I
    .param p3, "flip"    # Z

    .prologue
    .line 325
    invoke-static {p1, p2}, Lcom/androidemu/gba/wrapper/Wrapper;->MotionEvent_getY(Landroid/view/MotionEvent;I)F

    move-result v0

    .line 326
    .local v0, "y":F
    if-eqz p3, :cond_0

    .line 327
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    sub-float v0, v1, v0

    .line 328
    :cond_0
    iget v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleY:F

    mul-float/2addr v1, v0

    return v1
.end method

.method private getSelectStartStates(FF)I
    .locals 1
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 314
    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/4 v0, 0x4

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private makeBottomBottom(II)V
    .locals 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v4, 0x0

    .line 157
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    add-int/2addr v1, v2

    if-le v1, p1, :cond_0

    .line 158
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeBottomTop(II)V

    .line 175
    :goto_0
    return-void

    .line 162
    :cond_0
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v4, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 163
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 164
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1, v4, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 165
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 167
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    .line 168
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    .line 167
    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 169
    .local v0, "x":I
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 170
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    goto :goto_0

    .line 172
    :cond_1
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    sub-int v1, p1, v1

    div-int/lit8 v0, v1, 0x2

    .line 173
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    invoke-virtual {v1, v2, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    goto :goto_0
.end method

.method private makeBottomTop(II)V
    .locals 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v4, 0x0

    .line 217
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v4, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 218
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 220
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 221
    const v3, 0x7f02000f

    .line 220
    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->reload(Landroid/content/res/Resources;I)V

    .line 222
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1, v4, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 223
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    .line 224
    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    .line 223
    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 226
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    .line 227
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    .line 226
    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 228
    .local v0, "x":I
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 229
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 235
    :goto_0
    return-void

    .line 231
    :cond_0
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 232
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    .line 233
    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    iget-object v4, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    .line 232
    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    goto :goto_0
.end method

.method private makeTopBottom(II)V
    .locals 5
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v4, 0x0

    .line 198
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1, v4, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 199
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 201
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 202
    const v3, 0x7f02000d

    .line 201
    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->reload(Landroid/content/res/Resources;I)V

    .line 203
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v4, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 204
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int v2, p1, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2, v4}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 206
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    .line 207
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    .line 206
    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 208
    .local v0, "x":I
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 209
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    sub-int v3, p2, v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 214
    :goto_0
    return-void

    .line 211
    :cond_0
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v0, v1, 0x2

    .line 212
    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    int-to-float v2, v0

    iget-object v3, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    goto :goto_0
.end method

.method private makeTopTop(II)V
    .locals 4
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v3, 0x0

    .line 178
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v0}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    add-int/2addr v0, v1

    if-le v0, p1, :cond_0

    .line 179
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeBottomTop(II)V

    .line 195
    :goto_0
    return-void

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v0, v3, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 183
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    sub-int v1, p1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1, v3}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 185
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 186
    const v2, 0x7f02000d

    .line 185
    invoke-virtual {v0, v1, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->reload(Landroid/content/res/Resources;I)V

    .line 187
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 188
    const v2, 0x7f02000f

    .line 187
    invoke-virtual {v0, v1, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->reload(Landroid/content/res/Resources;I)V

    .line 189
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v1

    sub-int v1, p2, v1

    int-to-float v1, v1

    invoke-virtual {v0, v3, v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 190
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    sub-int v1, p1, v1

    int-to-float v1, v1

    .line 191
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    .line 190
    invoke-virtual {v0, v1, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    .line 193
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    iget-object v1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getWidth()I

    move-result v1

    sub-int v1, p1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    .line 194
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-virtual {v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->getHeight()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    .line 193
    invoke-virtual {v0, v1, v2}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->move(FF)V

    goto :goto_0
.end method

.method private reposition(IILandroid/content/SharedPreferences;)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "prefs"    # Landroid/content/SharedPreferences;

    .prologue
    .line 238
    const-string v1, "vkeypadLayout"

    const-string v2, "bottom_bottom"

    invoke-interface {p3, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 240
    .local v0, "layout":Ljava/lang/String;
    const-string v1, "top_bottom"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 241
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeTopBottom(II)V

    .line 248
    :goto_0
    return-void

    .line 242
    :cond_0
    const-string v1, "bottom_top"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 243
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeBottomTop(II)V

    goto :goto_0

    .line 244
    :cond_1
    const-string v1, "top_top"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 245
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeTopTop(II)V

    goto :goto_0

    .line 247
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->makeBottomBottom(II)V

    goto :goto_0
.end method

.method private setKeyStates(I)V
    .locals 3
    .param p1, "newStates"    # I

    .prologue
    .line 255
    iget v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->keyStates:I

    if-ne v0, p1, :cond_0

    .line 264
    :goto_0
    return-void

    .line 258
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->vibratorEnabled:Z

    .line 259
    iget-boolean v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->vibratorEnabled:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->keyStates:I

    invoke-direct {p0, v0, p1}, Lcom/androidemu/gba/input/VirtualKeypad;->shouldVibrate(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 260
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->vibrator:Landroid/os/Vibrator;

    const-wide/16 v1, 0x21

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    .line 262
    :cond_1
    iput p1, p0, Lcom/androidemu/gba/input/VirtualKeypad;->keyStates:I

    .line 263
    iget-object v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->gameKeyListener:Lcom/androidemu/gba/input/GameKeyListener;

    invoke-interface {v0}, Lcom/androidemu/gba/input/GameKeyListener;->onGameKeyChanged()V

    goto :goto_0
.end method

.method private shouldVibrate(II)Z
    .locals 1
    .param p1, "oldStates"    # I
    .param p2, "newStates"    # I

    .prologue
    .line 251
    xor-int v0, p1, p2

    and-int/2addr v0, p2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final destroy()V
    .locals 0

    .prologue
    .line 89
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 134
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 135
    .local v1, "paint":Landroid/graphics/Paint;
    iget v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->transparency:I

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x1e

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 137
    iget-object v2, p0, Lcom/androidemu/gba/input/VirtualKeypad;->controls:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 139
    return-void

    .line 137
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 138
    .local v0, "c":Lcom/androidemu/gba/input/VirtualKeypad$Control;
    invoke-virtual {v0, p1, v1}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public final getKeyStates()I
    .locals 1

    .prologue
    .line 81
    iget v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->keyStates:I

    return v0
.end method

.method public onTouch(Landroid/view/MotionEvent;Z)Z
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "flip"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 359
    iget-object v10, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    invoke-static {v10}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->access$0(Lcom/androidemu/gba/input/VirtualKeypad$Control;)Landroid/graphics/Bitmap;

    move-result-object v10

    if-nez v10, :cond_0

    .line 393
    :goto_0
    return v8

    .line 362
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 364
    .local v0, "action":I
    const/4 v4, -0x1

    .line 366
    .local v4, "pointerUpId":I
    and-int/lit16 v10, v0, 0xff

    packed-switch v10, :pswitch_data_0

    goto :goto_0

    .line 381
    :pswitch_0
    const/4 v5, 0x0

    .line 382
    .local v5, "states":I
    invoke-static {p1}, Lcom/androidemu/gba/wrapper/Wrapper;->MotionEvent_getPointerCount(Landroid/view/MotionEvent;)I

    move-result v3

    .line 383
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-lt v2, v3, :cond_1

    .line 392
    invoke-direct {p0, v5}, Lcom/androidemu/gba/input/VirtualKeypad;->setKeyStates(I)V

    move v8, v9

    .line 393
    goto :goto_0

    .line 369
    .end local v2    # "i":I
    .end local v3    # "n":I
    .end local v5    # "states":I
    :pswitch_1
    invoke-direct {p0, v8}, Lcom/androidemu/gba/input/VirtualKeypad;->setKeyStates(I)V

    move v8, v9

    .line 370
    goto :goto_0

    .line 384
    .restart local v2    # "i":I
    .restart local v3    # "n":I
    .restart local v5    # "states":I
    :cond_1
    invoke-direct {p0, p1, v2, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->getEventX(Landroid/view/MotionEvent;IZ)F

    move-result v6

    .line 385
    .local v6, "x":F
    invoke-direct {p0, p1, v2, p2}, Lcom/androidemu/gba/input/VirtualKeypad;->getEventY(Landroid/view/MotionEvent;IZ)F

    move-result v7

    .line 386
    .local v7, "y":F
    invoke-direct {p0, v6, v7}, Lcom/androidemu/gba/input/VirtualKeypad;->findControl(FF)Lcom/androidemu/gba/input/VirtualKeypad$Control;

    move-result-object v1

    .line 387
    .local v1, "c":Lcom/androidemu/gba/input/VirtualKeypad$Control;
    if-eqz v1, :cond_2

    .line 389
    invoke-static {p1, v2}, Lcom/androidemu/gba/wrapper/Wrapper;->MotionEvent_getSize(Landroid/view/MotionEvent;I)F

    move-result v8

    invoke-direct {p0, v1, v6, v7, v8}, Lcom/androidemu/gba/input/VirtualKeypad;->getControlStates(Lcom/androidemu/gba/input/VirtualKeypad$Control;FFF)I

    move-result v8

    or-int/2addr v5, v8

    .line 383
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 366
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    iput v0, p0, Lcom/androidemu/gba/input/VirtualKeypad;->keyStates:I

    .line 86
    return-void
.end method

.method public final resize(II)V
    .locals 15
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 93
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-static {v12}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 94
    .local v6, "prefs":Landroid/content/SharedPreferences;
    const-string v12, "enableVibrator"

    const/4 v13, 0x1

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->vibratorEnabled:Z

    .line 95
    const-string v12, "dpad4Way"

    const/4 v13, 0x0

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad4Way:Z

    .line 97
    const-string v12, "dpadDeadZone"

    const/4 v13, 0x2

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 98
    .local v11, "value":I
    if-gez v11, :cond_2

    const/4 v11, 0x0

    .line 99
    :cond_0
    :goto_0
    sget-object v12, Lcom/androidemu/gba/input/VirtualKeypad;->DPAD_DEADZONE_VALUES:[F

    aget v12, v12, v11

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpadDeadZone:F

    .line 101
    const-string v12, "inBetweenPress"

    const/4 v13, 0x0

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    iput-boolean v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->inBetweenPress:Z

    .line 103
    const/high16 v12, 0x3f800000    # 1.0f

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->pointSizeThreshold:F

    .line 104
    const-string v12, "pointSizePress"

    const/4 v13, 0x0

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 105
    const-string v12, "pointSizePressThreshold"

    const/4 v13, 0x7

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    .line 106
    .local v10, "threshold":I
    int-to-float v12, v10

    const/high16 v13, 0x41200000    # 10.0f

    div-float/2addr v12, v13

    const v13, 0x3c23d70a    # 0.01f

    sub-float/2addr v12, v13

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->pointSizeThreshold:F

    .line 109
    .end local v10    # "threshold":I
    :cond_1
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->dpad:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    const-string v13, "hideDpad"

    const/4 v14, 0x0

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    invoke-virtual {v12, v13}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hide(Z)V

    .line 110
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->buttons:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    const-string v13, "hideButtons"

    const/4 v14, 0x0

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    invoke-virtual {v12, v13}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hide(Z)V

    .line 111
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->selectStart:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    const-string v13, "hideSelectStart"

    const/4 v14, 0x0

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    invoke-virtual {v12, v13}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hide(Z)V

    .line 112
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->leftShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    const-string v13, "hideShoulders"

    const/4 v14, 0x0

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    invoke-virtual {v12, v13}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hide(Z)V

    .line 113
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->rightShoulder:Lcom/androidemu/gba/input/VirtualKeypad$Control;

    const-string v13, "hideShoulders"

    const/4 v14, 0x0

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    invoke-virtual {v12, v13}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->hide(Z)V

    .line 115
    move/from16 v0, p1

    int-to-float v12, v0

    iget-object v13, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getWidth()I

    move-result v13

    int-to-float v13, v13

    div-float/2addr v12, v13

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleX:F

    .line 116
    move/from16 v0, p2

    int-to-float v12, v0

    iget-object v13, p0, Lcom/androidemu/gba/input/VirtualKeypad;->view:Landroid/view/View;

    invoke-virtual {v13}, Landroid/view/View;->getHeight()I

    move-result v13

    int-to-float v13, v13

    div-float/2addr v12, v13

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleY:F

    .line 118
    invoke-static {v6}, Lcom/androidemu/gba/input/VirtualKeypad;->getControlScale(Landroid/content/SharedPreferences;)F

    move-result v2

    .line 119
    .local v2, "controlScale":F
    iget v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleX:F

    mul-float v8, v12, v2

    .line 120
    .local v8, "sx":F
    iget v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleY:F

    mul-float v9, v12, v2

    .line 121
    .local v9, "sy":F
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 122
    .local v7, "res":Landroid/content/res/Resources;
    iget-object v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->controls:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-nez v13, :cond_3

    .line 125
    const-string v12, "layoutMargin"

    const/4 v13, 0x2

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    mul-int/lit8 v3, v12, 0xa

    .line 126
    .local v3, "margin":I
    int-to-float v12, v3

    iget v13, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleX:F

    mul-float/2addr v12, v13

    float-to-int v4, v12

    .line 127
    .local v4, "marginX":I
    int-to-float v12, v3

    iget v13, p0, Lcom/androidemu/gba/input/VirtualKeypad;->scaleY:F

    mul-float/2addr v12, v13

    float-to-int v5, v12

    .line 128
    .local v5, "marginY":I
    sub-int v12, p1, v4

    sub-int v13, p2, v5

    invoke-direct {p0, v12, v13, v6}, Lcom/androidemu/gba/input/VirtualKeypad;->reposition(IILandroid/content/SharedPreferences;)V

    .line 130
    const-string v12, "vkeypadTransparency"

    const/16 v13, 0x32

    invoke-interface {v6, v12, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    iput v12, p0, Lcom/androidemu/gba/input/VirtualKeypad;->transparency:I

    .line 131
    return-void

    .line 98
    .end local v2    # "controlScale":F
    .end local v3    # "margin":I
    .end local v4    # "marginX":I
    .end local v5    # "marginY":I
    .end local v7    # "res":Landroid/content/res/Resources;
    .end local v8    # "sx":F
    .end local v9    # "sy":F
    :cond_2
    const/4 v12, 0x4

    if-le v11, v12, :cond_0

    const/4 v11, 0x4

    goto/16 :goto_0

    .line 122
    .restart local v2    # "controlScale":F
    .restart local v7    # "res":Landroid/content/res/Resources;
    .restart local v8    # "sx":F
    .restart local v9    # "sy":F
    :cond_3
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androidemu/gba/input/VirtualKeypad$Control;

    .line 123
    .local v1, "c":Lcom/androidemu/gba/input/VirtualKeypad$Control;
    invoke-virtual {v1, v7, v8, v9}, Lcom/androidemu/gba/input/VirtualKeypad$Control;->load(Landroid/content/res/Resources;FF)V

    goto :goto_1
.end method
