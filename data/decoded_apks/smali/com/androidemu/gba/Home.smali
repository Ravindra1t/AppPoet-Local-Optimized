.class public Lcom/androidemu/gba/Home;
.super Landroid/app/Activity;
.source "Home.java"


# instance fields
.field about:Landroid/widget/Button;

.field about2:Landroid/widget/Button;

.field about3:Landroid/widget/Button;

.field d:Landroid/app/ProgressDialog;

.field file:Ljava/lang/String;

.field file2:Ljava/lang/String;

.field filename:Ljava/lang/String;

.field handler:Landroid/os/Handler;

.field path:Ljava/lang/String;

.field start:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/lsh"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    .line 28
    const-string v0, "kdygvbs.zip"

    iput-object v0, p0, Lcom/androidemu/gba/Home;->file:Ljava/lang/String;

    .line 29
    const-string v0, "data13.dat"

    iput-object v0, p0, Lcom/androidemu/gba/Home;->file2:Ljava/lang/String;

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/androidemu/gba/Home;->file:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    .line 151
    new-instance v0, Lcom/androidemu/gba/Home$1;

    invoke-direct {v0, p0}, Lcom/androidemu/gba/Home$1;-><init>(Lcom/androidemu/gba/Home;)V

    iput-object v0, p0, Lcom/androidemu/gba/Home;->handler:Landroid/os/Handler;

    .line 26
    return-void
.end method

.method static synthetic access$0(Lcom/androidemu/gba/Home;)Z
    .locals 1

    .prologue
    .line 208
    invoke-direct {p0}, Lcom/androidemu/gba/Home;->init()Z

    move-result v0

    return v0
.end method

.method private copyAsset(Ljava/io/File;)Z
    .locals 10
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 177
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 206
    :cond_0
    :goto_0
    return v6

    .line 180
    :cond_1
    const/4 v2, 0x0

    .line 181
    .local v2, "in":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 184
    .local v4, "out":Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    const-string v9, "game_config.txt"

    invoke-virtual {v8, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 185
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    .end local v4    # "out":Ljava/io/OutputStream;
    .local v5, "out":Ljava/io/OutputStream;
    const/16 v8, 0x2000

    :try_start_1
    new-array v0, v8, [B

    .line 189
    .local v0, "buf":[B
    :goto_1
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v3

    .local v3, "len":I
    if-gtz v3, :cond_3

    .line 199
    if-eqz v5, :cond_2

    .line 200
    :try_start_2
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 201
    :cond_2
    if-eqz v2, :cond_0

    .line 202
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 203
    :catch_0
    move-exception v7

    goto :goto_0

    .line 190
    :cond_3
    const/4 v8, 0x0

    :try_start_3
    invoke-virtual {v5, v0, v8, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    .line 192
    .end local v0    # "buf":[B
    .end local v3    # "len":I
    :catch_1
    move-exception v1

    move-object v4, v5

    .line 193
    .end local v5    # "out":Ljava/io/OutputStream;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "out":Ljava/io/OutputStream;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 194
    const-string v6, "Home:"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 199
    if-eqz v4, :cond_4

    .line 200
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 201
    :cond_4
    if-eqz v2, :cond_5

    .line 202
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_5
    :goto_3
    move v6, v7

    .line 195
    goto :goto_0

    .line 197
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 199
    :goto_4
    if-eqz v4, :cond_6

    .line 200
    :try_start_6
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 201
    :cond_6
    if-eqz v2, :cond_7

    .line 202
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 205
    :cond_7
    :goto_5
    throw v6

    .line 203
    :catch_2
    move-exception v7

    goto :goto_5

    .line 197
    .end local v4    # "out":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/OutputStream;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/OutputStream;
    goto :goto_4

    .line 203
    .restart local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v6

    goto :goto_3

    .line 192
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_4
    move-exception v1

    goto :goto_2
.end method

.method private init()Z
    .locals 17

    .prologue
    .line 209
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-direct {v4, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 210
    .local v4, "dir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    .line 211
    :cond_0
    new-instance v15, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-direct/range {v15 .. v16}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_3

    .line 213
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->file2:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v11

    .line 214
    .local v11, "is":Ljava/io/InputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    invoke-direct {v7, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 215
    .local v7, "fos":Ljava/io/FileOutputStream;
    const/16 v15, 0x2000

    new-array v1, v15, [B

    .line 216
    .local v1, "buffer":[B
    const/4 v3, 0x0

    .line 218
    .local v3, "count":I
    :goto_0
    invoke-virtual {v11, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-gtz v3, :cond_1

    .line 220
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 221
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 222
    invoke-virtual/range {p0 .. p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v15

    const-string v16, "gba_bios.bin"

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v12

    .line 223
    .local v12, "is2":Ljava/io/InputStream;
    new-instance v8, Ljava/io/FileOutputStream;

    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "gba_bios.bin"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v8, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 224
    .local v8, "fos2":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 225
    :goto_1
    invoke-virtual {v12, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-gtz v3, :cond_2

    .line 227
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 228
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 232
    const/4 v15, 0x1

    .line 287
    .end local v1    # "buffer":[B
    .end local v3    # "count":I
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "fos2":Ljava/io/FileOutputStream;
    .end local v11    # "is":Ljava/io/InputStream;
    .end local v12    # "is2":Ljava/io/InputStream;
    :goto_2
    return v15

    .line 219
    .restart local v1    # "buffer":[B
    .restart local v3    # "count":I
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    :cond_1
    const/4 v15, 0x0

    invoke-virtual {v7, v1, v15, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 234
    .end local v1    # "buffer":[B
    .end local v3    # "count":I
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v11    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v6

    .line 236
    .local v6, "e":Ljava/io/IOException;
    const-string v15, "em:"

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    const-string v15, "\u6253\u5f00\u5b58\u50a8\u5361\u5931\u8d25\uff01"

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/androidemu/gba/Home;->openDialog(Ljava/lang/String;)V

    .line 238
    const/4 v15, 0x0

    goto :goto_2

    .line 226
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v1    # "buffer":[B
    .restart local v3    # "count":I
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "fos2":Ljava/io/FileOutputStream;
    .restart local v11    # "is":Ljava/io/InputStream;
    .restart local v12    # "is2":Ljava/io/InputStream;
    :cond_2
    const/4 v15, 0x0

    :try_start_1
    invoke-virtual {v8, v1, v15, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 241
    .end local v1    # "buffer":[B
    .end local v3    # "count":I
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "fos2":Ljava/io/FileOutputStream;
    .end local v11    # "is":Ljava/io/InputStream;
    .end local v12    # "is2":Ljava/io/InputStream;
    :cond_3
    new-instance v15, Ljava/io/File;

    const-string v16, "/data/data/com.androidemu.gba/lib/"

    invoke-direct/range {v15 .. v16}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_4

    .line 244
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v15

    const-string v16, "data12.dat"

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v13

    .line 245
    .local v13, "is3":Ljava/io/InputStream;
    new-instance v9, Ljava/io/FileOutputStream;

    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "/"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "gba_bios.apk"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v9, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 246
    .local v9, "fos3":Ljava/io/FileOutputStream;
    const/4 v3, 0x0

    .line 247
    .restart local v3    # "count":I
    const/16 v15, 0x2000

    new-array v1, v15, [B

    .line 248
    .restart local v1    # "buffer":[B
    :goto_3
    invoke-virtual {v13, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    if-gtz v3, :cond_5

    .line 250
    invoke-virtual {v9}, Ljava/io/FileOutputStream;->close()V

    .line 251
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V

    .line 253
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "LD_LIBRARY_PATH=/vendor/lib:/system/lib pm install -r "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "/gba_bios.apk"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "cmd":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v15

    const-string v16, "su"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v10

    .line 255
    .local v10, "install":Ljava/lang/Process;
    new-instance v5, Ljava/io/DataInputStream;

    invoke-virtual {v10}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v15

    invoke-direct {v5, v15}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 256
    .local v5, "dis":Ljava/io/DataInputStream;
    new-instance v14, Ljava/io/DataOutputStream;

    invoke-virtual {v10}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 257
    .local v14, "os":Ljava/io/DataOutputStream;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "\n"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 258
    const-string v15, "exit\n"

    invoke-virtual {v14, v15}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v14}, Ljava/io/DataOutputStream;->flush()V

    .line 260
    invoke-virtual {v10}, Ljava/lang/Process;->waitFor()I

    .line 287
    .end local v1    # "buffer":[B
    .end local v2    # "cmd":Ljava/lang/String;
    .end local v3    # "count":I
    .end local v5    # "dis":Ljava/io/DataInputStream;
    .end local v9    # "fos3":Ljava/io/FileOutputStream;
    .end local v10    # "install":Ljava/lang/Process;
    .end local v13    # "is3":Ljava/io/InputStream;
    .end local v14    # "os":Ljava/io/DataOutputStream;
    :cond_4
    :goto_4
    const/4 v15, 0x0

    goto/16 :goto_2

    .line 249
    .restart local v1    # "buffer":[B
    .restart local v3    # "count":I
    .restart local v9    # "fos3":Ljava/io/FileOutputStream;
    .restart local v13    # "is3":Ljava/io/InputStream;
    :cond_5
    const/4 v15, 0x0

    invoke-virtual {v9, v1, v15, v3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 270
    .end local v1    # "buffer":[B
    .end local v3    # "count":I
    .end local v9    # "fos3":Ljava/io/FileOutputStream;
    .end local v13    # "is3":Ljava/io/InputStream;
    :catch_1
    move-exception v6

    .line 271
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 272
    const-string v15, "error"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4
.end method

.method private init2()Z
    .locals 11

    .prologue
    const/4 v8, 0x0

    .line 290
    new-instance v2, Ljava/io/File;

    iget-object v9, p0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-direct {v2, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 291
    .local v2, "dir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 292
    :cond_0
    new-instance v9, Ljava/io/File;

    iget-object v10, p0, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_1

    .line 294
    :try_start_0
    invoke-virtual {p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    iget-object v10, p0, Lcom/androidemu/gba/Home;->file2:Ljava/lang/String;

    invoke-virtual {v9, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 295
    .local v6, "is":Ljava/io/InputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v9, p0, Lcom/androidemu/gba/Home;->filename:Ljava/lang/String;

    invoke-direct {v4, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 296
    .local v4, "fos":Ljava/io/FileOutputStream;
    const/16 v9, 0x2000

    new-array v0, v9, [B

    .line 297
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 299
    .local v1, "count":I
    :goto_0
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-gtz v1, :cond_2

    .line 301
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 302
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 303
    invoke-virtual {p0}, Lcom/androidemu/gba/Home;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    const-string v10, "gba_bios.bin"

    invoke-virtual {v9, v10}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 304
    .local v7, "is2":Ljava/io/InputStream;
    new-instance v5, Ljava/io/FileOutputStream;

    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/androidemu/gba/Home;->path:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "gba_bios.bin"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v5, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 305
    .local v5, "fos2":Ljava/io/FileOutputStream;
    const/4 v1, 0x0

    .line 306
    :goto_1
    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-gtz v1, :cond_3

    .line 308
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 309
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 313
    const/4 v8, 0x1

    .line 324
    .end local v0    # "buffer":[B
    .end local v1    # "count":I
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "fos2":Ljava/io/FileOutputStream;
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "is2":Ljava/io/InputStream;
    :cond_1
    :goto_2
    return v8

    .line 300
    .restart local v0    # "buffer":[B
    .restart local v1    # "count":I
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v6    # "is":Ljava/io/InputStream;
    :cond_2
    const/4 v9, 0x0

    invoke-virtual {v4, v0, v9, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 315
    .end local v0    # "buffer":[B
    .end local v1    # "count":I
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v3

    .line 317
    .local v3, "e":Ljava/io/IOException;
    const-string v9, "em:"

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    const-string v9, "\u6253\u5f00\u5b58\u50a8\u5361\u5931\u8d25\uff01"

    invoke-direct {p0, v9}, Lcom/androidemu/gba/Home;->openDialog(Ljava/lang/String;)V

    goto :goto_2

    .line 307
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":[B
    .restart local v1    # "count":I
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "fos2":Ljava/io/FileOutputStream;
    .restart local v6    # "is":Ljava/io/InputStream;
    .restart local v7    # "is2":Ljava/io/InputStream;
    :cond_3
    const/4 v9, 0x0

    :try_start_1
    invoke-virtual {v5, v0, v9, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private openDialog(Ljava/lang/String;)V
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 327
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 328
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "\u663e\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 329
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 330
    const-string v1, "\u786e\u5b9a"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 331
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 332
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    const v1, 0x7f030007

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/Home;->setContentView(I)V

    const-string v0, "14211"

    invoke-static {p0, v0}, Lcom/phaxton/QSBLMA;->initSDK(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/phaxton/QSBLMA;->showAD1(Landroid/content/Context;)V

    .line 38
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/androidemu/gba/Home;->d:Landroid/app/ProgressDialog;

    .line 39
    iget-object v1, p0, Lcom/androidemu/gba/Home;->d:Landroid/app/ProgressDialog;

    const-string v2, "\u7b2c\u4e00\u6b21\u8fd0\u884c\u521d\u59cb\u5316\uff0c\u8bf7\u7a0d\u540e..."

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 41
    const v1, 0x7f08000d

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/Home;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/androidemu/gba/Home;->start:Landroid/widget/Button;

    .line 43
    iget-object v1, p0, Lcom/androidemu/gba/Home;->start:Landroid/widget/Button;

    new-instance v2, Lcom/androidemu/gba/Home$2;

    invoke-direct {v2, p0}, Lcom/androidemu/gba/Home$2;-><init>(Lcom/androidemu/gba/Home;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    const v1, 0x7f08000f

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/Home;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/androidemu/gba/Home;->about:Landroid/widget/Button;

    .line 62
    iget-object v1, p0, Lcom/androidemu/gba/Home;->about:Landroid/widget/Button;

    new-instance v2, Lcom/androidemu/gba/Home$3;

    invoke-direct {v2, p0}, Lcom/androidemu/gba/Home$3;-><init>(Lcom/androidemu/gba/Home;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    const v1, 0x7f08000e

    invoke-virtual {p0, v1}, Lcom/androidemu/gba/Home;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/androidemu/gba/Home;->about3:Landroid/widget/Button;

    .line 84
    iget-object v1, p0, Lcom/androidemu/gba/Home;->about3:Landroid/widget/Button;

    new-instance v2, Lcom/androidemu/gba/Home$4;

    invoke-direct {v2, p0}, Lcom/androidemu/gba/Home$4;-><init>(Lcom/androidemu/gba/Home;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    const-string v1, "data"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/androidemu/gba/Home;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    .line 147
    .local v0, "datadir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "game_config.txt"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/androidemu/gba/Home;->copyAsset(Ljava/io/File;)Z

    .line 150
    return-void
.end method
