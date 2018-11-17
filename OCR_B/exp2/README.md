# 训练 1

## 自动脚本

    #!/bin/sh

    # 进入当前目录：
    cd $(dirname $0)

    # 定义输出语言 lang：
    lang=OCR_B
    # 定义输出字体 fontname
    fontname=OCR_B
    # 定义 当前 num
    num=2

    # 图像处理：
    convert 'image/*' -density 300 ./tif/%d.tif

    # 生成 .box 文件
    tesseract $lang.$fontname.exp$num.tif $lang.$fontname.exp$num batch.nochop makebox

    # 生成 .box 文件
    tesseract $lang$.$fontname$.exp$num.tif $lang.$fontname.exp$num box.train

## 图像处理

使用`convert`调整图片dpi

    convert '*.bmp' -density 300 ./Temp/img-%d.jpg
    # convert 图片 -density 300 输出位置 %d 占位符

## 生成 .box 文件

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] batch.nochop makebox
得到 `.tif` 和 `.box` 文件组成的文件对

## 修改 .tif .box 文件对

首先测试数据是否无问题

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] box.train
使用 `jTessBoxEditor.jar` 修改调整

## 启动 Tesseract 训练

    tesseract [lang].[fontname].exp[num].tif [lang].[fontname].exp[num] box.train
执行后，会在同目录下生成 `[lang].[fontname].exp[num].tr` 文件。

## 后续训练

请到 `Train` 目录下继续