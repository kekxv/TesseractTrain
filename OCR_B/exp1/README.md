# 训练图片

使用`convert`调整图片dpi

    convert '*.bmp' -density 300 ./Temp/img-%d.jpg
    # convert 图片 -density 300 输出位置 %d 占位符

## tif 文件
需要遵循命名规则 ： `[lang].[fontname].exp[num].tif`
> lang--你准备训练的语言的名称，这个名称也是将来你使用的时候 -l 后面指定的名称
>
> fontname--fontname就是fantname，需要你指定你的语言的字体名称，这个事情可以这么理解：不同的字体，字符的展现形式可是千变万化啊，比如楷体和王羲之字体。
>
> exp[num]---exp不解释，人家就这么定义的，照着敲，后面是编号，看明白了吧，这玩意其实支持增量训练，今天弄一点，明天弄一点，慢慢就能让自己训练的语言文件准确率越来好。

## 生成 .box 文件

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] batch.nochop makebox
得到 `.tif` 和 `.box` 文件组成的文件对

## 修改 .tif .box 文件对

首先测试数据是否无问题

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] box.train
使用 `jTessBoxEditor.jar` 修改调整

## 启动 Tesseract 训练

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] box.train
执行后，会在同目录下生成 `[lang].[fontname].exp[num].tr` 四个文件。

## 生成unicharset文件

    unicharset_extractor [lang].[fontname].exp[num].box
创建了一个 unicharset文件，如果有多个 `.box` 文件可以一起合并

## 定义 font_properties 文件

在当前的训练文件夹中，新建 `font_properties` 文件，文件名不要自己发挥，必须这个名字，建议使用 `vi` 编辑，而不是用文档编辑器编辑，原因么，就是 防止换行符的不一致问题咯。按照你的实际情况，在文档中输入下面一行内容，我输入的是：

`Arial 0 0 0 0 0`

简单翻译下官方解释：
> font_properties文件的目的是提供字体样式信息，当字体被识别时将显示在输出中。

该文件使用 `Data` 目录下的文件即可

## 聚类：Clustering

    shapeclustering -F font_properties -U unicharset [lang].[fontname].exp[num].tr

    mftraining -F font_properties -U unicharset -O [lang].unicharset [lang].[fontname].exp[num].tr

    cntraining [lang].[fontname].exp[num].tr
训练数据处理


## 合并训练数据

    mv shapetable [lang].shapetable
    mv normproto [lang].normproto
    mv inttemp [lang].inttemp
    mv pffmtable [lang].pffmtable
    # 输出为 tessdata
    combine_tessdata [lang].

    
