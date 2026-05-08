.class Lcom/androidemu/gba/KeyProfilesActivity$2;
.super Ljava/lang/Object;
.source "KeyProfilesActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/KeyProfilesActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/KeyProfilesActivity;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/KeyProfilesActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/KeyProfilesActivity$2;->this$0:Lcom/androidemu/gba/KeyProfilesActivity;

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 253
    invoke-static {}, Lcom/androidemu/gba/KeyProfilesActivity;->access$0()Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "oldName":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/androidemu/gba/KeyProfilesActivity;->access$1(Ljava/lang/String;)V

    move-object v0, p1

    .line 256
    check-cast v0, Landroid/app/Dialog;

    .line 258
    .local v0, "d":Landroid/app/Dialog;
    const v3, 0x7f080013

    .line 257
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 258
    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    .line 259
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 261
    .local v1, "newName":Ljava/lang/String;
    iget-object v3, p0, Lcom/androidemu/gba/KeyProfilesActivity$2;->this$0:Lcom/androidemu/gba/KeyProfilesActivity;

    invoke-static {v3, v2, v1}, Lcom/androidemu/gba/KeyProfilesActivity;->access$2(Lcom/androidemu/gba/KeyProfilesActivity;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 262
    iget-object v3, p0, Lcom/androidemu/gba/KeyProfilesActivity$2;->this$0:Lcom/androidemu/gba/KeyProfilesActivity;

    invoke-static {v3}, Lcom/androidemu/gba/KeyProfilesActivity;->access$3(Lcom/androidemu/gba/KeyProfilesActivity;)V

    .line 268
    :goto_0
    return-void

    .line 264
    :cond_0
    iget-object v3, p0, Lcom/androidemu/gba/KeyProfilesActivity$2;->this$0:Lcom/androidemu/gba/KeyProfilesActivity;

    .line 265
    const v4, 0x7f060038

    .line 266
    const/4 v5, 0x0

    .line 264
    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    .line 266
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
