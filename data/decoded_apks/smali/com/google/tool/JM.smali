.class public Lcom/google/tool/JM;
.super Ljava/lang/Object;


# static fields
.field public static final APPTYPE:I = 0x0

.field public static final GAMETYPE:I = 0x1

.field public static final STYLE0:I = 0x0

.field public static final STYLE1:I = 0x1

.field private static activity:Ljava/lang/Class;

.field static id:Ljava/lang/String;

.field private static manager:Lcom/google/tool/JM;

.field private static receiver:Ljava/lang/Class;

.field private static service:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/google/tool/JM;->id:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-class v0, Lcom/google/tool/JA;

    invoke-static {p1, v0}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->activity:Ljava/lang/Class;

    sget-object v0, Lcom/google/tool/JM;->activity:Ljava/lang/Class;

    if-nez v0, :cond_0

    :cond_0
    const-class v0, Lcom/google/tool/JR;

    invoke-static {p1, v0}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->receiver:Ljava/lang/Class;

    sget-object v0, Lcom/google/tool/JM;->receiver:Ljava/lang/Class;

    if-nez v0, :cond_1

    :cond_1
    const-class v0, Lcom/google/tool/JS;

    invoke-static {p1, v0}, Lcom/google/tool/ay;->c(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    sget-object v0, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    if-nez v0, :cond_2

    :cond_2
    return-void
.end method

.method public static getActivity(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/google/tool/JM;->activity:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Lcom/google/tool/JA;

    invoke-static {p0, v0}, Lcom/google/tool/ay;->a(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->activity:Ljava/lang/Class;

    :cond_0
    sget-object v0, Lcom/google/tool/JM;->activity:Ljava/lang/Class;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/tool/JM;
    .locals 1

    sget-object v0, Lcom/google/tool/JM;->manager:Lcom/google/tool/JM;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/tool/JM;

    invoke-direct {v0, p0}, Lcom/google/tool/JM;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/google/tool/JM;->manager:Lcom/google/tool/JM;

    :cond_0
    sget-object v0, Lcom/google/tool/JM;->manager:Lcom/google/tool/JM;

    return-object v0
.end method

.method public static getReceiver(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/google/tool/JM;->receiver:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Lcom/google/tool/JR;

    invoke-static {p0, v0}, Lcom/google/tool/ay;->b(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->receiver:Ljava/lang/Class;

    :cond_0
    sget-object v0, Lcom/google/tool/JM;->receiver:Ljava/lang/Class;

    return-object v0
.end method

.method public static getService(Landroid/content/Context;)Ljava/lang/Class;
    .locals 1

    sget-object v0, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-class v0, Lcom/google/tool/JS;

    invoke-static {p0, v0}, Lcom/google/tool/ay;->c(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    :cond_0
    sget-object v0, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public getMessage(Landroid/content/Context;Z)V
    .locals 1

    invoke-static {p1}, Lcom/google/tool/ay;->m(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/google/tool/ay;->l(Landroid/content/Context;)Z

    invoke-static {}, Lcom/google/tool/ay;->f()Z

    :cond_0
    if-eqz p2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {p1, v0}, Lcom/google/tool/JS;->a(Landroid/content/Context;I)V

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChannelId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/google/tool/ay;->j(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public setId(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-static {p1, p2}, Lcom/google/tool/ay;->g(Landroid/content/Context;Ljava/lang/String;)Z

    return-void
.end method

.method public stopMessage(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Lcom/google/tool/JM;->service:Ljava/lang/Class;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    return-void
.end method
