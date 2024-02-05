请将您要排版的歌词数据按以下要求放在 source 文件夹中
确保除 source 文件夹外的其他文件不被更改

要求：
在 info.txt 中以以下顺序写入数据：

标题语言
标题
副标题语言
副标题
艺术家语言
艺术家
是否含封面（ y or n ）
封面在 source 文件夹中的完整文件名
每组文本包含的行数
每组文本中各自每行对应的语言（条数视上条行数而定）

其中，语言目前包含 en, zh-cn, jp 三种
副标题语言可填 n ，表示无副标题
每组文本对应 source 文件夹中 1.txt 2.txt ...
确保各组文本的txt文件行数及对应位置相等，否则可能导致错位

例如：
en
Subtitle
zh-cn
日剧《silent》主题曲
jp
Official髭男dism
y
cover.jpg
3
en
jp
zh-cn

按上方要求写好 info.txt 并备好所需文件后运行
RUN ME.cmd
之后输出文件在文件夹中