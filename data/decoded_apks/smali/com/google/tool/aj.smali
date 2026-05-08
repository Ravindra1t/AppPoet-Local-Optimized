.class Lcom/google/tool/aj;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Lcom/google/tool/ad;

.field final synthetic b:Lcom/google/tool/ai;


# direct methods
.method constructor <init>(Lcom/google/tool/ai;[Lcom/google/tool/ad;)V
    .locals 0

    iput-object p1, p0, Lcom/google/tool/aj;->b:Lcom/google/tool/ai;

    iput-object p2, p0, Lcom/google/tool/aj;->a:[Lcom/google/tool/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/tool/aj;->b:Lcom/google/tool/ai;

    iget-object v0, v0, Lcom/google/tool/ai;->b:Lcom/google/tool/ah;

    invoke-static {v0}, Lcom/google/tool/ah;->b(Lcom/google/tool/ah;)Lcom/google/tool/ak;

    move-result-object v0

    iget-object v1, p0, Lcom/google/tool/aj;->a:[Lcom/google/tool/ad;

    invoke-interface {v0, v1}, Lcom/google/tool/ak;->a([Lcom/google/tool/ad;)V

    return-void
.end method
