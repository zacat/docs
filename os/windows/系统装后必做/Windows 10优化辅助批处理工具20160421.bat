@ECHO off
TITLE Windows 10 优化辅助工具


set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
if exist %TempFile_Name% (
del %TempFile_Name% 1>nul 2>nul
GOTO menu
) else (
GOTO admin
)


:menu
CLS
COLOR 0a
MODE con: COLS=77 LINES=36

ECHO.
ECHO =============================================================================
ECHO          Windows 10 优化辅助工具            By：相守   吾爱破解               
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO    # 01、禁用索引服务                # 26、将临时文件夹移动到非系统盘    #
ECHO    # 02、禁止window发送错误报告      # 27、关闭家庭组                    #
ECHO    # 03、禁用"最近使用的项目"        # 28、延迟启动 Superfetch 服务      #
ECHO    # 04、关闭Windows Defender        # 29、设置免输密码自动登陆          #
ECHO    # 05、关闭防火墙                  # 30、关闭开机画面（GUI引导）       #
ECHO    # 06、检查更新而不自动下载更新    # 31、关闭 IPv6                     #
ECHO    # 07、启动电源计划“高性能”      # 32、关闭不需要的视觉特效          #
ECHO    # 08、调整电源选项                # 33、关闭客户体验改善计划          #
ECHO    # 09、禁用休眠（删除休眠文件）    # 34、隐藏操作中心任务栏托盘        #
ECHO    # 10、开启快速启动                # 35、关闭自动播放或自动打开U盘     #
ECHO    # 11、调整休眠文件大小            # 36、设置窗口超窄边框              #
ECHO    # 12、转移虚拟内存                # 37、删除回收站右键固定到开始屏幕  #
ECHO    # 13、关闭系统保护                # 38、直接删除文件不进入回收站      #
ECHO    # 14、关闭用户账户控制(UAC)       # 39、关闭Smartscreen应用筛选器     #
ECHO    # 15、WindowsToGo启用应用商店     # 40、关机时强制杀后台不等待        #
ECHO    # 16、关闭计划任务隐藏的自启      # 41、关闭不必要的视觉动画效果      #
ECHO    # 17、移除右键菜单SkyDrivePro     # 42、关闭程序跳转列表              #
ECHO    # 18、禁止运行计算机自动维护计划  # 43、关闭远程协助                  #
ECHO    # 19、启用.NET Framework 3.5.1    # 44、更改IE默认下载目录            #
ECHO    # 20、关闭程序兼容性助手          # 45、清理应用商店缓存              #
ECHO    # 21、禁止一联网就打开浏览器      # 46、任务栏显示“星期几”          #
ECHO    # 22、删除“这台电脑”6个文件夹   # 47、设置系统自带截屏保存到桌面    #
ECHO    # 23、显示受保护的系统文件        # 48、关闭磁盘碎片整理计划          #
ECHO    # 24、桌面显示“这台电脑”        # 49、禁用系统日志和内存转储        #
ECHO    # 25、启动IE增强保护模式          # 50、禁用疑难解答和系统诊断服务    #
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO =============================================================================

set /p a=.                  请输入操作序号并回车（例如07）：
if %a%==01 goto wsearch
if %a%==02 goto report
if %a%==03 goto history
if %a%==04 goto Defender
if %a%==05 goto firewall
if %a%==06 goto update
if %a%==07 goto HP
if %a%==08 goto powerGUID
if %a%==09 goto hibernate
if %a%==10 goto Hybrid
if %a%==11 goto hiberfil
if %a%==12 goto pagefile
if %a%==13 goto restore
if %a%==14 goto UAC
if %a%==15 goto store
if %a%==16 goto plan
if %a%==17 goto SkyDrive
if %a%==18 goto SD
if %a%==19 goto NetFX3
if %a%==20 goto PCA
if %a%==21 goto AP
if %a%==22 goto 6FD
if %a%==23 goto SHOWALL
if %a%==24 goto TC
if %a%==25 goto IE
if %a%==26 goto temp
if %a%==27 goto HG
if %a%==28 goto Superfetch
if %a%==29 goto netplwiz
if %a%==30 goto GUI
if %a%==31 goto IPV6
if %a%==32 goto VE
if %a%==33 goto CEIP
if %a%==34 goto wsc
if %a%==35 goto autoUSB
if %a%==36 goto PB
if %a%==37 goto RBM
if %a%==38 goto DFD
if %a%==39 goto SC
if %a%==40 goto TO
if %a%==41 goto DWM
if %a%==42 goto history
if %a%==43 goto SPR
if %a%==44 goto IED
if %a%==45 goto wsreset
if %a%==46 goto week
if %a%==47 goto screenshot
if %a%==48 goto dfrgui
if %a%==49 goto log
if %a%==50 goto DPS
if %a%==hide goto menu2
if %a%==exit exit
goto cho


:wsearch
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO              禁用索引服务
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto wsearch1
If ErrorLevel 2 If Not ErrorLevel 3 Goto wsearch2

:wsearch1
sc stop WMPNetworkSvc
echo 按任意键继续操作
pause>nul
sc stop wsearch
sc config WMPNetworkSvc start= disabled
sc config wsearch start= disabled
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:wsearch2
sc config wsearch start= auto
sc config WMPNetworkSvc start= delayed-auto
sc start wsearch
sc start WMPNetworkSvc
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:report
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         禁止window发送错误报告
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto report1
If ErrorLevel 2 If Not ErrorLevel 3 Goto report2

:report1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:report2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:history
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          禁用"最近使用的项目"
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto history1
If ErrorLevel 2 If Not ErrorLevel 3 Goto history2

:history1
CLS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /t REG_BINARY /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PastIconsStream" /t REG_BINARY /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:history2
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /d 1 /t REG_DWORD /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PastIconsStream" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:Defender
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          关闭Windows Defender
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto Defender1
If ErrorLevel 2 If Not ErrorLevel 3 Goto Defender2

:Defender1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:Defender2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
sc start WinDefend
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:firewall
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           关闭Windows防火墙
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto firewall1
If ErrorLevel 2 If Not ErrorLevel 3 Goto firewall2

:firewall1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo.
echo 按1直接返回主菜单，按2继续停止防火墙服务
echo.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto menu
If ErrorLevel 2 If Not ErrorLevel 3 sc stop MpsSvc & sc config MpsSvc start=disabled & Goto menu


:firewall2
sc config MpsSvc start=auto
sc start MpsSvc
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:update
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         检查更新而不自动下载更新
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto update1
If ErrorLevel 2 If Not ErrorLevel 3 Goto update2

:update1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /d 2 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallDay" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "ScheduledInstallTime" /d 3 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:update2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:HP
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          启动电源计划“高性能”
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto HP1
If ErrorLevel 2 If Not ErrorLevel 3 Goto HP2

:HP1
powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 成功切换到电源计划“高性能”。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:HP2
CLS
MODE con: COLS=40 LINES=17
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            请选择电源计划
ECHO.
ECHO             1、平衡(推荐)
ECHO.
ECHO             2、节能
ECHO.                
ECHO             3、高性能
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 123 /N /M 选择（1、2、3）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto PP1
If ErrorLevel 2 If Not ErrorLevel 3 Goto PP2
If ErrorLevel 3 If Not ErrorLevel 4 Goto PP3

:PP1
powercfg.exe -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 成功切换到电源计划“平衡”。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:PP2
powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 成功切换到电源计划“节能”。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:PP3
powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 成功切换到电源计划“高性能”。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:powerGUID
CLS
MODE con: COLS=70 LINES=10
powercfg /l
set /p SCHEME_GUID=请输入需要调整的电源方案GUID:
goto power


:power
powercfg.exe -setactive %SCHEME_GUID%
CLS
MODE con: COLS=55 LINES=21
ECHO.
ECHO.
ECHO    *************************************************
ECHO.
ECHO                      调整电源选项
ECHO.
ECHO       1.按电源按钮时        6、调整显示器亮度
ECHO.
ECHO       2.按睡眠按钮时        7、唤醒时需要密码
ECHO.
ECHO       3、关闭盖子时         8、在此时间后关闭硬盘
ECHO.
ECHO       4、关闭显示器时间     9、混合睡眠
ECHO.
ECHO       5、进入睡眠状态时间   0、在此时间后休眠
ECHO.
ECHO    *************************************************
ECHO.
ECHO.
Choice /C 0123456789 /N /M 选择（1、2、3、4、5、6、7、8、9、0）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto power0
If ErrorLevel 2 If Not ErrorLevel 3 Goto power1
If ErrorLevel 3 If Not ErrorLevel 4 Goto power2
If ErrorLevel 4 If Not ErrorLevel 5 Goto power3
If ErrorLevel 5 If Not ErrorLevel 6 Goto power4
If ErrorLevel 6 If Not ErrorLevel 7 Goto power5
If ErrorLevel 7 If Not ErrorLevel 8 Goto power6
If ErrorLevel 8 If Not ErrorLevel 9 Goto power7
If ErrorLevel 9 If Not ErrorLevel 10 Goto power8
If ErrorLevel 10 If Not ErrorLevel 11 Goto power9

:power1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
CLS
MODE con: COLS=40 LINES=19
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               按电源按钮时
ECHO.
ECHO             1、不采取任何操作
ECHO.
ECHO             2、睡眠
ECHO.                
ECHO             3、休眠
ECHO.
ECHO             4、关机
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 1234 /N /M 选择（1、2、3、4）：
If ErrorLevel 1 If Not ErrorLevel 2 GOTO POWERBUTTON1
If ErrorLevel 2 If Not ErrorLevel 3 GOTO POWERBUTTON2
If ErrorLevel 3 If Not ErrorLevel 4 GOTO POWERBUTTON3
If ErrorLevel 4 If Not ErrorLevel 5 GOTO POWERBUTTON4

:POWERBUTTON1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 0
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "ACSettingIndex" /d "0" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "DCSettingIndex" /d "0" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:POWERBUTTON2
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 1
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "ACSettingIndex" /d "1" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "DCSettingIndex" /d "1" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
powercfg.exe -setactive %SCHEME_GUID%
goto power

:POWERBUTTON3
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 2
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "ACSettingIndex" /d "2" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "DCSettingIndex" /d "2" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:POWERBUTTON4
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "ACSettingIndex" /d "3" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280" /v "DCSettingIndex" /d "3" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power2
CLS
MODE con: COLS=40 LINES=17
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               按睡眠按钮时
ECHO.
ECHO             1、不采取任何操作
ECHO.
ECHO             2、睡眠
ECHO.                
ECHO             3、休眠
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 123 /N /M 选择（1、2、3）：
If ErrorLevel 1 If Not ErrorLevel 2 goto sleepbutton1
If ErrorLevel 2 If Not ErrorLevel 3 goto sleepbutton2
If ErrorLevel 3 If Not ErrorLevel 4 goto sleepbutton3


:sleepbutton1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "ACSettingIndex" /d "0" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "DCSettingIndex" /d "0" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:sleepbutton2
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "ACSettingIndex" /d "1" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "DCSettingIndex" /d "1" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:sleepbutton3
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 2
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "ACSettingIndex" /d "2" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB" /v "DCSettingIndex" /d "2" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power3
CLS
MODE con: COLS=40 LINES=19
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO                关闭盖子时
ECHO.
ECHO             1、不采取任何操作
ECHO.
ECHO             2、睡眠
ECHO.                
ECHO             3、休眠
ECHO.
ECHO             4、关机
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 1234 /N /M 选择（1、2、3、4）：
If ErrorLevel 1 If Not ErrorLevel 2 goto cover1
If ErrorLevel 2 If Not ErrorLevel 3 goto cover2
If ErrorLevel 3 If Not ErrorLevel 4 goto cover3
If ErrorLevel 4 If Not ErrorLevel 5 goto cover4

:cover1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "ACSettingIndex" /d "0" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "DCSettingIndex" /d "0" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:cover2
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "ACSettingIndex" /d "1" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "DCSettingIndex" /d "1" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:cover3
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 2
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "ACSettingIndex" /d "2" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "DCSettingIndex" /d "2" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:cover4
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
rem powercfg -setacvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 3
rem powercfg -setdcvalueindex %SCHEME_GUID% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "ACSettingIndex" /d "3" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936" /v "DCSettingIndex" /d "3" /t REG_DWORD /f
If ErrorLevel 1 If Not ErrorLevel 2 goto error
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power4
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
CLS
MODE con: COLS=60 LINES=5
set /p S1=请输入关闭显示器前等待时间(秒,0表示常亮)：
powercfg -setacvalueindex %SCHEME_GUID% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e %S1%
powercfg -setdcvalueindex %SCHEME_GUID% 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e %S1%
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power5
CLS
MODE con: COLS=65 LINES=5
set /p S2=请输入计算机进入睡眠状态前等待时间(秒,输入0不睡眠)：
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -setacvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da %S2%
powercfg -setdcvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da %S2%
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power6
CLS
MODE con: COLS=40 LINES=5
set /p S3=请输入显示器亮度值(%,0-100)：
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
powercfg -setacvalueindex %SCHEME_GUID% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %S3%
powercfg -setdcvalueindex %SCHEME_GUID% 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %S3%
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power7
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             唤醒时需要密码
ECHO.
ECHO                1.启用
ECHO.
ECHO                2.禁用
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 goto awakepsw1
If ErrorLevel 2 If Not ErrorLevel 3 goto awakepsw2

:awakepsw1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "ACSettingIndex" /d "1" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "DCSettingIndex" /d "1" /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:awakepsw2
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "ACSettingIndex" /d "0" /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v "DCSettingIndex" /d "0" /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power8
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
CLS
MODE con: COLS=50 LINES=5
set /p S4=请输入关闭硬盘前等待时间(秒,0表示不关闭)：
powercfg /setacvalueindex %SCHEME_GUID% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e %S4%
powercfg /setdcvalueindex %SCHEME_GUID% 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e %S4%
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power9
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               混合睡眠
ECHO.
ECHO                1.启用
ECHO.
ECHO                2.禁用
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 goto Hybridsleep1
If ErrorLevel 2 If Not ErrorLevel 3 goto Hybridsleep2

:Hybridsleep1
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
powercfg /setacvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
powercfg /setdcvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power

:Hybridsleep2
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
powercfg /setacvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
powercfg /setdcvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 设置成功，按任意键返回
pause>nul
goto power


:power0
if /i "%SCHEME_GUID%"=="a1841308-3541-4fab-bc81-f71556f20b4a" (powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c) else powercfg.exe -setactive a1841308-3541-4fab-bc81-f71556f20b4a
CLS
MODE con: COLS=50 LINES=5
set /p S5=请输入休眠前等待时间(秒,0表示不休眠)：
powercfg /setacvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 %S5%
powercfg /setdcvalueindex %SCHEME_GUID% 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 %S5%
If ErrorLevel 1 If Not ErrorLevel 2 goto error
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 全部电源选项已设置完成，按任意键返回主菜单
pause>nul
powercfg.exe -setactive %SCHEME_GUID%
goto menu


:hibernate
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          禁用休眠（删除休眠文件）
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto hibernate1
If ErrorLevel 2 If Not ErrorLevel 3 Goto hibernate2

:hibernate1
POWERCFG -H OFF
ECHO 操作成功。
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:hibernate2
POWERCFG -H ON
ECHO 恢复休眠功能成功。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:Hybrid
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         开启快速启动(Hybrid Boot)
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto Hybridboot1
If ErrorLevel 2 If Not ErrorLevel 3 Goto Hybridboot2

:Hybridboot1
powercfg -h on
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "HiberbootEnabled" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回主菜单
pause>nul
goto menu

:Hybridboot2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "HiberbootEnabled" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回主菜单
pause>nul
goto menu


:hiberfil
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            调整休眠文件大小
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto hiberfil1
If ErrorLevel 2 If Not ErrorLevel 3 Goto hiberfil2

:hiberfil1
CLS
MODE con: COLS=40 LINES=8
echo 最低系统限制为默认值(总内存）的50%%
echo 直接输入数字即可，不需加百分号
set /p b=请输入休眠文件调整为百分之
POWERCFG -H on
powercfg /h size %b%
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:hiberfil2
POWERCFG -H on
powercfg /h size 100
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 休眠文件恢复为默认大小。
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:pagefile
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         转移虚拟内存到非系统盘
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto pagefile1
If ErrorLevel 2 If Not ErrorLevel 3 Goto pagefile2

:pagefile1
CLS
MODE con: COLS=40 LINES=15
set /p disk=请输入虚拟内存转移到的目标分区盘符(如d)：
echo.
echo 自动管理虚拟内存初始大小和最大值请输入0
echo.
echo 按任意键指定虚拟内存大小
pause>nul
set /p min=请输入虚拟内存初始大小(M,如1024)：
set /p max=请输入虚拟内存最大值(M,如4096)：
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "PagingFiles" /d "%disk%:\pagefile.sys %min% %max%" /t REG_MULTI_SZ /f
ECHO “重启电脑生效”，按任意键返回主菜单
pause>nul
GOTO menu

:pagefile2
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "PagingFiles" /d "?:\pagefile.sys" /t REG_MULTI_SZ /f
ECHO “重启电脑生效”，按任意键返回主菜单
pause>nul
GOTO menu


:restore
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         关闭系统保护并删除还原点
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto restore1
If ErrorLevel 2 If Not ErrorLevel 3 Goto restore2

:restore1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 0 /t REG_DWORD /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SPP\Clients" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /d 1 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:restore2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /d 1 /t REG_DWORD /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" /v "DisableSR" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "LimitSystemRestoreCheckpointing" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo.
ECHO 已启用系统保护配置
echo 请自行打开系统盘的系统保护功能
ECHO 按任意键返回主菜单
SystemPropertiesProtection.exe
pause>nul
GOTO menu


:UAC
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           关闭用户账户控制(UAC)
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto UAC1
If ErrorLevel 2 If Not ErrorLevel 3 Goto UAC2

:UAC1
rem reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:UAC2
rem reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 5 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:SkyDrive
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       移除右键菜单中的SkyDrive Pro
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto SkyDrive1
If ErrorLevel 2 If Not ErrorLevel 3 Goto SkyDrive2

:SkyDrive1
reg delete "HKEY_CLASSES_ROOT\AllFilesystemObjects\shell\SPFS.ContextMenu" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SkyDrive2
echo Sorry,暂时无法恢复SkyDrive Pro菜单
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:store
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO    WindowsToGo下启用应用商店(企业版)
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto store1
If ErrorLevel 2 If Not ErrorLevel 3 Goto store2

:store1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:store2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:plan
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         禁用任务计划程序自启项
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto plan1
If ErrorLevel 2 If Not ErrorLevel 3 Goto plan2

:plan1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Routine Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineUA"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineCore"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
echo 一些计划任务已经禁用，你可以再看看。
echo 按任意键将打开任务计划程序
pause>nul
start taskschd.msc /s
GOTO menu

:plan2
CLS
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\SkyDrive\Routine Maintenance Task"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
SCHTASKS /Change /ENABLE /TN "\GoogleUpdateTaskMachineUA"
SCHTASKS /Change /ENABLE /TN "\GoogleUpdateTaskMachineCore"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
SCHTASKS /Change /ENABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%"
SCHTASKS /Change /ENABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
pause>nul
ECHO 已经恢复被禁用的计划任务。
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:SD
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       禁止运行计算机自动维护计划
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto SD1
If ErrorLevel 2 If Not ErrorLevel 3 Goto SD2

:SD1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SD2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:NetFX3
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        启用.NET Framework 3.5.1
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto NetFX31
If ErrorLevel 2 If Not ErrorLevel 3 Goto NetFX32

:NetFX31
echo 请先挂载对应版本的Windows安装镜像
set /p c=请输入挂载的Windows镜像盘符：
dism.exe /online /enable-feature /featurename:NetFX3 /Source:%c%:\sources\sxs
If ErrorLevel 1 If Not ErrorLevel 2 Goto error
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:NetFX32
start OptionalFeatures.exe
echo 关闭.NET Framework 3.5请取消勾选即可。
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:PCA
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           关闭程序兼容性助手
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto PCA1
If ErrorLevel 2 If Not ErrorLevel 3 Goto PCA2

:PCA1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
gpupdate /force
sc stop PcaSvc
sc config PcaSvc start= disabled
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:PCA2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
sc config PcaSvc start= auto
sc start PcaSvc
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:AP
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          禁止一联网就打开浏览器
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto AP1
If ErrorLevel 2 If Not ErrorLevel 3 Goto AP2

:AP1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:AP2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:6FD
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         删除“这台电脑”6个文件夹
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto 6FD1
If ErrorLevel 2 If Not ErrorLevel 3 Goto 6FD2

:6FD1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:6FD2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:SHOWALL
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          显示受保护的系统文件
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto SHOWALL1
If ErrorLevel 2 If Not ErrorLevel 3 Goto SHOWALL2

:SHOWALL1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v "CheckedValue" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SHOWALL2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v "CheckedValue" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:TC
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          桌面显示“这台电脑”
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto TC1
If ErrorLevel 2 If Not ErrorLevel 3 Goto TC2

:TC1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:TC2
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu



:IE
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           启用IE增强保护模式
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto IE1
If ErrorLevel 2 If Not ErrorLevel 3 Goto IE2

:IE1
CLS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /d "PMEM" /t REG_SZ /f
set /p Isolation64Bit=64位系统请输入1，其它请直接回车：
if %Isolation64Bit%==1 reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO.
ECHO “重启电脑生效”，按任意键返回主菜单
pause>nul
GOTO menu

:IE2
CLS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /d "PMIL" /t REG_SZ /f
set /p Isolation64Bit=64位系统请输入1，其它请直接回车
if %Isolation64Bit%==1 reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu


:temp
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       将临时文件夹移动到非系统盘
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto temp1
If ErrorLevel 2 If Not ErrorLevel 3 Goto temp2

:temp1
CLS
MODE con: COLS=40 LINES=8
set /p e=请输入转移到的目标分区盘符(如D)：
reg add "HKEY_CURRENT_USER\Environment" /v "TMP" /d "%e%:\userdata\temp" /t REG_EXPAND_SZ /f
reg add "HKEY_CURRENT_USER\Environment" /v "TEMP" /d "%e%:\userdata\temp" /t REG_EXPAND_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 临时文件夹成功转移到%e%:\userdata\temp
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu

:temp2
reg add "HKEY_CURRENT_USER\Environment" /v "TMP" /d "%USERPROFILE%\AppData\Local\Temp" /t REG_EXPAND_SZ /f
reg add "HKEY_CURRENT_USER\Environment" /v "TEMP" /d "%USERPROFILE%\AppData\Local\Temp" /t REG_EXPAND_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 临时文件夹路径已恢复默认
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu


:HG
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               关闭家庭组
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto HG1
If ErrorLevel 2 If Not ErrorLevel 3 Goto HG2

:HG1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:HG2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:Superfetch
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        延迟启动 Superfetch 服务
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto Superfetch1
If ErrorLevel 2 If Not ErrorLevel 3 Goto Superfetch2

:Superfetch1
sc config "SysMain" start= delayed-auto
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:Superfetch2
sc config "SysMain" start= auto
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:netplwiz
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          设置免输密码自动登陆
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto netplwiz1
If ErrorLevel 2 If Not ErrorLevel 3 Goto netplwiz2

:netplwiz1
CLS
set /p DUN=请输入用户名：
set /p PSW1=请输入密码：
set /p PSW2=请再次输入密码确认：
if %PSW1%==%PSW2% goto confirm
echo 两次输入的密码不一致
echo 按任意键返回重新输入
pause>nul
goto netplwiz1

:confirm
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d 1 /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /d "%DUN%" /t REG_SZ /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /d "%PSW1%" /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:netplwiz2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /d 0 /t REG_SZ /f
reg DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:GUI
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         关闭开机画面（GUI引导）
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto GUI1
If ErrorLevel 2 If Not ErrorLevel 3 Goto GUI2

:GUI1
bcdedit /set quietboot on
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:GUI2
bcdedit /set quietboot off
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:IPV6
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO              关闭 IPv6
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto IPV61
If ErrorLevel 2 If Not ErrorLevel 3 Goto IPV62

:IPV61
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" /v "DisabledComponents" /d 255 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO.
ECHO “重启生效”，按任意键返回主菜单
pause>nul
GOTO menu

:IPV62
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters" /v "DisabledComponents" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO.
ECHO “重启生效”，按任意键返回主菜单
pause>nul
GOTO menu


:VE
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          关闭不需要的视觉效果
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto VE1
If ErrorLevel 2 If Not ErrorLevel 3 Goto VE2

:VE1
CLS
MODE con: COLS=75 LINES=22
ECHO.
ECHO.
ECHO  *************************************************************************
ECHO.
ECHO               选择需要“关闭”的视觉效果   By：相守  吾爱破解
ECHO.
echo      1、保存任务栏缩略图预览        10、显示半透明的选择长方形
echo      2、窗口内的动画控件和元素      11、显示缩略图，而不是显示图标
echo      3、淡入淡出或滑动菜单到视图    12、在窗口下显示阴影
echo      4、滑动打开组合框              13、在单击后淡出菜单
echo      5、平滑滚动列表框              14、在视图中淡入淡出或滑动工具提示
echo      6、平滑屏幕字体边缘            15、在鼠标指针下显示阴影
echo      7、启用Peek预览                16、在桌面上为图标标签使用阴影
echo      8、 任务栏中的动画             17、在最大化和最小化时显示窗口动画
echo      9、拖动时显示窗口内容          18、调整为最佳性能
ECHO.
ECHO  *************************************************************************
ECHO.
ECHO      备注：2，3、4、5，12，13、14，15项键值在同一个地方，需要一起设置
ECHO.
ECHO.
set /p f=.           请输入操作序号并回车（例如9）,输入0直接返回主菜单：
if %f%==0 goto menu
if %f%==1 goto ve001
if %f%==2 goto othersVECFG
if %f%==3 goto othersVECFG
if %f%==4 goto othersVECFG
if %f%==5 goto othersVECFG
if %f%==6 goto ve006
if %f%==7 goto ve007
if %f%==8 goto ve008
if %f%==9 goto ve009
if %f%==10 goto ve010
if %f%==11 goto ve011
if %f%==12 goto othersVECFG
if %f%==13 goto othersVECFG
if %f%==14 goto othersVECFG
if %f%==15 goto othersVECFG
if %f%==16 goto ve016
if %f%==17 goto ve017
if %f%==18 goto ve018
GOTO VE1error

:ve001
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve006
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /d 0 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve007
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve008
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve009
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve010
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve011
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve016
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 注销后生效，按任意键返回
pause>nul
goto VE1

:ve017
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve018
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /d 1 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /d "9012038010000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo “注销”生效，按任意键返回
pause>nul
goto VE1

:VE1error
CLS
MODE con: COLS=40 LINES=16
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            输入有误，请选择：
ECHO.
ECHO        1.返回继续更改视觉效果
ECHO.
ECHO        2.打开性能选项自行修改
ECHO.
ECHO        3.返回主菜单
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 123 /N /M 选择（1、2、3）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto VE1
If ErrorLevel 2 If Not ErrorLevel 3 start SystemPropertiesPerformance.exe & Goto menu
If ErrorLevel 3 If Not ErrorLevel 4 Goto menu

:VE2
CLS
MODE con: COLS=75 LINES=22
ECHO.
ECHO.
ECHO  *************************************************************************
ECHO.
ECHO             选择需要“打开”的视觉效果   By：相守  吾爱破解
ECHO.
echo      1、保存任务栏缩略图预览        10、显示半透明的选择长方形
echo      2、窗口内的动画控件和元素      11、显示缩略图，而不是显示图标
echo      3、淡入淡出或滑动菜单到视图    12、在窗口下显示阴影
echo      4、滑动打开组合框              13、在单击后淡出菜单
echo      5、平滑滚动列表框              14、在视图中淡入淡出或滑动工具提示
echo      6、平滑屏幕字体边缘            15、在鼠标指针下显示阴影
echo      7、启用Peek预览                16、在桌面上为图标标签使用阴影
echo      8、 任务栏中的动画             17、在最大化和最小化时显示窗口动画
echo      9、拖动时显示窗口内容          18、调整为最佳外观
ECHO.
ECHO  *************************************************************************
ECHO.
ECHO      备注：2，3、4、5，12，13、14，15项键值在同一个地方，需要一起设置
ECHO.
ECHO.
set /p g=.           请输入操作序号并回车（例如9）,输入0直接返回主菜单：
if %g%==0 goto menu
if %g%==1 goto ve001
if %g%==2 goto othersVECFG
if %g%==3 goto othersVECFG
if %g%==4 goto othersVECFG
if %g%==5 goto othersVECFG
if %g%==6 goto ve006
if %g%==7 goto ve007
if %g%==8 goto ve008
if %g%==9 goto ve009
if %g%==10 goto ve010
if %g%==11 goto ve011
if %g%==12 goto othersVECFG
if %g%==13 goto othersVECFG
if %g%==14 goto othersVECFG
if %g%==15 goto othersVECFG
if %g%==16 goto ve016
if %g%==17 goto ve017
if %g%==18 goto ve018
GOTO VE2error

:ve001
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve006
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve007
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve008
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve009
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /d 1 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve010
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve011
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve016
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve017
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 1 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo 按任意键返回
pause>nul
goto VE1

:ve018
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /d 1 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 1 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /d "9E3E078012000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
echo “注销”生效，按任意键返回
pause>nul
goto VE2

:VE2error
CLS
MODE con: COLS=40 LINES=16
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            输入有误，请选择：
ECHO.
ECHO        1.返回继续更改视觉效果
ECHO.
ECHO        2.打开性能选项自行修改
ECHO.
ECHO        3.返回主菜单
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 123 /N /M 选择（1、2、3）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto VE2
If ErrorLevel 2 If Not ErrorLevel 3 start SystemPropertiesPerformance.exe & Goto menu
If ErrorLevel 3 If Not ErrorLevel 4 Goto menu


:othersVECFG
CLS
MODE con: COLS=30 LINES=5
set a=9###0#801#000000
echo 窗口内的动画控件和元素
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 set b=%a:#00=200%
If ErrorLevel 2 If Not ErrorLevel 3 set b=%a:#00=000%
echo 按任意键设置下一选项
pause>nul
rem 9###0#801*000000

CLS
MODE con: COLS=30 LINES=5
echo 在窗口下显示阴影
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 set b=%b:0#8=078%
If ErrorLevel 2 If Not ErrorLevel 3 set b=%b:0#8=038%
echo 按任意键设置下一选项
pause>nul
rem 9###0*801*000000

CLS
MODE con: COLS=30 LINES=5
echo 在鼠标指针下显示阴影
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 set b=%b:9###0=9#3#0%
If ErrorLevel 2 If Not ErrorLevel 3 set b=%b:9###0=9#1#0%
echo 按任意键设置下一选项
pause>nul
rem 9#*#0*801*000000

CLS
MODE con: COLS=30 LINES=5
echo 在单击后淡出菜单
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 set c=e
If ErrorLevel 2 If Not ErrorLevel 3 set c=a
echo 按任意键设置下一选项
pause>nul

CLS
MODE con: COLS=40 LINES=5
echo 在视图中淡入淡出或滑动工具提示
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 if %c%==e (set b=%b:#0=e0%) else (set b=%b:#0=a0%)
If ErrorLevel 2 If Not ErrorLevel 3 if %c%==a (set b=%b:#0=20%) else (set b=%b:#0=60%)
echo 按任意键设置下一选项
pause>nul
rem 9#***801*000000

CLS
MODE con: COLS=40 LINES=5
echo 淡入淡出或滑动菜单到视图
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 set d=e6a2
If ErrorLevel 2 If Not ErrorLevel 3 set d=c840
echo 按任意键设置下一选项
pause>nul

CLS
MODE con: COLS=30 LINES=5
echo 滑动打开组合框
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 if %d%==e6a2 (set d=e6) else (set d=c4)
If ErrorLevel 2 If Not ErrorLevel 3 if %d%==c840 (set d=80) else (set d=a2)
echo 按任意键设置下一选项
pause>nul

CLS
MODE con: COLS=30 LINES=5
echo 平滑滚动列表框
echo 按1打开，按2关闭
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 goto lastif1
If ErrorLevel 2 If Not ErrorLevel 3 goto lastif2

:lastif1
IF %d%==e6 (  set b=%b:9#=9e%) ELSE (
    if %d%==c4 (
      set b=%b:9#=9c%
    ) ELSE (
        if  %d%==80 (
          set b=%b:9#=98%
        ) ELSE (
          set b=%b:9#=9a%
        )
    )
)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /d "%b%" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO VE1

:lastif2
IF %d%==e6 (  set b=%b:9#=96%) ELSE (
    if %d%==c4 (
      set b=%b:9#=94%
    ) ELSE (
        if  %d%==80 (
          set b=%b:9#=90%
        ) ELSE (
          set b=%b:9#=92%
        )
    )
)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /d "%b%" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO VE1


:CEIP
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         关闭客户体验改善计划
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto CEIP1
If ErrorLevel 2 If Not ErrorLevel 3 Goto CEIP2

:CEIP1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:CEIP2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:wsc
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          隐藏操作中心任务栏托盘
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto wsc1
If ErrorLevel 2 If Not ErrorLevel 3 Goto wsc2

:wsc1
CLS
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:wsc2
CLS
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:autoUSB
CLS
MODE con: COLS=40 LINES=14
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             关闭自动播放
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto autoUSB1
If ErrorLevel 2 If Not ErrorLevel 3 Goto autoUSB2

:autoUSB1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 255 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 255 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:autoUSB2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:PB
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           设置窗口超窄边框
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto PB1
If ErrorLevel 2 If Not ErrorLevel 3 Goto PB2

:PB1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d 0 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启生效，按任意键返回主菜单
pause>nul
GOTO menu

:PB2
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d -60 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启生效，按任意键返回主菜单
pause>nul
GOTO menu


:RBM
CLS
MODE con: COLS=40 LINES=14
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO      删除回收站右键固定到开始屏幕
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto RBM1
If ErrorLevel 2 If Not ErrorLevel 3 Goto RBM2

:RBM1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:RBM2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /ve /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:SC
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        关闭Smartscreen应用筛选器
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto SC1
If ErrorLevel 2 If Not ErrorLevel 3 Goto SC2

:SC1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SC2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d RequireAdmin /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:TO
CLS
MODE con: COLS=40 LINES=14
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         关机时强制杀后台不等待
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto TO1
If ErrorLevel 2 If Not ErrorLevel 3 Goto TO2

:TO1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:TO2
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 5000 /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:DWM
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        关闭不必要的视觉动画效果
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto DWM1
If ErrorLevel 2 If Not ErrorLevel 3 Goto DWM2

:DWM1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:DWM2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DWM" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 1 /t REG_SZ /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SPR
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             关闭远程协助
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto SPR1
If ErrorLevel 2 If Not ErrorLevel 3 Goto SPR2

:SPR1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:SPR2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:IED
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          更改IE默认下载目录
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto IED1
If ErrorLevel 2 If Not ErrorLevel 3 Goto IED2

:IED1
set /p d=请输入IE下载路径(如"D:\迅雷下载")：
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /d "%d%" /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu

:IED2
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu


:wsreset
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            清理应用商店缓存
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto wsreset1
If ErrorLevel 2 If Not ErrorLevel 3 Goto wsreset2

:wsreset1
CLS
echo 如果你之前使用过本工具
echo.
echo 请在将打开的任务管理器中重启资源管理器
echo.
echo 桌面闪一下才行
echo.
echo 再按任意键继续执行操作
start taskmgr
pause>nul
wsreset
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:wsreset2
echo 缓存已清除，无法恢复。
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:DFD
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        直接删除文件不进入回收站
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto DFD1
If ErrorLevel 2 If Not ErrorLevel 3 Goto DFD2

:DFD1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecycleFiles" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /d 1 /t REG_dword /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:DFD2
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecycleFiles" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /d 0 /t REG_dword /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "ConfirmFileDelete" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:week
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         任务栏日期显示“星期几”
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto week1
If ErrorLevel 2 If Not ErrorLevel 3 Goto week2

:week1
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sLongDate" /d "yyyy'年'M'月'd'日', dddd" /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortDate" /d "yyyy/M/d/ddd" /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:week2
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sLongDate" /d "yyyy'年'M'月'd'日'" /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortDate" /d "yyyy/M/d" /t REG_SZ /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:screenshot
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       设置系统自带截屏保存到桌面
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
ECHO     提示：快捷键Win+PrintScreen截屏
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto screenshot1
If ErrorLevel 2 If Not ErrorLevel 3 Goto screenshot2

:screenshot1
rd /s /q %userprofile%\pictures\Screenshots
mklink /j %userprofile%\pictures\Screenshots %userprofile%\desktop
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:screenshot2
rd /s /q %userprofile%\pictures\Screenshots
echo 操作成功。
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:dfrgui
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          关闭磁盘碎片整理计划
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto dfrgui1
If ErrorLevel 2 If Not ErrorLevel 3 Goto dfrgui2

:dfrgui1
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:dfrgui2
SCHTASKS /Change /ENABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:log
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO          禁用系统日志和内存转储
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto log1
If ErrorLevel 2 If Not ErrorLevel 3 Goto log2

:log1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "LogEvent" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /d 0 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /d 1 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /d 1 /t REG_dword /f
gpupdate /force
wmic recoveros set DebugInfoType = 0
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:log2
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "LogEvent" /d 1 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /d 1 /t REG_dword /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Windows Error Reporting" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /f
gpupdate /force
wmic recoveros set DebugInfoType=2
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


:DPS
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       禁用疑难解答和系统诊断服务
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto DPS1
If ErrorLevel 2 If Not ErrorLevel 3 Goto DPS2

:DPS1
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop DPS
sc config DPS start= disabled
sc config WdiServiceHost start= disabled
sc config WdiSystemHost start= disabled
ECHO 按任意键返回主菜单
pause>nul
GOTO menu

:DPS2
sc config DPS start= auto
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc start DPS
ECHO 按任意键返回主菜单
pause>nul
GOTO menu


rem 持续添加中，Hold On Please!
:menu2
CLS
COLOR 0a
MODE con: COLS=77 LINES=36
ECHO.
ECHO =============================================================================
ECHO           Windows 8.1 Update 优化辅助工具(续)    By：相守  吾爱破解                       
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO    # 01、去除快捷方式小箭头和后缀*   # 26、将临时文件夹移动到非系统盘    #
ECHO    # 02、去除UAC小盾牌*              # 27、关闭家庭组                    #
ECHO    # 03、IE11开启企业模式*           # 28、延迟启动 Superfetch 服务      #
ECHO    # 04、启用Administrator账户*      # 29、设置免输密码自动登陆          #
ECHO    # 05、隐藏导航窗格家庭组和网络*   # 30、关闭开机画面（GUI引导）       #
ECHO    # 06、指向右上角不显示超级按钮*   # 31、关闭 IPv6                     #
ECHO    # 07、开始屏幕自动显示"应用"视图* # 32、关闭不需要的视觉特效          #
ECHO    # 08、登录显示桌面而非开始屏幕*   # 33、关闭客户体验改善计划          #
ECHO    # 09、关闭操作中心消息提示*       # 34、关闭操作中心任务栏托盘        #
ECHO    # 10、锁定IE主页*                 # 35、关闭自动播放或自动打开U盘     #
ECHO    # 11、打开IE请勿追踪功能*         # 36、设置窗口超窄边框              #
ECHO    # 12、转移虚拟内存                # 37、删除回收站右键固定到开始屏幕  #
ECHO    # 13、关闭系统保护                # 38、直接删除文件不进入回收站      #
ECHO    # 14、关闭用户账户控制(UAC)       # 39、关闭Smartscreen应用筛选器     #
ECHO    # 15、WindowsToGo启用应用商店     # 40、关机时强制杀后台不等待        #
ECHO    # 16、关闭计划任务隐藏的自启      # 41、关闭不必要的视觉动画效果      #
ECHO    # 17、移除右键菜单SkyDrivePro     # 42、关闭程序跳转列表              #
ECHO    # 18、禁止运行计算机自动维护计划  # 43、关闭远程协助                  #
ECHO    # 19、启用.NET Framework 3.5.1    # 44、更改IE默认下载目录            #
ECHO    # 20、关闭程序兼容性助手          # 45、清理应用商店缓存              #
ECHO    # 21、禁止联网打开浏览器必应      # 46、任务栏显示“星期几”          #
ECHO    # 22、删除“这台电脑”6个文件夹   # 47、设置系统自带截屏保存到桌面    #
ECHO    # 23、显示受保护的系统文件        # 48、关闭磁盘碎片整理计划          #
ECHO    # 24、桌面显示“这台电脑”        # 49、禁用系统日志和内存转储        #
ECHO    # 25、启动IE增强保护模式          # 50、禁用疑难解答和系统诊断服务    #
ECHO    #+++++++++++++++++++++++++++++++++#+++++++++++++++++++++++++++++++++++#
ECHO =============================================================================

set /p a2=.                  请输入操作序号并回车（例如07）：
if %a2%==01 goto lnk
if %a2%==02 goto uacico
if %a2%==03 goto IEENT
if %a2%==04 goto administrator
if %a2%==05 goto HnetworkHG
if %a2%==06 goto charm
if %a2%==07 goto allapp
if %a2%==08 goto logonD
if %a2%==09 goto actioncenter
if %a2%==10 goto StartPage
if %a2%==11 goto DoNotTrack
if %a2%==12 goto pagefile
if %a2%==13 goto restore
if %a2%==14 goto UAC
if %a2%==15 goto store
if %a2%==16 goto plan
if %a2%==17 goto SkyDrive
if %a2%==18 goto SD
if %a2%==19 goto NetFX3
if %a2%==20 goto PCA
if %a2%==21 goto AP
if %a2%==22 goto 6FD
if %a2%==23 goto SHOWALL
if %a2%==24 goto TC
if %a2%==25 goto IE
if %a2%==26 goto temp
if %a2%==27 goto HG
if %a2%==28 goto Superfetch
if %a2%==29 goto netplwiz
if %a2%==30 goto GUI
if %a2%==31 goto IPV6
if %a2%==32 goto VE
if %a2%==33 goto CEIP
if %a2%==34 goto wsc
if %a2%==35 goto autoUSB
if %a2%==36 goto PB
if %a2%==37 goto RBM
if %a2%==38 goto DFD
if %a2%==39 goto SC
if %a2%==40 goto TO
if %a2%==41 goto DWM
if %a2%==42 goto history
if %a2%==43 goto SPR
if %a2%==44 goto IED
if %a2%==45 goto wsreset
if %a2%==46 goto week
if %a2%==47 goto screenshot
if %a2%==48 goto dfrgui
if %a2%==49 goto log
if %a2%==50 goto DPS
if %a2%==exit exit
goto cho2


:lnk
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        去除快捷方式小箭头和后缀
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto lnk1
If ErrorLevel 2 If Not ErrorLevel 3 Goto lnk2

:lnk1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:lnk2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:uacico
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             去除UAC小盾牌
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto uacico1
If ErrorLevel 2 If Not ErrorLevel 3 Goto uacico2

:uacico1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:uacico2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:IEENT
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            IE11开启企业模式
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto IEENT1
If ErrorLevel 2 If Not ErrorLevel 3 Goto IEENT2

:IEENT1
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /v SiteList /d "HKCU\Software\policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /v Enable /d "" /t reg_sz /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu2

:IEENT2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 重启电脑生效，按任意键返回主菜单
pause>nul
GOTO menu2

:administrator
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           启用Administrator账户
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto admin1
If ErrorLevel 2 If Not ErrorLevel 3 Goto admin2

:admin1
CLS
set /p adminusr1=请输入密码：
set /p adminusr2=请再次输入密码确认：
if %adminusr1%==%adminusr2% goto confirm2
echo 两次输入的密码不一致
echo 按任意键返回重新输入
pause>nul
goto admin1

:confirm2
net user administrator /active:yes
net user Administrator %adminusr1%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v FilterAdministratorToken /d 1 /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:admin2
net user administrator /active:no
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v FilterAdministratorToken /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:HnetworkHG
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO    隐藏资源管理器导航窗格家庭组和网络
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto HnetworkHG1
If ErrorLevel 2 If Not ErrorLevel 3 Goto HnetworkHG2

:HnetworkHG1
CLS
ECHO 需要TrustInstaller权限
ECHO 请确保已获取该权限
ECHO 按任意键继续操作
pause>nul
reg add "HKEY_CLASSES_ROOT\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v Attributes /d 2962489612 /t REG_DWORD /f
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v Attributes /d 2962489444 /t REG_DWORD /f
ECHO 请打开任务管理器重启资源管理器
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:HnetworkHG2
ECHO 需要TrustInstaller权限
ECHO 请确保已获取该权限
ECHO 按任意键继续操作
pause>nul
reg add "HKEY_CLASSES_ROOT\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v Attributes /d 2961441036 /t REG_DWORD /f
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v Attributes /d 2953052260 /t REG_DWORD /f
ECHO 请打开任务管理器重启资源管理器
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:charm
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO       鼠标指向右上角不显示超级按钮
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto charm1
If ErrorLevel 2 If Not ErrorLevel 3 Goto charm2

:charm1
CLS
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableCharms /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:charm2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableCharms /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:allapp
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        开始屏幕自动显示"应用"视图
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto allapp1
If ErrorLevel 2 If Not ErrorLevel 3 Goto allapp2

:allapp1
CLS
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:allapp2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:logonD
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        登录显示桌面而非开始屏幕
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto logonD1
If ErrorLevel 2 If Not ErrorLevel 3 Goto logonD2

:logonD1
CLS
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v GoToDesktopOnSignIn /d 1 /t REG_DWORD /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2

:logonD2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v GoToDesktopOnSignIn /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO menu2


:actioncenter
CLS
MODE con: COLS=60 LINES=25
ECHO.
ECHO.
ECHO    **************************************************
ECHO.
ECHO               关闭操作中心安全维护消息提示
ECHO.
ECHO       1.Windows 更新            9、Windows 疑难解答
ECHO.
ECHO       2.间谍软件和垃圾软件防护  10、自动维护
ECHO.
ECHO       3、Internet 安全设置      11、家庭组
ECHO.
ECHO       4、用户账户控制(UAC)      12、驱动器状态
ECHO.
ECHO       5、网络防火墙             13、文件历史记录
ECHO.
ECHO       6、病毒防护               14、设备软件
ECHO.
ECHO       7、存储空间               15、工作文件夹
ECHO.
ECHO       8、SmartScreen            16、返回主菜单
ECHO.
ECHO    **************************************************
ECHO.
ECHO.
set /p ac=.            请输入操作序号并回车（例如3）：
if %ac%==1 goto actioncenter1
if %ac%==2 goto actioncenter2
if %ac%==3 goto actioncenter3
if %ac%==4 goto actioncenter4
if %ac%==5 goto actioncenter5
if %ac%==6 goto actioncenter6
if %ac%==7 goto actioncenter7
if %ac%==8 goto actioncenter8
if %ac%==9 goto actioncenter9
if %ac%==10 goto actioncenter10
if %ac%==11 goto actioncenter11
if %ac%==12 goto actioncenter12
if %ac%==13 goto actioncenter13
if %ac%==14 goto actioncenter14
if %ac%==15 goto actioncenter15
if %ac%==16 goto menu2
goto accho2

:actioncenter1
set acguid={E8433B72-5842-4d43-8645-BC2C35960837}.check.103
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             Windows 更新
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c00000000020000000000106600000001000020000000a7ae8c9aa7ebe4742746b947752993893f926c5854829125b440977d5ee42ce5000000000e800000000200002000000019f8de4a9ee294910a8eb38395fd9a6bb95c9b9539f442f35a849b34959437f5d0000000816e8363d0d3a4ee18b296952d9a75e594bd8b0b70f7958b7ed114e2fc3a5e371cadb4a5a0d5d20a32f73106aa932dee2c77ad82b28e3a62034385ab0b282f60961ee50ac870ca46981ee4a5a57d0040bd3a3f940852f82951d4e08cb8eb0f61be0cc6b28efd6278ab5ad483d19ad2d65cd9fcdc8cdbadf618d2203a45575e407e961158a33f37ec30e504314a9526013c7690a204e8d77c17d6c9fccae82c308dd0070f0c9b237c1a849e8042632cd33f5f5b955c4c6fb5308cae6f76834f26c1a7ab2095037324618aabf8bbe5ffc440000000fce98e4305f7e85d4105e078edd7ca2ff76be6da04a03e476f8af4ca06354805e2bd69c105b43b19732253779f7d92616e5255f86cfc4833f4232770c74cfc10" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000001000000a000000000000000a39f57e10778cf01010000007b00450038003400330033004200370032002d0035003800340032002d0034006400340033002d0038003600340035002d004200430032004300330035003900360030003800330037007d002e006e006f00740069006600690063006100740069006f006e002e003100300033002e0035002d003400340038003800320036003800370000000000000000000000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter2
set acguid={E8433B72-5842-4d43-8645-BC2C35960837}.check.102
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO         间谍软件和垃圾软件防护
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000001e9257367aee8da07d46c24072e826aa1c15f8803c5caca94939cfe119824f02000000000e800000000200002000000035f6e4f999b399b08d58ba843e45dbdff3b2442e92961fb86f8f7c8b16d5b8a4300000002456b2243feec6e4f1cfa2c744ed5cbfc0dd806986c4657031eaf479fbd32aca00f23a1a978df2e3c422adbf2d00b0e3400000008bb2c177465efd545edf842c16b8668f496fe449ab9a640deca042e87175f99fef354a54c6dc4fcb470241f973203775917e4831c22bcfee232673cd29d72736" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter3
set acguid={E8433B72-5842-4d43-8645-BC2C35960837}.check.104
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           Internet 安全设置
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000095e01fab8e686e7732e278bd314cfaaf77fa829dc38c2bdd5d76e98563f5a538000000000e8000000002000020000000fb710f194ef621cfbe95be0d154325dac3ae84ec1c8cabb656e236800d3510af300000000b2c9c9e08bd50d6e15da1e85199ac3b8d6cb6ea024aa429b113982e135116eac3c282c812fd87e4b9edfa7fa22da4a04000000069d82238674bf2ac2089145733156252a4f62629ccfdb1e016b222b40ec6a517940208a9942f37d2a2288f87b8cab3fd47f2a8892ca2113a6eb5dec574fd3cb7" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter4
set acguid={C8E6F269-B90A-4053-A3BE-499AFCEC98C4}.check.0
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO            用户账户控制(UAC)
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000085b19b580389f6fe3b433fa4a0dca27cfba7ebe10c75063b0151d03f316fd6d8000000000e80000000020000200000003b1268f462df692609d30181fc1b1bf301feaea81062b2b8d85d0453da9e8b8e30000000cd0a948cf29ecdf35d317d26f81ecb379d987adb1ed174e2f75f70c689f815ea00fe3cf5fcfec9a14b6c32a6a9fb12b2400000003d8c500984a8fd0aea4ed4651d109c55120e89260b8c02f117ee5b2c5255395b10cbb139c40d09f728394f254297a3ce2f73cfe515a405e4afd22264d16df833" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000006900200055004900" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter5
set acguid={E8433B72-5842-4d43-8645-BC2C35960837}.check.101
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO              网络防火墙
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000008ed73cb7d5922e58de1a7c681e336c27cb43f8b42b60a3148dd37289855494e0000000000e8000000002000020000000690226f5db59f646af3b56ec513ed574f28f7b10d6e1e393e6154351faea91a93000000086b9f35c5099fc9e68510b27bfe7e893999e84b16de9b79b04468708aa23e65ee61b7a4179455f426a0c446d5e5388344000000065e349a51dcd1290427e45e141f652c08c6230c574eea0e688231cd1ea6a1adb1858d21613c5266b0b547fc5b75bb310bba9a72893484d95ee8115f516993fc5" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter6
set acguid={E8433B72-5842-4d43-8645-BC2C35960837}.check.100
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               病毒防护
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000031843580b428b9af9595e96916cbd0f19ea89fde15f69a411682020989314a96000000000e80000000020000200000003de0e0d59079c8bfbf9b5166e4a049d90909799c2f1f163f3cbb6c86d6c3320730000000a9e333647b93b8be971c064c8acbf513de72634e77e134f5c45d46b07899dd8dd8f59245fe0d46f10e05b5af70cc98bc40000000cd231d8f5af986e73f5ba3faab6cd22d3f9d8f329590a9d00cb4d07d31b9309ee838bd6d1a5a11b763ff87c6be3323deb8704b3d22d1a9555857f690d3b3bd67" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter7
set acguid={AA4C798D-D91B-4B07-A013-787F5803D6FC}.check.100
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               存储空间
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000009fcc53bf42d26d1382ba21052cc6e95f72b4cabbd760958d16ae3ce1ae31b88b000000000e8000000002000020000000bf0937ab1a2925a3c24de07a57af2304b64510b250b9becb7224081e70259147300000002be056aa8b4885c1caf38512603a8737bdfc2ed8c02e558f92f60575322505cb96e4aa0339c9b498fe559847a30b2033400000009ce01ff385c1683e410a9037e790d4ab387a155f1765af79295cbe7a6505917589852416e58f203bb98704e9eedf4b287cb3c709719db1988b3a4369f16e7fdc" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter8
set acguid={088E8DFB-2464-4C21-BAD2-F0AA6DB5D4BC}.check.0
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO              SmartScreen
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000028cd1e206f2cf507fcbc92e969a0d295fbfa3da5396168e5782b226a030bd355000000000e800000000200002000000046f960055533314629032033a5245ccb8396371e44b7ac1276851bef82b73c3cb000000095becf78ec7b3ee0bde645e90e012895b612050d7baedda7c559b313f1b63977c525bdace6328d30368ade6b45e2590faa8e431b8c9a850d5a39b4efc14a6d7d87e4eaac594ef84823cbde505ed26069b5381052f7906675095d77486849436811d857efee028fc15bd27629bcbbb0d8f5309f599c21d161aabf12d5f46d5489233ab45970978f0dad41555b70b24b1cc41c6361dd628c53c8965555ff68abedf23bb77663b459df2690f8bf57724ab94000000075f55efd57f1474a35cd3dcae355d2818d68c1077e14033f003a45269c38b181236bee8da2cb0be46b9b2895031fe7205322cce56e99f6a3e356c35af486c99a" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000001000000800000000000000026b7d6380778cf01010000007b00300038003800450038004400460042002d0032003400360034002d0034004300320031002d0042004100440032002d004600300041004100360044004200350044003400420043007d002e006e006f00740069006600690063006100740069006f006e002e003100000050f8d41200000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter9
set acguid={A5268B8E-7DB5-465b-BAB7-BDCDA39A394A}.check.100
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO           Windows 疑难解答
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c00000000020000000000106600000001000020000000e695e8667c04dd0f4d08d923501f85fe8563b3827a4ba592c61939475fec2b91000000000e80000000020000200000006949e315402843c96ee8fda5544a1ac42f6a9bd6eb4cca4ef0e5012dc004004a300000003931c03b0fb4074feda7e861127b621a7d8567e74694b1fc31e414c0a64e43b94ca03c662ef5dd4f02b538fd45dff2fa400000008d4db41e4620392cf7547242b390e93f6cdb0c262e753e95907bfc0d6f5231c51e3cf90d0414eac90c266c48348d6ead8a5d58429a3d26c3c4cee1b456ad4d1d" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter10
set acguid={DE7B24EA-73C8-4A09-985D-5BDADCFA9017}.check.800
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               自动维护
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c00000000020000000000106600000001000020000000423224b166383a4d4e44448ba3acf9e8d76f48fb6bd75e7c231b26f60bef45a1000000000e8000000002000020000000e5519266fa33c0f487c7d6a941eba4567135aa00021ab0bd11f47747dadca4ec30000000f1fb6d84e093d6b301753ac41d267b1d7358cdf60cddfd503c474baff922763c82b469ac20e35e3e235bb2a27851ac8f4000000054f9af44b6227ea3d532441f6016cae024dc3d30ed3cbf5fe907b0251d66c01bc934d59b555eab44d3e74e9e19203fe8f542f9f4179d12244f8017f2381b8521" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000006900200055004900" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter11
set acguid={134EA407-755D-4A93-B8A6-F290CD155023}.check.8001
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO                家庭组
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000099cdf3e35d5aa882686ec6f1ba04bc0caa08909ee0eb5d08c7e3c1d83f4433cb000000000e80000000020000200000002443ee5a1aa568ef9e81864f5a36b8bdd07d7f6527cf1efabbf4a12da9c29eab300000000c84bdba546d23384c2cd0d41b4497c4c497e7d224fe64c22e732d7cd213fabd5106a12869c0a4ea3117101c6cb1b926400000006515acca5e4fb32322986c5712acca13b2d09a9128cf96e6c28abb387211f02364e7380eecdd540576551e467a3594807f1b05862be34655f5ca5eaf2f61463a" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter12
set acguid={3FF37A1C-A68D-4D6E-8C9B-F79E8B16C482}.check.100
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO              驱动器状态
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000006e652b9b5ec7b232b39b290ab11f455271fc65328547ed66c234afd43b7d94c4000000000e8000000002000020000000868691bf70dd349be3d3013fd10739b9abf7dc4ce1e660adff0a6303f003230f300000007fd6a05c4d3f4cd311f0f1278ba8f8ee0d7c1f40d3ac92b60292f73fe05a2ce9d3cdd7c4a2704d247f5236ac775527ed400000008b6fa60beed92722cc51f85b215d35f27b8d727be389e9536be3af372d28166c8688e42116d5de5b5b0b1c0fd7bc17c5d6e775f27c894b535886172eb36d2c97" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter13
set acguid={B447B4DB-7780-11E0-ADA3-18A90531A85A}.check.100
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             文件历史记录
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c0000000002000000000010660000000100002000000025562ebd3620e15eaa8d457a1b50728391c026a3827cc98c5419d54b66f88a62000000000e8000000002000020000000431cb93d711ce24c4030972f3ebf4ed20f4bb491514349647768cf491557799b30000000531d8d6644f48d3bed8e9f259fe21f2143de08c9177c87f162171f8cb55007e1020011c183501bb78851de4462ff7b44400000006f8228ca663f124cd6e066c96d287188982829b53f046f2b7ce5d39d2092a6b7f341546f2022158453d02730a03f6a19e25520884893451b7d52460f04974370" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000006900200055004900" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter14
set acguid={96F4A050-7E31-453C-88BE-9634F4E02139}.check.8010
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               设备软件
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000005deacb32849d483088eeddb48bb3f83ef11e8790bd2f58155745ce7c633c84df000000000e8000000002000020000000288aad23ccf0b6078c8e4048b2f95952df4e93f8b10326f8653b2df2df8493463000000048ae2fc754b39bb862c55a1f866dc36e9a26fb30a37f89f7c5fdc370ddc3688d99e5d652367e6c26df3b6e74ae930a75400000000cbaf6edc265ed46816083afc7c7420d5a5348f74d0677fd329ec0691533bdcfe182960beb2f60f286a145888552cbae7ed2b9483994c42e057463d884e0351d" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:actioncenter15
set acguid={34A3697E-0F10-4E48-AF3C-F869B5BABEBB}.check.9001
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               工作文件夹
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "01000000d08c9ddf0115d1118c7a00c04fc297eb010000006049bbbf6216294aa2953641ffc9152c000000000200000000001066000000010000200000001573ab5723ff839facc6ee929c9336c9ab236cf4ad09dc07678eeac8505be012000000000e80000000020000200000008b2ae9609c87ac04361a911adb451101d23de4cbd2614c78cf8714d7dda546cb3000000053c36193ede228b4775ceba48be0d2b2da6bd258d3d0652de6613d9877bb47a74d981a0412a7815a300db6409e0cd2b640000000548d75a77900aead0943e8f1742fe0f273c51a677269e66df1439e880cedbd6e7ee8a310dafd23729c9d20b71feed70968101c37aa421f8f4d073dc03bf0b565" /t REG_BINARY /f
If ErrorLevel 2 If Not ErrorLevel 3 reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Action Center\Checks\%acguid%" /v CheckSetting /d "23004100430042006c006f00620000000000000000000000010000000000000000000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回
pause>nul
GOTO actioncenter

:accho2
CLS
COLOR 0a
MODE con: COLS=30 LINES=5
echo.
echo 输入有误，按任意键返回
pause>nul
GOTO actioncenter

:StartPage
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               锁定IE主页
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto StartPage1
If ErrorLevel 2 If Not ErrorLevel 3 Goto StartPage2

:StartPage1
set /p StartPage=请输入要绑定的IE主页网址：
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v "HomePage" /d "1" /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main" /v "Start Page" /d "%StartPage%" /t REG_SZ /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 操作完成，按任意键返回主菜单
pause>nul
GOTO menu2

:StartPage2
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v "HomePage" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main" /v "Start Page" /f
gpupdate /force
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 操作完成，按任意键返回主菜单
pause>nul
GOTO menu2

:DoNotTrack
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO     打开IE请勿追踪功能(Do Not Track)
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto DoNotTrack1
If ErrorLevel 2 If Not ErrorLevel 3 Goto DoNotTrack2

:DoNotTrack1
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /d "1" /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
taskkill /f /im iexplore.exe
ECHO 操作完成，按任意键返回主菜单
pause>nul
GOTO menu2

:DoNotTrack2
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /d "0" /t REG_DWORD /f
taskkill /f /im explorer.exe
start %systemroot%\explorer
taskkill /f /im iexplore.exe
ECHO 操作完成，按任意键返回主菜单
pause>nul
GOTO menu2


:admin
CLS
COLOR 0a
MODE con: COLS=30 LINES=8
ECHO 操作失败。
echo 请右键“以管理员身份运行”
ECHO 按任意键退出...
PAUSE >nul
exit

:cho
CLS
COLOR 0a
MODE con: COLS=30 LINES=5
echo.
echo 输入有误，按任意键返回主菜单
pause>nul
GOTO menu

:cho2
CLS
COLOR 0a
MODE con: COLS=30 LINES=5
echo.
echo 输入有误，按任意键返回主菜单
pause>nul
GOTO menu2

:error
CLS
COLOR 0a
MODE con: COLS=30 LINES=5
echo.
echo 操作失败，按任意键返回主菜单
pause>nul
GOTO menu