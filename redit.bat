@echo off
setlocal EnableDelayedExpansion
color 0b

echo 若不需设定时间可按回车键跳过，默认时间为上午 07:30，下午 13:30
echo ******************************************************************
echo **注意 ：需要使用英文输入法
echo **此脚本只需运行一次，接下来注册的是每天的启动时间
echo ******************************************************************

rem 此处修改程序自动启动时间1,上午
set /p startTime1=请输入上午自动启动时间(24小时制，格式如  08:30):
if not defined startTime1 (set startTime1=07:30 )

rem 此处修改程序自动启动时间2, 下午
set /p startTime2=请输入下午自动启动时间（若无需启动输入-1）:
if not defined startTime2 (set startTime2=13:30 )


echo startTime1=%startTime1%
echo startTime2=%startTime2%
set Base_dir=%~dp0
cd "%Base_dir%"
SCHTASKS /Create /TN mytask /SC DAILY /ST %startTime1% /TR  "%Base_dir%run.bat"
SCHTASKS /Create /TN mytask2 /SC DAILY /ST %startTime2% /TR  "%Base_dir%run.bat"
pause