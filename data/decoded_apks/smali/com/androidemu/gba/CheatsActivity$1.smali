.class Lcom/androidemu/gba/CheatsActivity$1;
.super Ljava/lang/Object;
.source "CheatsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/CheatsActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/CheatsActivity;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/CheatsActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/CheatsActivity$1;->this$0:Lcom/androidemu/gba/CheatsActivity;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 89
    move-object v1, p1

    check-cast v1, Landroid/app/Dialog;

    .line 91
    .local v1, "d":Landroid/app/Dialog;
    const v3, 0x7f080011

    .line 90
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 91
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 92
    .local v2, "name":Ljava/lang/String;
    invoke-static {}, Lcom/androidemu/gba/CheatsActivity;->access$0()Lcom/androidemu/Cheats$Item;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 93
    invoke-static {}, Lcom/androidemu/gba/CheatsActivity;->access$0()Lcom/androidemu/Cheats$Item;

    move-result-object v3

    iput-object v2, v3, Lcom/androidemu/Cheats$Item;->name:Ljava/lang/String;

    .line 94
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/androidemu/gba/CheatsActivity;->access$1(Lcom/androidemu/Cheats$Item;)V

    .line 95
    iget-object v3, p0, Lcom/androidemu/gba/CheatsActivity$1;->this$0:Lcom/androidemu/gba/CheatsActivity;

    invoke-static {v3}, Lcom/androidemu/gba/CheatsActivity;->access$2(Lcom/androidemu/gba/CheatsActivity;)Lcom/androidemu/Cheats;

    move-result-object v3

    invoke-virtual {v3}, Lcom/androidemu/Cheats;->setModified()V

    .line 96
    iget-object v3, p0, Lcom/androidemu/gba/CheatsActivity$1;->this$0:Lcom/androidemu/gba/CheatsActivity;

    invoke-static {v3}, Lcom/androidemu/gba/CheatsActivity;->access$3(Lcom/androidemu/gba/CheatsActivity;)Landroid/widget/ArrayAdapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 102
    :goto_0
    return-void

    .line 99
    :cond_0
    const v3, 0x7f080012

    .line 98
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 99
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "code":Ljava/lang/String;
    iget-object v3, p0, Lcom/androidemu/gba/CheatsActivity$1;->this$0:Lcom/androidemu/gba/CheatsActivity;

    invoke-static {v3, v0, v2}, Lcom/androidemu/gba/CheatsActivity;->access$4(Lcom/androidemu/gba/CheatsActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
