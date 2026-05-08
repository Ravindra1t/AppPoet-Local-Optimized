.class public Lcom/androidemu/gba/HelpActivity;
.super Landroid/app/Activity;
.source "HelpActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 12
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 16
    .local v0, "view":Landroid/webkit/WebView;
    new-instance v1, Lcom/androidemu/gba/HelpActivity$1;

    invoke-direct {v1, p0}, Lcom/androidemu/gba/HelpActivity$1;-><init>(Lcom/androidemu/gba/HelpActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 22
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/HelpActivity;->setContentView(Landroid/view/View;)V

    .line 24
    const-string v1, "file:///android_asset/about.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 25
    return-void
.end method
