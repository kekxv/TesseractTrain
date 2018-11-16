# 生成特征数据

    shapeclustering -F font_properties -U unicharset OCR_B.exp0.tr
    mftraining -F font_properties -U unicharset -O OCR_B.unicharset OCR_B.exp0.tr
    cntraining OCR_B.exp0.tr