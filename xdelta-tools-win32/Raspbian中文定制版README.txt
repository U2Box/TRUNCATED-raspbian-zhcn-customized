raspbian-zhcn-customized
https://github.com/shamiao/raspbian-zhcn-customized

树莓派Raspbian系统简体中文定制版。旨在减少简体中文用户安装、设置Raspbian步骤的定制版本。

功能

    默认英语（美国）键盘布局，与中国键盘一致
    第一次开机默认扩展主分区大小填满SD卡
    自动支持简体中文（含UTF-8和GBK）的locale，默认语言简体中文UTF-8，默认时区中国上海
    修改APT镜像站为中国连接较快的，韩国（科学技术院，dnetwork或Neowiz）的镜像源。
    更新系统到最新。
    安装了VNC服务器。（但不默认自动启动，如需使用请自行设置）
    安装了SCIM拼音输入法。
    只需修改FAT32分区中的一个文件，即可支持有线网的动态IP，有线网固定IP或无线网。适合无显示器的应用环境。
    无需再操作rapsi-config工具，主要配置已经做好，扩展SD卡等动态操作均自动执行。
    ……但仍然保留raspi-config，随时可用。

使用步骤

为减小发布体积，本系统使用补丁包的方式发布。

准备系统镜像

    下载原始的2012-12-16-wheezy-raspbian.img文件。
    将补丁包的所有文件放入同一目录下。
    执行patch.cmd。（安全软件如阻止请选择“允许”）
    原文件不被改动。会生成新的20130115-20121216-raspbian-zhcn.img。

开机运行

    如果您使用有线网和DHCP自动IP，则无需任何更改。
    如果您使用有线网和静态IP，请更改autoconfig.ini中的[Wired]部分。
    如果您使用无线网络，请更改autoconfig.ini中的[Wireless]部分。
    使用新的.img系统镜像文件刷卡开机。
    开机后会自动执行扩大分区和网络配置操作，会自动重启一次。
    重启后进入您指定的图形或命令行界面，无须再使用raspi-config进行配置。
