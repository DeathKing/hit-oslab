hit-oslab
=========

【非官方版】哈尔滨工业大学《操作系统》课程实验指导手册、实验环境（64位支持）及源码。


# 目标

针对32位和64位的Ubuntu系统，一键式搭建好环境。


# 安装

本安装脚本会将实验环境安装在用户目录下，文件名为oslab。如果有特殊需要，请自行移动文件夹位置。

```shell
git clone https://github.com/DeathKing/hit-oslab.git
cd hit-oslab
./setup.sh
```

# 反馈

本项目可以确保bochs能够正确启动，但某些64位系统在编译linux-0.11时会提示缺少某些文件，如果遇到类似问题的同学，请发issue。
