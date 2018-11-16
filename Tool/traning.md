# 训练数据

    // 生成训练数据
    tesseract OCR_B.exp0.tif OCR_B.exp0 box.train.stderr
    // 生成特征
    unicharset_extractor OCR_B.exp0.box