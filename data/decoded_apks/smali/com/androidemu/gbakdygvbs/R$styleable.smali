.class public final Lcom/androidemu/gbakdygvbs/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androidemu/gbakdygvbs/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final cn_domob_android_ads_DomobAdView:[I

.field public static final cn_domob_android_ads_DomobAdView_backgroundColor:I = 0x0

.field public static final cn_domob_android_ads_DomobAdView_keywords:I = 0x2

.field public static final cn_domob_android_ads_DomobAdView_primaryTextColor:I = 0x1

.field public static final cn_domob_android_ads_DomobAdView_refreshInterval:I = 0x4

.field public static final cn_domob_android_ads_DomobAdView_spots:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 375
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/androidemu/gbakdygvbs/R$styleable;->cn_domob_android_ads_DomobAdView:[I

    .line 356
    return-void

    .line 375
    nop

    :array_0
    .array-data 4
        0x7f010000
        0x7f010001
        0x7f010002
        0x7f010003
        0x7f010004
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 356
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
