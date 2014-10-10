#!/bin/sh

# Harbin Insitute of Technology
# Operating System - Setup Script v0.0.1
#
# $Author$: Deng Xiongfei<dk@hit.edu.cn>
# $Date$: 2014-10-10
export OSLAB_INSTALL_PATH=$HOME/oslab

cat hit.icon
echo "|                 Environment Setup Script v0.0.1                   |"
echo "|                $ \033[34mDeng Xiongfei\033[0m <dk@hit.edu.cn> $                  |"
echo "+-------------------------------------------------------------------+"

install_gcc34_amd64() {
    echo -n "\033[31m* Install gcc-3.4 for x86_64(amd64) arch now......\033[0m"
    if [ -z `which gcc-3.4` ]; then
        sudo dpkg -i gcc-3.4/amd64/gcc-3.4-base_3.4.6-8ubuntu2_amd64.deb > /dev/null
        sudo dpkg -i gcc-3.4/amd64/cpp-3.4_3.4.6-8ubuntu2_amd64.deb > /dev/null
        sudo dpkg -i gcc-3.4/amd64/gcc-3.4_3.4.6-8ubuntu2_amd64.deb > /dev/null
        echo "\033[31mDone\033[0m"
    else
        echo "\033[32mSkip\033[0m"
    fi
}

install_gcc34_i386() {
    echo -n "\033[31m* Install gcc-3.4 for x86(i386) arch now......\033[0m"
    if [ -z `which gcc-3.4` ]; then
        sudo dpkg -i gcc-3.4/i386/gcc-3.4-base_3.4.6-8ubuntu2_i386.deb > /dev/null
        sudo dpkg -i gcc-3.4/i386/cpp-3.4_3.4.6-8ubuntu2_i386.deb > /dev/null
        sudo dpkg -i gcc-3.4/i386/gcc-3.4_3.4.6-8ubuntu2_i386.deb > /dev/null
        echo "\033[31mDone\033[0m"
    else
        echo "\033[32mSkip\033[0m"
    fi
}

install_dep_i386() {
    echo "\033[31m* Install dependencies for x86(i386) arch now......\033[0m"
    sudo apt-get install bin86 build-essential
    echo "\033[31m* Install dependencies for x86(i386) arch now......Done\033[0m"
}

install_dep_amd64() {
    echo "\033[31m* Install dependencies for x86_64(amd64) arch now......\033[0m"
    sudo apt-get install bin86 gcc-multilib build-essential
    sudo apt-get install bochs bochs-x bochs-sdl
    echo "\033[31m* Install dependencies for x86_64(amd64) arch now......Done\033[0m"
}

configure_for_i386() {
    echo -n "\033[31m* Copy rest files to oslab......\033[0m"
    cp -r i386/* $OSLAB_INSTALL_PATH
    echo "\033[31mDone\033[0m"
}

configure_for_amd64() {
    # 64-bit version bochs has to show in sdl mode, bochs-sdl required
    echo -n "\033[31m* Change bochs:display_library into sdl......\033[0m"
    echo "display_library: sdl" >> $OSLAB_INSTALL_PATH/bochs/bochsrc.bxrc
    echo "\033[31mDone\033[0m"

    echo -n "\033[31m* Copy run script to oslab......\033[0m"
    cp amd64/run $OSLAB_INSTALL_PATH
    echo "\033[31mDone\033[0m"
}

# Common Code
echo -n "\033[31m* Update apt sources......\033[33m3\033[31m sec to start\033[0m"; sleep 1
echo -n "\r\033[31m* Update apt sources......\033[33m2\033[31m sec to start\033[0m"; sleep 1
echo -n "\r\033[31m* Update apt sources......\033[33m1\033[31m sec to start\033[0m"; sleep 1
echo "\r\033[31m* Update apt sources......                                 \033[0m"
sudo apt-get update

echo -n "\033[31m* Create oslab main directory......\033[0m"
[ -d $OSLAB_INSTALL_PATH ] || mkdir $OSLAB_INSTALL_PATH
echo "\033[31mDone\033[0m"

echo -n "\033[31m* Create linux-0.11 directory......\033[0m"
[ -d $OSLAB_INSTALL_PATH/linux-0.11 ] || mkdir $OSLAB_INSTALL_PATH/linux-0.11
echo "\033[31mDone\033[0m"

# Extract linux-0.11
echo -n "\033[31m* Extract linux-0.11......\033[0m"
tar zxf common/linux-0.11.tar.gz -C $OSLAB_INSTALL_PATH/linux-0.11
echo "\033[31mDone\033[0m"

# Extract bochs and hdc image
echo -n "\033[31m* Extract bochs configuration file and hdc image......\033[0m"
tar zxf common/bochs-and-hdc.tar.gz -C $OSLAB_INSTALL_PATH/
echo "\033[31mDone\033[0m"

# `getconf LONG_BIT` works better than `uname -a`
if [ `getconf LONG_BIT` = "64" ]
then
    install_dep_amd64
    install_gcc34_amd64
    configure_for_amd64
else
    install_dep_i386
    install_gcc34_i386
    configure_for_i386
fi

echo "\033[31m* Installation finished. Ciao~\033[0m"