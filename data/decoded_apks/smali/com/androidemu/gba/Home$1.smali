.class Lcom/androidemu/gba/Home$1;
.super Landroid/os/Handler;
.source "Home.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androidemu/gba/Home;
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
    iput-object p1, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    .line 151
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v6, 0x0

    .line 155
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    iget-object v3, v3, Lcom/androidemu/gba/Home;->d:Landroid/app/ProgressDialog;

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 156
    new-instance v3, Ljava/io/File;

    const-string v4, "/data/data/com.androidemu.gba/lib/"

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 158
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    iget-object v3, v3, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 159
    .local v2, "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    .line 160
    iget-object v4, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    const-class v5, Lcom/androidemu/gba/EmulatorActivity2;

    .line 159
    invoke-direct {v0, v3, v2, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 161
    .local v0, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    invoke-virtual {v3, v0}, Lcom/androidemu/gba/Home;->startActivity(Landroid/content/Intent;)V

    .line 162
    const/4 v1, 0x0

    .line 163
    .local v1, "toast":Landroid/widget/Toast;
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    invoke-virtual {v3}, Lcom/androidemu/gba/Home;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 164
    const-string v4, "\u6ca1\u6709\u5b89\u88c5\u4f18\u5316\u6e38\u620f\u901f\u5ea6\u63d2\u4ef6\uff0c\u53ef\u80fd\u6e38\u620f\u4f1a\u8fd0\u884c\u4e0d\u6d41\u7545\u3002\u5982\u679c\u89c9\u5f97\u6e38\u620f\u8fd0\u884c\u4e0d\u6d41\u7545\uff0c\u8bf7\u5b89\u88c5\u4f18\u5316\u6e38\u620f\u901f\u5ea6\u63d2\u4ef6\u3002"

    const/4 v5, 0x1

    .line 163
    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 165
    const/16 v3, 0x11

    invoke-virtual {v1, v3, v6, v6}, Landroid/widget/Toast;->setGravity(III)V

    .line 166
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 174
    .end local v1    # "toast":Landroid/widget/Toast;
    :goto_0
    return-void

    .line 169
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_0
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    iget-object v3, v3, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 170
    .restart local v2    # "uri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    .line 171
    iget-object v4, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    const-class v5, Lcom/androidemu/gba/EmulatorActivity;

    .line 170
    invoke-direct {v0, v3, v2, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 172
    .restart local v0    # "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/androidemu/gba/Home$1;->this$0:Lcom/androidemu/gba/Home;

    invoke-virtual {v3, v0}, Lcom/androidemu/gba/Home;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
