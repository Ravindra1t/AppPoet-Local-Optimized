.class Lcom/androidemu/gba/Home$2$1;
.super Ljava/lang/Thread;
.source "Home.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/Home$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/androidemu/gba/Home$2;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/Home$2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/Home$2$1;->this$1:Lcom/androidemu/gba/Home$2;

    .line 47
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/androidemu/gba/Home$2$1;->this$1:Lcom/androidemu/gba/Home$2;

    invoke-static {v0}, Lcom/androidemu/gba/Home$2;->access$0(Lcom/androidemu/gba/Home$2;)Lcom/androidemu/gba/Home;

    move-result-object v0

    invoke-static {v0}, Lcom/androidemu/gba/Home;->access$0(Lcom/androidemu/gba/Home;)Z

    .line 53
    iget-object v0, p0, Lcom/androidemu/gba/Home$2$1;->this$1:Lcom/androidemu/gba/Home$2;

    invoke-static {v0}, Lcom/androidemu/gba/Home$2;->access$0(Lcom/androidemu/gba/Home$2;)Lcom/androidemu/gba/Home;

    move-result-object v0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 54
    return-void
.end method
