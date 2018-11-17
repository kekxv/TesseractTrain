# 自动训练

`training_text.txt` 为需要识别的字符

    # 生成识别数据
    text2image -text=training_text.txt -outputbase=../Temp/OCR_B.OCR_B.exp0 -font="OCR-B 10 BT" -fonts_dir=../
    # 生成对应训练数据
    tesseract ../Temp/OCR_B.OCR_B.exp0.tif ../Temp/OCR_B.OCR_B.exp0 box.train.stderr
