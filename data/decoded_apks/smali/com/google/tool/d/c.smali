.class public Lcom/google/tool/d/c;
.super Ljava/lang/Object;


# static fields
.field private static a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x100

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/tool/d/c;->a:[I

    return-void

    :array_0
    .array-data 4
        0x68
        0x76
        0x64
        0x69
        0x72
        0x95
        0x6a
        0x85
        0x6b
        0x81
        0x95
        0x83
        0x71
        0x84
        0x76
        0x84
        0x6c
        0x93
        0x79
        0x89
        0x72
        0x71
        0x71
        0x7f
        0x81
        0x66
        0x73
        0x6e
        0x6c
        0x94
        0x85
        0x93
        0x7e
        0x8a
        0x86
        0x74
        0x90
        0x77
        0x70
        0x6e
        0x64
        0x8a
        0x90
        0x8c
        0x75
        0x8f
        0x78
        0x90
        0x68
        0x6f
        0x8f
        0x95
        0x6c
        0x69
        0x8a
        0x67
        0x94
        0x95
        0x76
        0x8c
        0x83
        0x8e
        0x73
        0x7d
        0x8b
        0x89
        0x72
        0x7a
        0x68
        0x6f
        0x8a
        0x69
        0x71
        0x71
        0x84
        0x6e
        0x7a
        0x8c
        0x8e
        0x93
        0x70
        0x78
        0x69
        0x6a
        0x73
        0x7e
        0x8c
        0x8d
        0x74
        0x83
        0x8d
        0x77
        0x71
        0x95
        0x6d
        0x79
        0x94
        0x7f
        0x64
        0x81
        0x75
        0x8f
        0x78
        0x6d
        0x69
        0x91
        0x84
        0x72
        0x95
        0x76
        0x70
        0x81
        0x76
        0x65
        0x6e
        0x7d
        0x69
        0x94
        0x67
        0x7f
        0x7b
        0x8f
        0x73
        0x6f
        0x75
        0x95
        0x86
        0x92
        0x71
        0x7b
        0x7c
        0x86
        0x87
        0x7b
        0x7c
        0x85
        0x8f
        0x88
        0x8c
        0x76
        0x77
        0x8a
        0x74
        0x84
        0x6e
        0x69
        0x8b
        0x8e
        0x75
        0x7e
        0x6b
        0x82
        0x7c
        0x7d
        0x8f
        0x91
        0x95
        0x6b
        0x73
        0x82
        0x70
        0x87
        0x82
        0x7d
        0x8e
        0x89
        0x6e
        0x8c
        0x8d
        0x82
        0x66
        0x86
        0x78
        0x75
        0x83
        0x87
        0x85
        0x64
        0x66
        0x77
        0x6a
        0x89
        0x90
        0x91
        0x81
        0x74
        0x85
        0x85
        0x8c
        0x76
        0x82
        0x71
        0x67
        0x70
        0x85
        0x68
        0x6e
        0x92
        0x94
        0x8e
        0x6a
        0x7c
        0x91
        0x8f
        0x93
        0x84
        0x7f
        0x64
        0x75
        0x77
        0x64
        0x75
        0x71
        0x8e
        0x93
        0x8a
        0x6a
        0x6d
        0x86
        0x95
        0x89
        0x7a
        0x76
        0x93
        0x6d
        0x69
        0x8c
        0x76
        0x73
        0x65
        0x6c
        0x67
        0x92
        0x7e
        0x83
        0x83
        0x65
        0x8c
        0x7e
        0x8b
        0x72
        0x87
        0x65
        0x8c
        0x88
        0x68
        0x83
        0x73
        0x93
        0x79
        0x90
        0x71
        0x6d
        0x79
        0x8e
        0x76
    .end array-data
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const-string v1, "x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "y"

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

    sget-object v4, Lcom/google/tool/d/c;->a:[I

    array-length v5, v1

    add-int/2addr v5, v0

    sget-object v6, Lcom/google/tool/d/c;->a:[I

    array-length v6, v6

    rem-int/2addr v5, v6

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
