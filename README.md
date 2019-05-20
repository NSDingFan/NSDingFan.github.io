# NSDingFan.github.io
My personal blog with Hexo &amp; NexT

## 如果哪天咕了, 方便回坑时候快速上手

### 几个基本的指令:

首先, 在终端中切换到blog的本地路径, 然后通过:

- `hexo s` 或者 `hexo serve` 来运行本地服务器
    - 通过添加 `--drafts` 来预览草稿内容
        - `hexo s --drafts`
- `hexo clean` 清理本地文件
    - 会删除数据库和publish文件夹
- `hexo g` 或者 `hexo generate
` 生成静态文件
- `hexo d` 或者 `hexo deploy` 进行部署
- 使用 `$ hexo g -d` 或者 `$ hexo d -g` 在生成后自动部署
        
### 动手写个post
- font-matter 部分
- 内容
    - 图片 ![]()
    - `<!-- more -->` 标签控制文章在首页的显示范围
    - 视频插入参考 [自己的这个帖子](https://nsdf.top/%E9%80%9A%E8%BF%87markdown%E7%BC%96%E5%86%99blog%E8%BF%9B%E9%98%B6%E6%8A%80%E5%B7%A7.html)

# 建站时间轴

### 2018年09月06日
- 02:49:39 完成Hexo在Mac上的安装,按照教程成功生成网站
- 17:08:12 测试将blog部署至github
    1. 修改yml文件中的部署信息
    2. 按照hexo操作,进行部署

### 2018年09月07日
- 00:34:15 开始正式向 账号部署blog
- 00:57:48 GitHub上建立Blog repository,建立 hexo分支,并将其设置为主分支
    - 设定GitHub Pages
    - 将分支 repository 到电脑
- 01:04:17 使用hexo初始建站
- 03:00:45 遇到问题 
    - 问题描述:
        在使用 hexo d 部署的时候, 出现下面这样的错误
        ```bash
        remote: Permission to NSDingFan/NSDingFan.github.io.git denied to NSDingFanTest.
        fatal: unable to access 'https://github.com/NSDingFan/NSDingFan.github.io.git/': The requested URL returned error: 403
        ```

    - 问题原因:
        很显然, github用户不对, 应该是 NSDingFan 而不是 NSDingFanTest
        由于我昨天在用那个账号进行过测试,所以电脑(Mac)记住了那个用户.
        所以在今天我执行 hexo d 的时候,依然默认使用了那个用户.
        我最开始尝试在_config.yml文件中的 # Deployment 位置添加 name: 和 email: 项目, 但是不起作用.

    - 问题解决:
        经过各种google,我最后在这里找到了解决方案:(Hexo deploy git permission denied)[https://segmentfault.com/a/1190000004637936]

        - 引用文章里的解决方案:
            原因是Mac保存了上次输入的账号密码，自动填写了。
            所以解决办法是cmd+space，输入keychain access，选择左上方login+左下方password，搜索github，找到对应的记录，删除就好了。

- 22:30:19 更换主题next,开始配置新主题的相关工作
    - 关于在一个github账户下建立多个github-pages 的方法:
        例如我使用hexo建立了新的blog,但是我还想保留我的旧的使用jekyll搭建的blog:
        1. 首先我需要把旧站点的名字从username.github.io 改为其他名称,这里我改为了blog
        2. 在我的旧站点里创建一个名为 gh-pages 的分支
        3. 打开项目的Setting页面,在GitHub Pages一节,你会看到 Your site is published at https://username.github.io/blog/ 这样的消息,以后就可以通过这个域名访问老站点了.
            - 所以理论上说,可以在一个github账户下简历无数个站点,但是只能建立在域名上.
            - 参考: https://stackoverflow.com/a/15564009
        4. 接下来是需要在新建的 username.github.io 库中 完成基于hexo的blog搭建即可.

- 23:18:17 添加自定义域名

# 2018年09月08日

- 02:56:01 完成了主题的一些自定义,将之前blog中文章迁移至新blog
- 21:55:06 解决搜索功能出现问题: 一篇文章中部分内容编码存在问题
    - 有待进一步改进代码或者文档编写的流程
    - 可以考虑加入搜索框 https://liam0205.me/2017/09/21/local-search-engine-in-Hexo-site/

- 01:31:39 优化blog
    - [自动化无损缩图](https://njafei.github.io/2017/09/26/ImageOptm/)

- 02:54:58 添加RSS

# 2018年09月09日

- 23:55:34 添加Gitalk评论插件,尝试将之前Jekyll的插件转移到Gitalk使用

# 2018年09月11日

- 22:42:41 文章置顶功能,参考:https://www.ly554.com/nextmh.html
    ```
    node_modules/hexo-generator-index/lib/generator.js
    ```
    通过在文章前使用top:100 这样的标签,实现控制置顶优先级, 数值越大排位越前

- 23:28:39 添加live 2d

# 2018年09月12日

- 21:56:22 live2d 无法设定尺寸,无法设置手机开启问题, 将配置信息放到blog的配置信息中,不要放在主题配置信息中.

- 2018年09月12日22:42:09 调整canvas动画
 路径: /Users/DF/Documents/GitHub/NSDingFan.github.io/themes/next/source/lib/canvas-nest/canvas-nest.min.js
 
 
# 2019年05月20日

- 莫名其妙鸽了一年, 有点心累. 重新捡起来. 