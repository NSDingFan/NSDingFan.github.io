---
title:      通过MarkDown编写blog进阶技巧
data:       2018-08-26
categories:
    - 基于 Heox + NexT 的 blog 搭建
tags:
    - MarkDown
    - iframe
    - 链接跳转
    - 图片链接
    - blog技巧
---
## 在MarkDown中插入链接的一些技巧

#### 1. 直接添加链接
```
<http://nsdf.top/>
```
<http://nsdf.top/>

#### 2. 一般的链接
```MarkDown
丁帆的blog： [nsdf.top](http://nsdf.top/)

丁帆的blog： [nsdf.top](http://nsdf.top/ "丁帆的博客")
```
丁帆的blog： [nsdf.top](http://nsdf.top/)

丁帆的blog： [nsdf.top](http://nsdf.top/ "丁帆的博客")

<!-- more --> 

#### 3. 相对链接

链接至自己blog中的其他文章等内容：
```
[个人博客搭建踩坑指南](/2018/08/18/一些推荐的文章/)
[封面图片](/img/post_bg_apple_ad.jpg)
```

[个人博客搭建踩坑指南](/2018/08/18/一些推荐的文章/)

[封面图片](/img/post_bg_apple_ad.jpg) 

> 注:此为Jekyll内容,待修改

#### 4. 在图片中嵌入链接

```
[![apple-touch-icon](/images/post/blog-logo.png))](http://nsdf.top/)
```

[![apple-touch-icon](/images/post/blog-logo.png))](http://nsdf.top/)

> 注: 此功能在基于Jekyll的blog中为点击图片前往链接;在基于Heox+NexT的blog中,为点击图片下方链接跳转.  !!!待修改


#### 5. 在新标签中打开连接
```
[nsdf.top](http://nsdf.top/){:target="_blank"}
```
[nsdf.top](http://nsdf.top/){:target="_blank"}

> 注: 在之前使用的基于Jekyll的Blog中,这个功能可用且需要. 在当前基于Heox+NexT的blog中,不需要这样写.



## 在MarkDown中插入视频

在MarkDown中，只要使用 `<iframe>` 标签就可以方便的插入视频了。

关于 `<iframe>` 的更多信息： [w3school-HTML-iframe 标签](http://www.w3school.com.cn/tags/tag_iframe.asp)

下面的示例中，分别演示了插入 腾讯，优酷，YouTube，哔哩哔哩 这几个网站的视频的操作

### 示例：

#### 1. 腾讯视频

1. 打开一个视频，点击下方分享按钮，然后复制通用代码
![](/images/post/tencent-video.jpg)


2. 将复制的代码粘贴至MarkDown文件中。 这样就完成了。
    
    ```html
    <center><iframe frameborder="0" width="640" height="498" src="https://v.qq.com/iframe/player.html?vid=j0600cjxtp0&tiny=0&auto=0" allowfullscreen></iframe></center>
    ```
    > 另外，如果需要视频居中显示，可能还需要（视blog而定）添加一个`<center>`标签。
    
3. 最终效果如下：
    
    <center><iframe frameborder="0" width="640" height="498" src="https://v.qq.com/iframe/player.html?vid=j0600cjxtp0&tiny=0&auto=0" allowfullscreen></iframe></center>
        
        
#### 2. 优酷

1. 同样的，打开一个视频，点击分享，然后复制通用代码
    ![](/images/post/youku-video.jpg)

2. 将代码粘贴至MarkDown文件中。就完成了
    
    ```html
    <iframe height=498 width=510 src='http://player.youku.com/embed/XMTg0MTQ4NDk4OA==' frameborder=0 'allowfullscreen'></iframe>
    ```
    
3. 效果如下
    
    <iframe height=498 width=510 src='http://player.youku.com/embed/XMTg0MTQ4NDk4OA==' frameborder=0 'allowfullscreen'></iframe>
    
    > 我发现在我常用的Safari以及chrome浏览器中，无法识别优酷的这种写法。于是我将代码改为了下面的写法，主要是将 height,width,frameborder 的数值加上双引号，将src链接改为双引号，最后将allowfullscreen单引号去掉 
    
    ```html
    <iframe height="498" width="510" src="http://player.youku.com/embed/XMTg0MTQ4NDk4OA==" frameborder="0" allowfullscreen></iframe>
    ```
    
   <iframe height="498" width="510" src="http://player.youku.com/embed/XMTg0MTQ4NDk4OA==" frameborder="0" allowfullscreen></iframe>
       
       
#### 3. YouTube
    
1. 直接在视频上右击，选择复制嵌入代码，然后粘贴至MarkDown中即可。
    ![](/images/post/youtube-video.jpg)
2. 效果如下
    
    ```
    <iframe width="919" height="525" src="https://www.youtube.com/embed/LcGPI2tV2yY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    ```
    <iframe width="919" height="525" src="https://www.youtube.com/embed/LcGPI2tV2yY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    
    
#### 4. 哔哩哔哩

1. 基本流程也一样，具体看下面截图就好了。需要注意的是，哔哩哔哩复制来的嵌入代码的src 缺少 `https:`，我需要补上这个，链接才会恢复正常。同时，还需要添加窗口尺寸等设置。
2. 具体操作：

    - 在网站中复制嵌入代码：
    
        ![](/images/post/Snip20180826_141.png)
        ![](/images/post/Snip20180826_143.png)
        ![](/images/post/Snip20180826_144.png)

    - 修改复制到的嵌入代码：

        - 原本的：
            ```
            <iframe src="//player.bilibili.com/player.html?aid=1031924&cid=1494043&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
            ```
        - 修改后:
            ```
            <iframe width="640" height="498" src="https://player.bilibili.com/player.html?aid=1031924&cid=1494043&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
            ```

1. 效果

    <iframe width="640" height="498" src="https://player.bilibili.com/player.html?aid=1031924&cid=1494043&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>




