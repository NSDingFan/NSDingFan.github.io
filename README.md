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


