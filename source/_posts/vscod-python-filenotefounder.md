---
title:      VSCode 中使用 Python 异常报错 FileNotFoundError 的解决办法
date:       2018-08-18
categories:
    - Visual Studio Code
tags:
    - Python
    - FileNotFoundError
    - cwd
    - VSCode
---
# 问题
在vscode中使用Python,通过建立一个Python程序读取同一子目录下的txt文件, 并打印其内容.

## 预期结果
程序读取同一个子目录中的 `content.txt` 文件, 然后打印其内容:
```
stay hungry
stay foolish
```
## 实际结果
通过debug, 提示如下错误:
```
FileNotFoundError: [Errno 2] No such file or directory: 'content.txt'
```
<!-- more -->

![vscode_python_filenotefound_1-c650](/images/post/vscode_python_filenotefound_1.png)
# 错误分析
vscode在进行debug时,使用的路径并不是当前python文件所在的目录,而是固定为项目文件夹的根目录.所以当程序试图从根目录寻找此文件时,自然会报错.于是我进一步尝试将文本文件移动至项目的根目录,错误消失.
所以,解决问题的关键就是修改vscode在进行debug时使用的目录,使其自动的指向当前python文件所在目录.

![vscode_python_filenotefound_2-c650](/images/post/vscode_python_filenotefound_2.png)

# 解决方案
初步思路是通过在 VSCode 的 Setting 中或者 debug 的配置文件中进行配置，来解决这个问题。通过 Google 后，我在 StackOverflow 上找到了具体解决方案。

## 参考链接:
- [Stack Overflow - VSCode — how to set working directory for debug](https://stackoverflow.com/questions/43801142/vscode-working-directory-when-debugging-python)
- [Stack Overflow - vscode working directory when debugging python](https://stackoverflow.com/questions/43801142/vscode-working-directory-when-debugging-python)

## 解决方式
点击vscode侧边的调试按钮,在出现的侧栏顶端找到设置按钮(图中齿轮图标), 点击打开 `launch.json` 文件, 在文件中找到当前所用调试的方式, 添加cwd配置 `"cwd": ""`. (我这里使用的是 `Python: Terminal (integrated)`) 添加完成后, 在此debug程序, 发现错误消失.

![vscode_python_filenotefound_3-c650](/images/post/vscode_python_filenotefound_3.png)

# 补充
每次打开一个新的项目文件夹时, 都需要重新在`launch.json`文件中重新配置参数.