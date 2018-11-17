
# 合并训练

## 自动执行脚本

可直接运行当前目录下的 `train.sh` 脚本

> ### 进入当前目录：
>
>     cd
>
> ### 定义输出语言 `lang`：
>
>     lang=OCR_B
>
> ### 获取数据 `tr`：
>
>     tr=`ls ../exp*/*.tr`
>
> ### 获取数据 `box`：
>
>     box=`ls ../exp*/*.box`
>
> ### 生成`unicharset`文件：
>
>     unicharset_extractor $tr
>
> ### 聚类：`Clustering`:
>
>     shapeclustering -F ../../Data/font_properties -U unicharset $tr
>     mftraining -F ../../Data/font_properties -U unicharset -O $lang.unicharset $tr
>     cntraining $tr
>
> ### 合并训练数据
>
>     mv shapetable $lang.shapetable
>     mv normproto $lang.normproto
>     mv inttemp $lang.inttemp
>     mv pffmtable $lang.pffmtable
>     combine_tessdata $lang.
>

## 生成unicharset文件

    unicharset_extractor [lang].[fontname].exp[num].box
创建了一个 unicharset文件，如果有多个 `.box` 文件可以一起合并

## 定义 font_properties 文件

在当前的训练文件夹中，新建 `font_properties` 文件，文件名不要自己发挥，必须这个名字，建议使用 `vi` 编辑，而不是用文档编辑器编辑，原因么，就是 防止换行符的不一致问题咯。按照你的实际情况，在文档中输入下面一行内容，我输入的是：

`Arial 0 0 0 0 0`

简单翻译下官方解释：
> font_properties文件的目的是提供字体样式信息，当字体被识别时将显示在输出中。

该文件使用 `Data` 目录下的文件即可

## 聚类：Clustering

    shapeclustering -F ../../Data/font_properties -U unicharset [lang].[fontname].exp[num].tr

    mftraining -F ../../Data/font_properties -U unicharset -O [lang].unicharset [lang].[fontname].exp[num].tr

    cntraining [lang].[fontname].exp[num].tr
训练数据处理

## 合并训练数据

    mv shapetable [lang].shapetable
    mv normproto [lang].normproto
    mv inttemp [lang].inttemp
    mv pffmtable [lang].pffmtable
    # 输出为 tessdata
    combine_tessdata [lang].

    ```
    mv shapetable OCR_B.shapetable
    mv normproto OCR_B.normproto
    mv inttemp OCR_B.inttemp
    mv pffmtable OCR_B.pffmtable
    combine_tessdata OCR_B. #可以多字体识别，只需要将之前的sun替换成其它字体名，最后执行合并命令。
    ```