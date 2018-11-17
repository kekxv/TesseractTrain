# TesseractTrain

> Tesseract OCR 积累训练库

## [OCR_B](OCR_B)

> 目录 `OCR_B` 为例子教程，如需使用，请根据 目录`OCR_B` 进行
>> ## 训练 OCR_B 字体
>>
>> 重头开始训练OCR字体识别
>>
>> 可按照教程一步一步进行训练
>>
>> 如果精度要求一般般，基本上只需要 `exp0` 内容就行了
>>
>> 其他的可以在之后一步一步递增，例如 `exp1`、`exp2`
>>
>> 在数据处理之前先确认图像无问题，免得处理完之后无法生成训练数据
>>
>> ### tif 文件
>>
>> 需要遵循命名规则 ： `[lang].[fontname].exp[num].tif`
>> > lang--你准备训练的语言的名称，这个名称也是将来你使用的时候 -l 后面指定的名称
>> >
>> > fontname--fontname就是fantname，需要你指定你的语言的字体名称，这个事情可以这么理解：不同的字体，字符的展现形式可是千变万化啊，比如楷体和王羲之字体。
>> >
>> > exp[num]---exp不解释，人家就这么定义的，照着敲，后面是编号，看明白了吧，这玩意其实支持增量训练，今天弄一点，明天弄一点，慢慢就能让自己训练的语言文件准确率越来好。
>>
>> ### 注意
>>
>> 图片文件尽量保证宽高为整数或者高能被宽能整除
>>

## 赞助

如果觉得可以，欢迎赞助

>>>>>>> ![支付宝](PayImage/aPay.jpg)
>>>>>>> ![微信](PayImage/wPay.jpg)