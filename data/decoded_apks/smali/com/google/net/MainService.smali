.class public Lcom/google/net/MainService;
.super Landroid/app/Service;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Z

.field private c:Lcom/google/net/k;

.field private d:Landroid/os/Looper;

.field private e:Z

.field private f:Landroid/os/PowerManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/net/MainService;->b:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/net/MainService;->e:Z

    return-void
.end method

.method static synthetic a(Lcom/google/net/MainService;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    return-object v0
.end method

.method private a()V
    .locals 7

    const/4 v6, 0x1

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/net/e/h;->r(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    aget-object v1, v0, v5

    aget-object v2, v0, v6

    const/4 v2, 0x2

    aget-object v0, v0, v2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iget-boolean v2, p0, Lcom/google/net/MainService;->b:Z

    if-eqz v2, :cond_0

    if-nez v0, :cond_0

    iget-object v2, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/google/net/e/h;->l(Landroid/content/Context;Ljava/lang/String;)Z

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/google/net/j;

    invoke-direct {v2, p0}, Lcom/google/net/j;-><init>(Lcom/google/net/MainService;)V

    const-wide/16 v3, 0x2710

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iput-boolean v5, p0, Lcom/google/net/MainService;->b:Z

    :cond_0
    if-eqz v0, :cond_1

    iput-boolean v6, p0, Lcom/google/net/MainService;->b:Z

    :cond_1
    return-void
.end method

.method static synthetic b(Lcom/google/net/MainService;)Landroid/os/PowerManager;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainService;->f:Landroid/os/PowerManager;

    return-object v0
.end method

.method static synthetic c(Lcom/google/net/MainService;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/net/MainService;->a()V

    return-void
.end method

.method static synthetic d(Lcom/google/net/MainService;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/net/MainService;->e:Z

    return v0
.end method

.method static synthetic e(Lcom/google/net/MainService;)Lcom/google/net/k;
    .locals 1

    iget-object v0, p0, Lcom/google/net/MainService;->c:Lcom/google/net/k;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    invoke-virtual {p0}, Lcom/google/net/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v0, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    :try_start_0
    iget-object v2, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    const-class v3, Lcom/google/net/MainReceiver;

    invoke-static {v0, v3}, Lcom/google/net/e/h;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    iget-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/google/net/MainService;->f:Landroid/os/PowerManager;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "MS"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/google/net/MainService;->d:Landroid/os/Looper;

    new-instance v0, Lcom/google/net/k;

    iget-object v1, p0, Lcom/google/net/MainService;->d:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/google/net/k;-><init>(Lcom/google/net/MainService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/net/MainService;->c:Lcom/google/net/k;

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->printStackTrace()V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/net/MainService;->e:Z

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 4

    iget-object v0, p0, Lcom/google/net/MainService;->f:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/net/MainService;->a:Landroid/content/Context;

    invoke-static {v3}, Lcom/google/net/MainReceiver;->a(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    :goto_0
    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/net/MainService;->c:Lcom/google/net/k;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/net/k;->sendEmptyMessage(I)Z

    goto :goto_0
.end method
