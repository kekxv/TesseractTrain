#生成训练图片
text2image -text=training_text.txt -outputbase=OCR_B.exp0 -font="OCR-B 10 BT" -fonts_dir=../

# 生成训练数据
tesseract OCR_B.OCR_B.exp0.tif OCR_B.OCR_B.exp0 box.train.stderr
unicharset_extractor OCR_B.OCR_B.exp0.box
