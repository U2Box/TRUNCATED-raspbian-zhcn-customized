如何制作xdelta增量补丁
========================

xdelta3是一个二进制差异比较和补丁工具。使用此工具，可以生成将原始的Raspbian镜像文件，更改为中文定制版Raspbian镜像文件所使用的补丁。

补丁部分
------------------------
将执行完构建步骤之后的SD卡，只取前1850MiB，dump为`new.img`文件。

可以先完全dump，再从前边截取。截取可使用dd等多种工具，不详述。

制作补丁文件：`xdelta3.exe -e -s [old_file] [new_file] [patch_file]`  
（old=Raspbian原镜像，new=新构建镜像，patch=补丁，使用扩展名`.xdelta`）

补丁文件统一命名为 `yymmdd-121216-raspbian-zhcn.xdelta`。

注意修改`patch.cmd`中的文件名。

校验部分
------------------------
xdelta3不提供补丁文件与原文件的校验。为保证补丁完整，以及原文件使用无误，`patch.cmd`中加入了使用SHA-1验证文件正确的环节。

验证码文件命名为 `[原文件名带扩展名].checksum`。

生成验证码文件：`sha1sum.exe [file_name] > [file_name].checksum`

需要对原Raspbian镜像，和刚刚制作的xdelta补丁生成`.checksum`校验文件。（原Raspbian的校验文件已经提供）

注意修改`patch.cmd`中的文件名。