.class Lcom/androidemu/gba/EmulatorActivity2$1;
.super Landroid/os/Handler;
.source "EmulatorActivity2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/androidemu/gba/EmulatorActivity2;
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
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    .line 1010
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 1013
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1079
    :cond_0
    :goto_0
    return-void

    .line 1016
    :cond_1
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    .line 1018
    :sswitch_0
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$1(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 1019
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/NetPlayService;->isServer()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1020
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$2(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 1023
    :cond_2
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/NetPlayService;->sendMessageReply()V

    .line 1025
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$3(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1026
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$3(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->dismiss()V

    .line 1027
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2, v3}, Lcom/androidemu/gba/EmulatorActivity2;->access$4(Lcom/androidemu/gba/EmulatorActivity2;Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;)V

    goto :goto_0

    .line 1032
    :sswitch_1
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$5(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 1034
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$3(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1035
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$3(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;->dismiss()V

    .line 1036
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2, v3}, Lcom/androidemu/gba/EmulatorActivity2;->access$4(Lcom/androidemu/gba/EmulatorActivity2;Lcom/androidemu/gba/EmulatorActivity2$NetWaitDialog;)V

    .line 1038
    :cond_3
    const v0, 0x7f06002a

    .line 1039
    .local v0, "error":I
    iget v2, p1, Landroid/os/Message;->arg1:I

    packed-switch v2, :pswitch_data_0

    .line 1047
    :goto_1
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    .line 1048
    const/4 v3, 0x1

    .line 1047
    invoke-static {v2, v0, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    .line 1048
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1041
    :pswitch_0
    const v0, 0x7f06002b

    .line 1042
    goto :goto_1

    .line 1044
    :pswitch_1
    const v0, 0x7f06002c

    goto :goto_1

    .line 1052
    .end local v0    # "error":I
    :sswitch_2
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$6(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/Emulator;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/Emulator;->power()V

    .line 1053
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/NetPlayService;->sendMessageReply()V

    goto/16 :goto_0

    .line 1057
    :sswitch_3
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$6(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/Emulator;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/Emulator;->reset()V

    .line 1058
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/NetPlayService;->sendMessageReply()V

    goto/16 :goto_0

    .line 1062
    :sswitch_4
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$7(Lcom/androidemu/gba/EmulatorActivity2;)Ljava/io/File;

    move-result-object v1

    .line 1064
    .local v1, "file":Ljava/io/File;
    :try_start_0
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, [B

    invoke-static {v1, v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$8(Ljava/io/File;[B)V

    .line 1065
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$6(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/Emulator;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/androidemu/Emulator;->loadState(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1068
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1070
    :goto_2
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$0(Lcom/androidemu/gba/EmulatorActivity2;)Lcom/androidemu/gba/NetPlayService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/androidemu/gba/NetPlayService;->sendMessageReply()V

    goto/16 :goto_0

    .line 1066
    :catch_0
    move-exception v2

    .line 1068
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 1067
    :catchall_0
    move-exception v2

    .line 1068
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 1069
    throw v2

    .line 1074
    .end local v1    # "file":Ljava/io/File;
    :sswitch_5
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-virtual {v2}, Lcom/androidemu/gba/EmulatorActivity2;->hasWindowFocus()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1075
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$2(Lcom/androidemu/gba/EmulatorActivity2;)V

    .line 1076
    :cond_4
    iget-object v2, p0, Lcom/androidemu/gba/EmulatorActivity2$1;->this$0:Lcom/androidemu/gba/EmulatorActivity2;

    invoke-static {v2}, Lcom/androidemu/gba/EmulatorActivity2;->access$9(Lcom/androidemu/gba/EmulatorActivity2;)V

    goto/16 :goto_0

    .line 1016
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x5 -> :sswitch_4
        0x3e8 -> :sswitch_5
    .end sparse-switch

    .line 1039
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
