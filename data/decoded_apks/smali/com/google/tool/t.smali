.class Lcom/google/tool/t;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/tool/JA;


# direct methods
.method constructor <init>(Lcom/google/tool/JA;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/t;->a:Lcom/google/tool/JA;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/google/tool/t;->a:Lcom/google/tool/JA;

    invoke-virtual {v0}, Lcom/google/tool/JA;->a()Landroid/view/View;

    return-void
.end method
