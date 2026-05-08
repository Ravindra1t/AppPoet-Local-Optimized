.class public Lcom/androidemu/gba/CheatsActivity;
.super Landroid/app/ListActivity;
.source "CheatsActivity.java"


# static fields
.field private static final DIALOG_EDIT_CHEAT:I = 0x1

.field private static final MENU_ITEM_DELETE:I = 0x2

.field private static final MENU_ITEM_EDIT:I = 0x1

.field private static currentCheat:Lcom/androidemu/Cheats$Item;


# instance fields
.field private adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Lcom/androidemu/Cheats$Item;",
            ">;"
        }
    .end annotation
.end field

.field private cheats:Lcom/androidemu/Cheats;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 31
    invoke-static {}, Lcom/androidemu/Emulator;->getInstance()Lcom/androidemu/Emulator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/androidemu/Emulator;->getCheats()Lcom/androidemu/Cheats;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    .line 24
    return-void
.end method

.method static synthetic access$0()Lcom/androidemu/Cheats$Item;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    return-object v0
.end method

.method static synthetic access$1(Lcom/androidemu/Cheats$Item;)V
    .locals 0

    .prologue
    .line 33
    sput-object p0, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    return-void
.end method

.method static synthetic access$2(Lcom/androidemu/gba/CheatsActivity;)Lcom/androidemu/Cheats;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    return-object v0
.end method

.method static synthetic access$3(Lcom/androidemu/gba/CheatsActivity;)Landroid/widget/ArrayAdapter;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    return-object v0
.end method

.method static synthetic access$4(Lcom/androidemu/gba/CheatsActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/androidemu/gba/CheatsActivity;->addCheat(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private addCheat(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    invoke-virtual {v1, p1, p2}, Lcom/androidemu/Cheats;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/androidemu/Cheats$Item;

    move-result-object v0

    .line 72
    .local v0, "c":Lcom/androidemu/Cheats$Item;
    if-nez v0, :cond_0

    .line 73
    const v1, 0x7f060046

    .line 74
    const/4 v2, 0x0

    .line 73
    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    .line 74
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 80
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    .line 79
    invoke-direct {p0}, Lcom/androidemu/gba/CheatsActivity;->syncCheckedStates()V

    goto :goto_0
.end method

.method private syncCheckedStates()V
    .locals 4

    .prologue
    .line 36
    iget-object v3, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    invoke-virtual {v3}, Lcom/androidemu/Cheats;->getAll()Ljava/util/List;

    move-result-object v1

    .line 37
    .local v1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/androidemu/Cheats$Item;>;"
    invoke-virtual {p0}, Lcom/androidemu/gba/CheatsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v2

    .line 38
    .local v2, "listView":Landroid/widget/ListView;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 40
    return-void

    .line 39
    :cond_0
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/androidemu/Cheats$Item;

    iget-boolean v3, v3, Lcom/androidemu/Cheats$Item;->enabled:Z

    invoke-virtual {v2, v0, v3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 38
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    .line 165
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 167
    .local v0, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;, "Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 178
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 169
    :pswitch_0
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    iget v3, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/androidemu/Cheats$Item;

    sput-object v1, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    .line 170
    invoke-virtual {p0, v2}, Lcom/androidemu/gba/CheatsActivity;->showDialog(I)V

    move v1, v2

    .line 171
    goto :goto_0

    .line 174
    :pswitch_1
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    iget v3, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v1, v3}, Lcom/androidemu/Cheats;->remove(I)V

    .line 175
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->notifyDataSetChanged()V

    move v1, v2

    .line 176
    goto :goto_0

    .line 167
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const v1, 0x7f060028

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/CheatsActivity;->setTitle(I)V

    .line 47
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/CheatsActivity;->setContentView(I)V

    .line 48
    invoke-virtual {p0}, Lcom/androidemu/gba/CheatsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const/high16 v2, 0x7f080000

    invoke-virtual {p0, v2}, Lcom/androidemu/gba/CheatsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 50
    new-instance v1, Landroid/widget/ArrayAdapter;

    .line 51
    const v2, 0x1090010

    .line 52
    iget-object v3, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    invoke-virtual {v3}, Lcom/androidemu/Cheats;->getAll()Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 50
    iput-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    .line 53
    iget-object v1, p0, Lcom/androidemu/gba/CheatsActivity;->adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/CheatsActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 55
    invoke-virtual {p0}, Lcom/androidemu/gba/CheatsActivity;->getListView()Landroid/widget/ListView;

    move-result-object v0

    .line 56
    .local v0, "listView":Landroid/widget/ListView;
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 57
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 58
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 60
    invoke-direct {p0}, Lcom/androidemu/gba/CheatsActivity;->syncCheckedStates()V

    .line 61
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    const/4 v2, 0x0

    .line 158
    const/4 v0, 0x1

    const v1, 0x7f060003

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 159
    const/4 v0, 0x2

    const v1, 0x7f060004

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 160
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v4, 0x0

    .line 84
    packed-switch p1, :pswitch_data_0

    .line 112
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    :goto_0
    return-object v1

    .line 87
    :pswitch_0
    new-instance v0, Lcom/androidemu/gba/CheatsActivity$1;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/CheatsActivity$1;-><init>(Lcom/androidemu/gba/CheatsActivity;)V

    .line 104
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 105
    const v2, 0x7f060043

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 106
    invoke-virtual {p0}, Lcom/androidemu/gba/CheatsActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    .line 107
    const v3, 0x7f030008

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 106
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 108
    const v2, 0x104000a

    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 109
    const/high16 v2, 0x1040000

    invoke-virtual {v1, v2, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 110
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 84
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    .line 139
    invoke-virtual {p0}, Lcom/androidemu/gba/CheatsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 140
    const/4 v0, 0x1

    return v0
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 2
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 183
    iget-object v0, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    invoke-virtual {p1, p3}, Landroid/widget/ListView;->isItemChecked(I)Z

    move-result v1

    invoke-virtual {v0, p3, v1}, Lcom/androidemu/Cheats;->enable(IZ)V

    .line 184
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 145
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 151
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 147
    :pswitch_0
    const/4 v1, 0x0

    sput-object v1, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    .line 148
    invoke-virtual {p0, v0}, Lcom/androidemu/gba/CheatsActivity;->showDialog(I)V

    goto :goto_0

    .line 145
    :pswitch_data_0
    .packed-switch 0x7f08001b
        :pswitch_0
    .end packed-switch
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "dialog"    # Landroid/app/Dialog;

    .prologue
    const/4 v3, 0x0

    .line 117
    packed-switch p1, :pswitch_data_0

    .line 133
    :goto_0
    return-void

    .line 119
    :pswitch_0
    const v2, 0x7f080012

    invoke-virtual {p2, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 120
    .local v0, "codeView":Landroid/widget/TextView;
    const v2, 0x7f080011

    invoke-virtual {p2, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 121
    .local v1, "nameView":Landroid/widget/TextView;
    sget-object v2, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    if-nez v2, :cond_0

    .line 122
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 123
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    :goto_1
    invoke-virtual {v1}, Landroid/widget/TextView;->requestFocus()Z

    goto :goto_0

    .line 126
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 127
    sget-object v2, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    iget-object v2, v2, Lcom/androidemu/Cheats$Item;->code:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    sget-object v2, Lcom/androidemu/gba/CheatsActivity;->currentCheat:Lcom/androidemu/Cheats$Item;

    iget-object v2, v2, Lcom/androidemu/Cheats$Item;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 117
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 65
    invoke-super {p0}, Landroid/app/ListActivity;->onStop()V

    .line 67
    iget-object v0, p0, Lcom/androidemu/gba/CheatsActivity;->cheats:Lcom/androidemu/Cheats;

    invoke-virtual {v0}, Lcom/androidemu/Cheats;->save()V

    .line 68
    return-void
.end method
