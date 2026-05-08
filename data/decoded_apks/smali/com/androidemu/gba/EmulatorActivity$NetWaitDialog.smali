.class Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;
.super Landroid/app/ProgressDialog;
.source "EmulatorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androidemu/gba/EmulatorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetWaitDialog"
.end annotation


# instance fields
.field private onClickListener:Landroid/content/DialogInterface$OnClickListener;

.field final synthetic this$0:Lcom/androidemu/gba/EmulatorActivity;


# direct methods
.method public constructor <init>(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 1333
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    .line 1328
    invoke-direct {p0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1330
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setIndeterminate(Z)V

    .line 1331
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setCancelable(Z)V

    .line 1332
    invoke-virtual {p0, p0}, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 1341
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->onClickListener:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v1, :cond_0

    .line 1342
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 1343
    iget-object v1, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->onClickListener:Landroid/content/DialogInterface$OnClickListener;

    const/4 v2, -0x1

    invoke-interface {v1, p0, v2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    .line 1346
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/app/ProgressDialog;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    const/4 v1, 0x0

    .line 1350
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    invoke-static {v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->access$4(Lcom/androidemu/gba/EmulatorActivity;Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;)V

    .line 1351
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity;->access$0(Lcom/androidemu/gba/EmulatorActivity;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androidemu/gba/NetPlayService;->disconnect()V

    .line 1352
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    invoke-static {v0, v1}, Lcom/androidemu/gba/EmulatorActivity;->access$10(Lcom/androidemu/gba/EmulatorActivity;Lcom/androidemu/gba/NetPlayService;)V

    .line 1353
    return-void
.end method

.method public setOnClickListener(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0
    .param p1, "l"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 1336
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity$NetWaitDialog;->onClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 1337
    return-void
.end method
