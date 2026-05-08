.class Lcom/google/tool/d;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/google/tool/c;


# direct methods
.method constructor <init>(Lcom/google/tool/c;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/d;->a:Lcom/google/tool/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/google/tool/d;->a:Lcom/google/tool/c;

    invoke-static {v0}, Lcom/google/tool/c;->a(Lcom/google/tool/c;)V

    return-void
.end method
