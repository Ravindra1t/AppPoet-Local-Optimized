.class Lcom/androidemu/gba/Home$4;
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
    iput-object p1, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 14
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 87
    new-instance v12, Ljava/io/File;

    const-string v13, "/data/data/com.androidemu.gba/lib/"

    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_0

    .line 90
    :try_start_0
    iget-object v12, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    invoke-virtual {v12}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v12

    const-string v13, "data12.dat"

    invoke-virtual {v12, v13}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    .line 91
    .local v9, "is3":Ljava/io/InputStream;
    new-instance v6, Ljava/io/FileOutputStream;

    new-instance v12, Ljava/lang/StringBuilder;

    iget-object v13, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    iget-object v13, v13, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "gba_bios.apk"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v6, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 92
    .local v6, "fos3":Ljava/io/FileOutputStream;
    const/4 v2, 0x0

    .line 93
    .local v2, "count":I
    const/16 v12, 0x2000

    new-array v0, v12, [B

    .line 94
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {v9, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-gtz v2, :cond_1

    .line 96
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    .line 97
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 99
    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "LD_LIBRARY_PATH=/vendor/lib:/system/lib pm install -r "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v13, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    iget-object v13, v13, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/gba_bios.apk"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "cmd":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v12

    const-string v13, "su"

    invoke-virtual {v12, v13}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v7

    .line 101
    .local v7, "install":Ljava/lang/Process;
    new-instance v3, Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 102
    .local v3, "dis":Ljava/io/DataInputStream;
    new-instance v10, Ljava/io/DataOutputStream;

    invoke-virtual {v7}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-direct {v10, v12}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 103
    .local v10, "os":Ljava/io/DataOutputStream;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 104
    const-string v12, "exit\n"

    invoke-virtual {v10, v12}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 105
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->flush()V

    .line 106
    invoke-virtual {v7}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    .end local v0    # "buffer":[B
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v2    # "count":I
    .end local v3    # "dis":Ljava/io/DataInputStream;
    .end local v6    # "fos3":Ljava/io/FileOutputStream;
    .end local v7    # "install":Ljava/lang/Process;
    .end local v9    # "is3":Ljava/io/InputStream;
    .end local v10    # "os":Ljava/io/DataOutputStream;
    :cond_0
    :goto_1
    new-instance v12, Ljava/lang/StringBuilder;

    iget-object v13, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    iget-object v13, v13, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "/gba_bios.apk"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 134
    .local v5, "fileName":Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v12}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v11

    .line 136
    .local v11, "uri":Landroid/net/Uri;
    new-instance v8, Landroid/content/Intent;

    const-string v12, "android.intent.action.VIEW"

    invoke-direct {v8, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 138
    .local v8, "intent":Landroid/content/Intent;
    const-string v12, "application/vnd.android.package-archive"

    invoke-virtual {v8, v11, v12}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    iget-object v12, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    invoke-virtual {v12, v8}, Lcom/androidemu/gba/Home;->startActivity(Landroid/content/Intent;)V

    .line 141
    return-void

    .line 95
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v11    # "uri":Landroid/net/Uri;
    .restart local v0    # "buffer":[B
    .restart local v2    # "count":I
    .restart local v6    # "fos3":Ljava/io/FileOutputStream;
    .restart local v9    # "is3":Ljava/io/InputStream;
    :cond_1
    const/4 v12, 0x0

    :try_start_1
    invoke-virtual {v6, v0, v12, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 116
    .end local v0    # "buffer":[B
    .end local v2    # "count":I
    .end local v6    # "fos3":Ljava/io/FileOutputStream;
    .end local v9    # "is3":Ljava/io/InputStream;
    :catch_0
    move-exception v4

    .line 117
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 118
    const-string v12, "error"

    iget-object v13, p0, Lcom/androidemu/gba/Home$4;->this$0:Lcom/androidemu/gba/Home;

    iget-object v13, v13, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method
