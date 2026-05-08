.class Lcom/androidemu/gba/EmulatorActivity$5;
.super Ljava/lang/Object;
.source "EmulatorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/androidemu/gba/EmulatorActivity;->onBluetoothServer()V
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
    iput-object p1, p0, Lcom/androidemu/gba/EmulatorActivity$5;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    .line 1102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "button"    # I

    .prologue
    .line 1104
    iget-object v0, p0, Lcom/androidemu/gba/EmulatorActivity$5;->this$0:Lcom/androidemu/gba/EmulatorActivity;

    invoke-static {v0}, Lcom/androidemu/gba/EmulatorActivity;->access$16(Lcom/androidemu/gba/EmulatorActivity;)V

    .line 1105
    return-void
.end method
