欢迎来到uola-os的Openwrt源码仓库！
=

##  默认配置
### 默认登录IP地址:10.8.1.1
###           用户:root       (路由 & SSH)
###           密码:admin      (路由 & SSH)

编译命令如下:
-

1、 首先装好 Ubuntu 64bit，推荐  Ubuntu  18 LTS x64

2、 命令行输入以下命令
`
sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib g++-multilib \
git gperf haveged help2man intltool lib32gcc1 libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply \
python-docutils qemu-utils re2c rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
vim wget xmlto xxd zlib1g-dev
`

3、 使用 `git clone https://github.com/danxiaonuo/uola-os` 命令下载好源代码，然后 `cd uola-os` 进入目录

4、更新与安装源
```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a
```

5、生成配置文件
```bash
make menuconfig
```

6、 `make -j8 download V=s` 下载dl库（国内请尽量全局科学上网）

7、 输入 `make -j1 V=s` （-j1 后面是线程数。第一次编译推荐用单线程）即可开始编译你要的固件了。

# 欢迎访问
[![OpenWrt](https://img.shields.io/badge/From-uola-blue.svg?style=for-the-badge&logo=appveyor)](https://github.com/danxiaonuo/uola-os)