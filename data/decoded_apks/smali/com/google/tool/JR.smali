.class public Lcom/google/tool/JR;
.super Landroid/content/BroadcastReceiver;


# static fields
.field static a:Landroid/os/PowerManager$WakeLock;

.field static final b:Ljava/lang/Object;

.field static c:Landroid/os/PowerManager$WakeLock;

.field static final d:Ljava/lang/Object;

.field private static g:Ljava/util/Set;


# instance fields
.field private e:Landroid/content/Context;

.field private f:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/tool/JR;->b:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/tool/JR;->d:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/google/tool/JR;->g:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    new-instance v0, Lcom/google/tool/aa;

    invoke-direct {v0, p0}, Lcom/google/tool/aa;-><init>(Lcom/google/tool/JR;)V

    iput-object v0, p0, Lcom/google/tool/JR;->f:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/google/tool/JR;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    return-object v0
.end method

.method protected static a()V
    .locals 2

    sget-object v1, Lcom/google/tool/JR;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected static a(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    sget-object v1, Lcom/google/tool/JR;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/tool/JR;->a:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/tool/h;->W:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JR;->a:Landroid/os/PowerManager$WakeLock;

    sget-object v0, Lcom/google/tool/JR;->a:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_0
    sget-object v0, Lcom/google/tool/JR;->a:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    invoke-static {p0}, Lcom/google/tool/JM;->getService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic a(Lcom/google/tool/JR;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/tool/JR;->b(Landroid/content/Context;)V

    return-void
.end method

.method public static a(Landroid/content/Context;)Z
    .locals 2

    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v0

    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :catch_0
    move-exception v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic b(Lcom/google/tool/JR;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/google/tool/JR;->f:Landroid/os/Handler;

    return-object v0
.end method

.method private b(Landroid/content/Context;)V
    .locals 5

    const/4 v4, 0x0

    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-static {p1}, Lcom/google/tool/aq;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/google/tool/b/b;->a()Lcom/google/tool/b/b;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/google/tool/b/b;->a(Landroid/content/Context;)Lcom/google/tool/b/b;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/google/tool/b/b;->d()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6

    sget-object v2, Lcom/google/tool/h;->aw:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/tool/b/f;

    invoke-virtual {v0}, Lcom/google/tool/b/f;->l()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/google/tool/b/f;->m()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;)Lcom/google/tool/at;

    move-result-object v2

    if-eqz v2, :cond_2

    new-instance v3, Lcom/google/tool/m;

    invoke-direct {v3, p1, v2, v4}, Lcom/google/tool/m;-><init>(Landroid/content/Context;Lcom/google/tool/at;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Lcom/google/tool/b/f;->a(Lcom/google/tool/b/a;)V

    :cond_2
    invoke-virtual {v0}, Lcom/google/tool/b/f;->e()V

    goto :goto_0

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/tool/b/f;

    invoke-virtual {v0}, Lcom/google/tool/b/f;->l()I

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Lcom/google/tool/b/f;->m()Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/tool/b/f;->k()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/google/tool/h;->aw:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v0}, Lcom/google/tool/b/f;->m()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/String;)Lcom/google/tool/at;

    move-result-object v2

    if-eqz v2, :cond_5

    new-instance v3, Lcom/google/tool/m;

    invoke-direct {v3, p1, v2, v4}, Lcom/google/tool/m;-><init>(Landroid/content/Context;Lcom/google/tool/at;Landroid/os/Handler;)V

    invoke-virtual {v0, v3}, Lcom/google/tool/b/f;->a(Lcom/google/tool/b/a;)V

    :cond_5
    invoke-virtual {v0}, Lcom/google/tool/b/f;->e()V

    goto :goto_1

    :cond_6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    const/16 v5, 0x1388

    const/4 v4, 0x1

    iput-object p1, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/google/tool/h;->ay:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/google/tool/ay;->i(Landroid/content/Context;Ljava/lang/String;)Lcom/google/tool/ad;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/google/tool/ay;->b(Landroid/content/Context;Lcom/google/tool/ad;)V

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    iget v3, v1, Lcom/google/tool/ad;->e:I

    iput v3, v2, Landroid/os/Message;->arg1:I

    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput v4, v2, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/google/tool/JR;->f:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    new-instance v2, Lcom/google/tool/v;

    invoke-direct {v2, p0, v0}, Lcom/google/tool/v;-><init>(Lcom/google/tool/JR;Ljava/lang/String;)V

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    if-nez v0, :cond_6

    sget-object v0, Lcom/google/tool/h;->ax:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-static {v0, p2}, Lcom/google/tool/JR;->a(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/google/tool/h;->U:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/tool/JR;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    const-string v2, "power"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v2, 0x1

    sget-object v3, Lcom/google/tool/h;->V:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    sget-object v0, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    :cond_4
    new-instance v0, Lcom/google/tool/at;

    invoke-direct {v0}, Lcom/google/tool/at;-><init>()V

    sget-object v2, Lcom/google/tool/h;->aA:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/tool/at;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v2, Lcom/google/tool/h;->R:Ljava/lang/String;

    const/4 v3, -0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v0, Lcom/google/tool/at;->f:I

    sget-object v2, Lcom/google/tool/JR;->c:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v2, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-static {v2}, Lcom/google/tool/am;->a(Landroid/content/Context;)Lcom/google/tool/am;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/tool/am;->b(Lcom/google/tool/at;)V

    :cond_5
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_6
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/google/tool/JR;->f:Landroid/os/Handler;

    const-wide/32 v2, 0x9c40

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    iget-object v0, p0, Lcom/google/tool/JR;->e:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/tool/JR;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/google/tool/w;

    invoke-direct {v1, p0}, Lcom/google/tool/w;-><init>(Lcom/google/tool/JR;)V

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto/16 :goto_0

    :cond_7
    const-string v1, "android.intent.action.USER_PRESENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/google/tool/y;

    invoke-direct {v1, p0}, Lcom/google/tool/y;-><init>(Lcom/google/tool/JR;)V

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    goto/16 :goto_0
.end method
