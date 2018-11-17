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