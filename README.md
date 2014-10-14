hit-oslab
=========

本仓库涵盖了哈尔滨工业大学《操作系统》课程实验指导手册、实验环境（64位支持）及源码。旨在针对32位和64位的Ubuntu系统，一键式搭建好环境，为同学们节省环境配置时间。

# 安装

本安装脚本会将实验环境安装在用户目录下，文件名为oslab。如果有特殊需要，请自行移动文件夹位置。注意，请不要使用超级用户执行此安装命令，当有需要时hit-oslab会请求超级用户权限。

```shell
git clone https://github.com/DeathKing/hit-oslab.git ~/hit-oslab
cd ~/hit-oslab
./setup.sh
```

# 镜像源

由于hit-oslab仓库容量较大，故此项目具有多个远端仓库。其中GitLab服务器存放在哈尔滨工业大学网络中心，校内访问速度最快；GitCafe服务器访问速度次之；GitHub最慢。

+ GitLab源：git@gitlab.hit.edu.cn:DeathKing/hit-oslab.git
+ GitCafe源：git@gitcafe.com:Dysprosium/hit-oslab.git
+ GitHub源：git@github.com:DeathKing/hit-oslab.git

# 反馈

本项目可以确保bochs能够正确启动，但某些64位系统在编译linux-0.11时会提示缺少某些文件，如果遇到类似问题的同学，请发issue。
