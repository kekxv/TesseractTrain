# 生成训练图片 text2image

>text2image -text=training_text.txt -outputbase=OCR_B.exp0 -font="OCR-B 10 BT" -fonts_dir=./

# 训练数据 traning

>tesseract OCR_B.exp0.tif OCR_B.exp0 box.train.stderr
>
>unicharset_extractor OCR_B.exp0.box

# 生成特征数据 shapeclustering

> shapeclustering -F font_properties -U unicharset OCR_B.exp0.tr
>
> mftraining -F font_properties -U unicharset -O OCR_B.unicharset OCR_B.exp0.tr
>
> cntraining OCR_B.exp0.tr

# 合并数据 combine

> mv shapetable OCR_B.shapetable
>
> mv normproto OCR_B.normproto
>
> mv inttemp OCR_B.inttemp
>
> mv pffmtable OCR_B.pffmtable
>
> combine_tessdata OCR_B. #可以多字体识别，只需要将之前的sun替换成其它字体名，最后执行合并命令。
