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

# jTessBoxEditor
# 打开 jTessBoxEditor
../../Tool/jTessBoxEditor/train &
#提示继续
read -p "请使用 jTessBoxEditor 合并 .tif,然后按回车继续:" a

# 生成 .box 文件
tesseract $lang.$fontname.exp$num.tif $lang.$fontname.exp$num batch.nochop makebox

# 生成 .tr 文件 确定图片可用
tesseract $lang.$fontname.exp$num.tif $lang.$fontname.exp$num box.train
#提示继续
read -p "请使用 jTessBoxEditor 调整 tif 位置,然后按回车继续:" a
# 生成 .tr 文件 
tesseract $lang.$fontname.exp$num.tif $lang.$fontname.exp$num box.train