#生成训练图片
text2image -text=training_text.txt -outputbase=OCR_B.exp0 -font="OCR-B 10 BT" -fonts_dir=./

#新建traning.sh
tesseract OCR_B.exp0.tif OCR_B.exp0 box.train.stderr
unicharset_extractor OCR_B.exp0.box

#新建make.sh
shapeclustering -F font_properties -U unicharset OCR_B.exp0.tr
mftraining -F font_properties -U unicharset -O OCR_B.unicharset OCR_B.exp0.tr
cntraining OCR_B.exp0.tr

#新建combine.sh
mv shapetable OCR_B.shapetable
mv normproto OCR_B.normproto
mv inttemp OCR_B.inttemp
mv pffmtable OCR_B.pffmtable
combine_tessdata OCR_B. #可以多字体识别，只需要将之前的sun替换成其它字体名，最后执行合并命令。

#新建cmd.sh
#./text2image.sh
#./traning.sh
#./make.sh
#./combine.sh
