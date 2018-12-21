#!/bin/sh

# 进入当前目录：
cd $(dirname $0)

# 定义输出语言 lang：
lang=OCR_B

# 获取数据 tr：
tr=`ls ../exp*/*.tr`

# 获取数据 box：
box=`ls ../exp*/*.box`

# 生成unicharset文件：
unicharset_extractor $tr

# 聚类：Clustering:
shapeclustering -F ../../Data/font_properties -U unicharset $tr
mftraining -F ../../Data/font_properties -U unicharset -O $lang.unicharset $tr
cntraining $tr

#合并训练数据
mv shapetable $lang.shapetable
mv normproto $lang.normproto
mv inttemp $lang.inttemp
mv pffmtable $lang.pffmtable
combine_tessdata $lang.

rm $lang.inttemp $lang.pffmtable $lang.normproto $lang.shapetable $lang.unicharset unicharset
rm *.log