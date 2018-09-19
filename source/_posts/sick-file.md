---
title: 会对"本地搜索"功能出现影响的文本内容
date: 2018-09-08 21:28:34
author: DF
categories:
    - 基于 Heox + NexT 的 blog 搭建
tags:
    - blog 搭建
    - hexo-local-search
---
# Error
![](/images/post/sick-file-error.png)

更新文章后, 搜索功能一直卡在加载状态, 切换到 `nsdf.top/search.xml` 页面,发现有以上错误提示.

<!-- more -->
# 问题语句:

- 有问题的语句:

    [![放在这个文件里了, 点击可以下载](/images/post/problem-file-view.png)](/code/problem-content.txt)
    > 点击图片可以下载这个文件

- 没问题的语句:

    在打开一个新的项目文件夹时 就需要重新配置 launch.json 中的 cwd 参数

## 分析:
问题在于空格, 在有问题文本中,存在着编码错误的空格,如果你尝试删除这些空格,会发现在有两处空格位置需要删除两次才会消失, 这两个位置就是问题产生的原因.

## 解决方式
- 寻找一种可以重新将文本编码的方式

- 或者把有问题的文件改掉,参考:
    - http://www.itfanr.cc/2017/11/24/resolve-hexo-blog-search-exception/
    - 使用Sublime或者vim,都可以很明显的看出问题在哪
    ![](/images/post/sick-file.png)

