.class public Lcom/google/net/e/e;
.super Ljava/lang/Object;


# static fields
.field private static a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x100

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/net/e/e;->a:[I

    return-void

    :array_0
    .array-data 4
        0x67
        0x66
        0x8f
        0x80
        0x94
        0x93
        0x77
        0x80
        0x82
        0x70
        0x68
        0x7d
        0x89
        0x95
        0x7d
        0x77
        0x8c
        0x95
        0x6c
        0x88
        0x78
        0x7e
        0x64
        0x70
        0x6a
        0x90
        0x8c
        0x76
        0x7e
        0x80
        0x6d
        0x92
        0x8b
        0x68
        0x76
        0x7f
        0x6e
        0x7d
        0x70
        0x8c
        0x78
        0x85
        0x66
        0x6b
        0x8e
        0x95
        0x73
        0x84
        0x93
        0x7e
        0x8a
        0x8d
        0x8d
        0x6d
        0x68
        0x8e
        0x8a
        0x66
        0x77
        0x91
        0x8d
        0x66
        0x94
        0x66
        0x7d
        0x90
        0x88
        0x80
        0x84
        0x71
        0x6c
        0x88
        0x78
        0x6a
        0x8e
        0x6f
        0x70
        0x64
        0x78
        0x95
        0x85
        0x7e
        0x71
        0x84
        0x90
        0x7d
        0x6b
        0x85
        0x65
        0x82
        0x6f
        0x81
        0x75
        0x92
        0x70
        0x76
        0x6e
        0x83
        0x6e
        0x6c
        0x7b
        0x7c
        0x8e
        0x69
        0x7e
        0x92
        0x6a
        0x81
        0x93
        0x82
        0x80
        0x8e
        0x78
        0x6e
        0x6e
        0x82
        0x7c
        0x73
        0x78
        0x8f
        0x7b
        0x78
        0x6c
        0x86
        0x74
        0x75
        0x6b
        0x92
        0x95
        0x88
        0x75
        0x69
        0x7f
        0x64
        0x90
        0x78
        0x7b
        0x7a
        0x95
        0x7f
        0x77
        0x6f
        0x90
        0x70
        0x7b
        0x90
        0x83
        0x77
        0x90
        0x76
        0x73
        0x6b
        0x7e
        0x8c
        0x7a
        0x68
        0x7e
        0x71
        0x6e
        0x6f
        0x72
        0x88
        0x95
        0x81
        0x75
        0x69
        0x92
        0x80
        0x75
        0x64
        0x7e
        0x6b
        0x65
        0x6b
        0x83
        0x88
        0x7e
        0x67
        0x6e
        0x70
        0x92
        0x7d
        0x8f
        0x84
        0x77
        0x87
        0x7b
        0x85
        0x8f
        0x81
        0x78
        0x73
        0x78
        0x75
        0x7b
        0x86
        0x75
        0x84
        0x71
        0x95
        0x94
        0x6a
        0x86
        0x8a
        0x6e
        0x84
        0x72
        0x74
        0x6e
        0x82
        0x85
        0x8a
        0x72
        0x89
        0x78
        0x6a
        0x6d
        0x8b
        0x8a
        0x66
        0x76
        0x78
        0x76
        0x8b
        0x6e
        0x92
        0x72
        0x6a
        0x7a
        0x79
        0x85
        0x8e
        0x92
        0x8f
        0x75
        0x93
        0x70
        0x7f
        0x64
        0x93
        0x90
        0x6b
        0x76
        0x82
        0x73
        0x8f
        0x78
        0x75
        0x7b
        0x6b
        0x6b
        0x78
        0x79
        0x82
        0x90
        0x7e
    .end array-data
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v1, "s"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "e"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_1
    :try_start_0
    array-length v3, v1

    if-ge v0, v3, :cond_1

    aget-char v3, v1, v0

    sget-object v4, Lcom/google/net/e/e;->a:[I

    sget-object v5, Lcom/google/net/e/e;->a:[I

    array-length v5, v5

    rem-int v5, v0, v5

    aget v4, v4, v5

    sub-int/2addr v3, v4

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-string v0, ""

    goto :goto_0
.end method
