欢迎来到uola-os的Openwrt源码仓库！
=

##  默认配置
### 默认登录IP地址:10.8.1.1
###           用户:root       (路由 & SSH)
###           密码:admin      (路由 & SSH)

编译命令如下:
-

1、 首先装好 Ubuntu 64bit，推荐  Ubuntu  18 LTS x64

2、 命令行输入 `sudo apt-get update` ,然后输入
`
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync   
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