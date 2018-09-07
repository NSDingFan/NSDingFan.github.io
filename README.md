# NSDingFan.github.io
My personal blog with Hexo &amp; NexT

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