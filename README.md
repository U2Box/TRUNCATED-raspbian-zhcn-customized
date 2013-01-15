raspbian-zhcn-customized
========================

This repo is in Chinese (Simplified) ONLY. Sorry for the inconvience. 

树莓派Raspbian系统简体中文定制版。旨在减少简体中文用户安装、设置Raspbian步骤的定制版本。

当前最新版本
------------------------
130116 - 121216 （前半：本发布版制作日期，后半：Raspbian原版制作日期）

下载地址：上传中

功能
------------------------
* 默认英语（美国）键盘布局，与中国键盘一致
* 第一次开机默认扩展主分区大小填满SD卡
* 自动支持简体中文（含UTF-8和GBK）的locale，默认语言简体中文UTF-8，默认时区中国上海
* 修改APT镜像站为中国连接较快的，韩国（科学技术院，dnetwork或Neowiz）的镜像源。
* 更新系统到最新。
* 安装了VNC服务器。（但不默认自动启动，如需使用请自行设置）
* 安装了SCIM拼音输入法。
* 只需修改FAT32分区中的一个文件，即可支持有线网的动态IP，有线网固定IP或无线网。适合无显示器的应用环境。
* 无需再操作rapsi-config工具，主要配置已经做好，扩展SD卡等动态操作均自动执行。
* ……但仍然保留raspi-config，随时可用。

使用步骤
------------------------
为减小发布体积，本系统使用补丁包的方式发布。

### 准备系统镜像

1. 下载原始的`2012-12-16-wheezy-raspbian.img`文件。
2. 将补丁包的所有文件放入同一目录下。
3. 执行`patch.cmd`。（安全软件如阻止请选择“允许”）
4. 原文件不被改动。会生成新的`20130115-20121216-raspbian-zhcn.img`。

### 开机运行

1. 如果您使用有线网和DHCP自动IP，则无需任何更改。  
   如果您使用有线网和静态IP，请更改`autoconfig.ini`中的`[Wired]`部分。  
   如果您使用无线网络，请更改`autoconfig.ini`中的`[Wireless]`部分。  
2. 使用新的`.img`系统镜像文件刷卡开机。
3. 开机后会自动执行扩大分区和网络配置操作，会自动重启一次。
4. 重启后进入您指定的图形或命令行界面，无须再使用raspi-config进行配置。

内容说明
------------------------
* `construct.sh`：构建脚本。（推荐手工执行）
* `autoconfig.ini`：缩减了的`raspi-autoconfig`配置文件。
* `release-download`目录：每个发布版本的下载地址。（可能由于修复而更改）
* `release-checksum`目录：每个发布版本的SHA1验证文件。（不允许变动）
* `xdelta-tools-win32`目录：制作增量补丁的相关工具。  
  （Win32下使用。做出的xdelta补丁可跨平台。同时提供Win32下的打补丁软件）

构建步骤
------------------------
以下是本项目的制作步骤。

1. 从项目[raspi-autoconfig](https://github.com/shamiao/raspi-autoconfig)中获得`raspi-autoconfig-1stboot.sh`与`raspi-autoconfig.py`。
2. 从本项目中获得`autoconfig.ini`。
3. 树莓派刷Raspbian镜像开机，远程登录到pi用户。
4. 将以上三个文件放入`/home/pi`。
5. 其余按照本项目`construct.sh`的指示进行操作。
6. 操作完成后拔卡关机，将SD卡的前1850MiB数据，制作成新的.img文件。
7. 制作xdelta增量补丁。

关联项目`raspi-autoconfig`
------------------------
此项目是raspi-config的替代品之一。以非交互式作为特点。

运行此程序时，会读取`/boot/autoconfig.ini`中的设置，而自动执行分区扩大、网络配置、本地化配置、键盘布局配置、APT软件源配置等多种工作。

由于有些配置项目本项目已经进行，所以仅使用`raspi-autoconfig`的部分功能。因此`autoconfig.ini`中，也就不必容纳和介绍所有项目。

使用的功能列表：

* 扩展分区填满SD卡
* 启动到桌面环境还是命令行
* 有线网DHCP或静态IP
* 无线网SSID和WEP/WPA/WPA2密码
* 允许SSH，并重新生成SSH密钥
