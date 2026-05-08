.class Lcom/androidemu/gba/HelpActivity$1;
.super Landroid/webkit/WebChromeClient;
.source "HelpActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/HelpActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/androidemu/gba/HelpActivity;


# direct methods
.method constructor <init>(Lcom/androidemu/gba/HelpActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/androidemu/gba/HelpActivity$1;->this$0:Lcom/androidemu/gba/HelpActivity;

    .line 16
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/androidemu/gba/HelpActivity$1;->this$0:Lcom/androidemu/gba/HelpActivity;

    invoke-virtual {v0, p2}, Lcom/androidemu/gba/HelpActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 19
    return-void
.end method
