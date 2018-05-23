@echo off
REM 显示版本和帮助
if "%1"=="-v" (
	echo apk install v1.0
	goto :end
)else if "%1"=="-h" (
	echo Usage^: apkins ^<apk-file^>
	goto :end
)
setlocal ENABLEDELAYEDEXPANSION
set /a index=-1
echo 设备列表:
for /f "delims=	" %%i in ('adb devices') do (
	if !index! GEQ 0 echo !index! %%i
	set devs[!index!]=%%i
	set /a index=index+1
)
REM 只有一个设备直接安装
if !index!==1 goto :onedev
REM 获取用户输入的编号
set /p s=请选择需要安装的手机设备(默认为0):
if "%s%"=="" set /a s=0
REM 开始安装
adb -s !devs[%s%]! install -r %1
:onedev
adb -s !devs[0]! install -r %1
pause
:end