.class Lcom/androidemu/gba/EmulatorActivity2$3;
.super Ljava/lang/Object;
.source "EmulatorActivity2.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/EmulatorActivity2;->createReplaceGameDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/EmulatorActivity2;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/EmulatorActivity2;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2$3;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    .line 915
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 917
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 918
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2$3;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity2$3;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v1}, Lcom/androidemu/gba/EmulatorActivity2;->access$12(Lcom/androidemu/gba/EmulatorActivity2;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->setIntent(Landroid/content/Intent;)V

    .line 919
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2$3;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity2;->access$13(Lcom/androidemu/gba/EmulatorActivity2;)Z

    .line 921
    :cond_0
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity2$3;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/androidemu/gba/EmulatorActivity2;->access$14(Lcom/androidemu/gba/EmulatorActivity2;Landroid/content/Intent;)V

    .line 922
    return-void
.end method
