.class Lcom/androidemu/gba/Home$2;
.super Ljava/lang/Object;
.source "Home.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/Home;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/Home;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/Home;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/Home$2;->this$0:Lcom/androidemu/gba/Home;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/androidemu/gba/Home$2;)Lcom/androidemu/gba/Home;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/androidemu/gba/Home$2;->this$0:Lcom/androidemu/gba/Home;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 46
    iget-object v1, p0, Lcom/androidemu/gba/Home$2;->this$0:Lcom/androidemu/gba/Home;

    iget-object v1, v1, Lcom/androidemu/gba/Home;->d:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 47
    new-instance v0, Lcom/androidemu/gba/Home$2$1;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/Home$2$1;-><init>(Lcom/androidemu/gba/Home$2;)V

    .line 56
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 58
    return-void
.end method
