@echo off
echo Verifying .xdelta patch file... 
sha1sum -c 130115-121216-raspbian-zhcn.xdelta.checksum
IF %ERRORLEVEL% NEQ 0 (
    echo CHECKSUM ERROR FOR .XDELTA PATH FILE!
    pause
    exit 1
)
echo Verifying Raspbian .img image file... 
sha1sum -c 2012-12-16-wheezy-raspbian.img.checksum
IF %ERRORLEVEL% NEQ 0 (
    echo CHECKSUM ERROR FOR ORIGINAL RASPBIAN .IMG IMAGE FILE!
    pause
    exit 1
)
echo Applying patch... 
xdelta3.exe -d -s 2012-12-16-wheezy-raspbian.img 130115-121216-raspbian-zhcn.xdelta 130115-121216-raspbian-zhcn.img
echo PATCH OK.
pause
exit 0
