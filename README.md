hit-oslab
=========

本仓库涵盖了哈尔滨工业大学《操作系统》课程实验指导手册、实验环境（64位支持）及源码。旨在针对32位和64位的Ubuntu系统，一键式搭建好环境，为同学们节省环境配置时间。

## 在线学习与实验

![hit](https://cloud.githubusercontent.com/assets/895809/7827659/834a4424-045c-11e5-9442-43a73b8e6991.jpg)


由于历史原因，推荐大家使用实验楼提供的实验环境。本项目只做归档使用。

+ [操作系统之基础 - 网易云课堂](http://mooc.study.163.com/learn/HIT-1000002004?tid=1000002003#/learn/announce)
+ [操作系统原理与实践 - 实验楼](https://www.shiyanlou.com/courses/115)

## 安装

本安装脚本会将实验环境安装在用户目录下，文件名为oslab。如果有特殊需要，请自行移动文件夹位置。注意，请不要使用超级用户执行此安装命令，当有需要时hit-oslab会请求超级用户权限。

```shell
git clone https://github.com/DeathKing/hit-oslab.git ~/hit-oslab
cd ~/hit-oslab
./setup.sh
```

如果想要跳过软件源更新步骤，请在`./setup.sh`后加上参数`-s`或`--skip-update`。

## 复原

考虑到操作系统试验每次需要重置linux-0.11目录，oslab特别添加了重置功能。本功能由`./run`命令提供。

```shell
# in oslab directory
./run init
```

## 反馈

本项目可以确保bochs能够正确启动，但某些64位系统在编译linux-0.11时会提示缺少某些文件，如果遇到类似问题的同学，请发issue。
