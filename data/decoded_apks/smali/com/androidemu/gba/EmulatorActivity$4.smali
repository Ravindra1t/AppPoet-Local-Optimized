.class Lcom/androidemu/gba/EmulatorActivity$4;
.super Ljava/lang/Object;
.source "EmulatorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/EmulatorActivity;->createWifiConnectDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/EmulatorActivity;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/EmulatorActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity$4;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    .line 857
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 859
    move-object v0, p1

    check-cast v0, Landroid/app/Dialog;

    .line 861
    .local v0, "d":Landroid/app/Dialog;
    const v3, 0x7f080019

    .line 860
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 861
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 863
    .local v1, "ip":Ljava/lang/String;
    const v3, 0x7f08001a

    .line 862
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 863
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 864
    .local v2, "port":Ljava/lang/String;
    iget-object v3, p0, Lcom/androidemu/gba/EmulatorActivity$4;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    invoke-static {v3, v1, v2}, Lcom/androidemu/gba/EmulatorActivity;->access$15(Lcom/androidemu/gba/EmulatorActivity;Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    return-void
.end method
