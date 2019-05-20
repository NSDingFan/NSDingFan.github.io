---
title:  GitHub 与 GitLab 对比
data: 2019-05-20
top: 
comments: true
copyright: true
categories:
    - Git
tags:
    - Git
    - GitHub
    - GitLab
    - GitHub Desktop
---

## 整体区别
最大的区别在于开源，GitHub的使用更偏向于开源，用户可以免费的建立公开的库，私有库服务收费。并且目前是世界上最大的开源社区。开源项目非常多。而GitLab则更偏向于私有项目。用户可以免费的建立私有库，这对于我的个人项目来说很方便，可以将自己不想公开的项目存放在这里。

其次在于功能，GitLab拥有很多GitHub上没有的功能，比如web-IDE，直接在浏览器上编译项目文件， 比如对Docker的支持等等。而且可以设置分享权限，在多人开发时很有用。

整体打开速度上，GitHub稍微快一些，两个网站目前都可以正常访问。

<!-- more --> 

## 使用 GitHub Desktop 管理 GitLab

1. 打开GitLab上的项目，复制 https 链接
2. 打开电脑上的GitHub Desktop， 点击File->Clone Repostiory
3. 在弹出窗口上选择URL页面，输入第一步复制的URL，然后选择本地路径。点击Clone
4. 在clone 过程中，可能会有弹窗，要求输入用户名和密码：
    1. 如果GitLab账号没有设置二步验证，输入GitLab的用户名和密码
    2. 如果使用了二步验证，则需要输入个人访问令牌(Access Tokens)：
        1. 点击GitLab页面右上角的头像-> Settings -> Access Tokens
        2. 自定义一个Name，并勾选赋予其的权限域，然后点击 Create pers...
        3. 一定要及时复制保存给出的访问令牌，这个只会显示一次。

            ![](/images/post/github-vs-gitlab-00001.jpg)
        4. 回到GitHub Desktop弹出的界面，用户名输入 自定义的Name，密码输入给出的访问令牌（第三步的这个）
5. 如果一切顺利，应该就完成了。


## GitHub pages vs GitLab Pages

可以直接看这个[网页](https://about.gitlab.com/comparison/gitlab-pages-vs-github-pages.html)，给出了很多对比。
几个比较吸引我的点：
1. 可以将blog保存为私有项目
2. 可以为自定义域名添加SSL（https）
    - 这一点在github pages 也可以实现 
3. 对jekyll等的支持更加全面

## 使用 Terminal 管理 GitHub 和 GitLab
 咕咕咕~~~