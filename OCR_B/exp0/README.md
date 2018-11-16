# 自动训练

`training_text.txt` 为需要识别的字符

    text2image -text=training_text.txt -outputbase=../Temp/OCR_B.OCR_B.exp0 -font="OCR-B 10 BT" -fonts_dir=../

    tesseract ../Temp/OCR_B.OCR_B.exp0.tif ../Temp/OCR_B.OCR_B.exp0 box.train.stderr
    unicharset_extractor ../Temp/OCR_B.OCR_B.exp0.box

## 合并训练数据

    shapeclustering -F ../../Data/font_properties -U unicharset ../Temp/OCR_B.OCR_B.exp0.tr
    mftraining -F ../../Data/font_properties -U unicharset -O ../Temp/OCR_B.unicharset ../Temp/OCR_B.OCR_B.exp0.tr
    cntraining ../Temp/OCR_B.OCR_B.exp0.tr

    mv shapetable ../Temp/OCR_B.shapetable
    mv normproto ../Temp/OCR_B.normproto
    mv inttemp ../Temp/OCR_B.inttemp
    mv pffmtable ../Temp/OCR_B.pffmtable
    combine_tessdata ../Temp/OCR_B. #可以多字体识别，只需要将之前的sun替换成其它字体名，最后执行合并命令。

    rm unicharset
    mv ../Temp/*.traineddata ./
    rm ../Temp/*
