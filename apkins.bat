@echo off
REM ��ʾ�汾�Ͱ���
if "%1"=="-v" (
	echo apk install v1.0
	goto :end
)else if "%1"=="-h" (
	echo Usage^: apkins ^<apk-file^>
	goto :end
)
setlocal ENABLEDELAYEDEXPANSION
set /a index=-1
echo �豸�б�:
for /f "delims=	" %%i in ('adb devices') do (
	if !index! GEQ 0 echo !index! %%i
	set devs[!index!]=%%i
	set /a index=index+1
)
REM ֻ��һ���豸ֱ�Ӱ�װ
if !index!==1 goto :onedev
REM ��ȡ�û�����ı��
set /p s=��ѡ����Ҫ��װ���ֻ��豸(Ĭ��Ϊ0):
if "%s%"=="" set /a s=0
REM ��ʼ��װ
adb -s !devs[%s%]! install -r %1
:onedev
adb -s !devs[0]! install -r %1
pause
:end