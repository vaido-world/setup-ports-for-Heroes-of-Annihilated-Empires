@echo off
setlocal enabledelayedexpansion
IF NOT EXIST upnpc-static.exe (
	for /f delims^=^"^ tokens^=4 %%i in ('curl -s https://api.github.com/repos/miniupnp/miniupnp/releases/latest ^| findstr ^"browser_download_url.*zip^""
	') do (
	curl --location "%%i" > "%%~nxi"
	set "miniupnp_filename=%%~nxi"
	)
		echo !miniupnp_filename! sdc
	tar --extract --file=!miniupnp_filename! upnpc-static.exe
	del "!miniupnp_filename!"

)

set ip_address_string="IPv4 Address"
rem Uncomment the following line when using older versions of Windows without IPv6 support (by removing "rem")
rem set ip_address_string="IP Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Your IP Address is: %%f
    set "ip_address=%%f"

)


upnpc-static -a %ip_address% 34000 34000 tcp
upnpc-static -a %ip_address% 34001 34001 tcp
upnpc-static -a %ip_address% 34002 34002 tcp
upnpc-static -a %ip_address% 34003 34003 tcp
upnpc-static -a %ip_address% 34004 34004 tcp
upnpc-static -a %ip_address% 34005 34005 tcp

upnpc-static -a %ip_address% 34000 34000 udp
upnpc-static -a %ip_address% 34001 34001 udp
upnpc-static -a %ip_address% 34002 34002 udp
upnpc-static -a %ip_address% 34003 34003 udp
upnpc-static -a %ip_address% 34004 34004 udp
upnpc-static -a %ip_address% 34005 34005 udp

upnpc-static -a %ip_address% 6667 6667 tcp
upnpc-static -a %ip_address% 6667 6667 udp

upnpc-static -a %ip_address% 27900 27900 udp 

pause


upnpc-static.exe -d 34000 tcp
upnpc-static.exe -d 34001 tcp
upnpc-static.exe -d 34002 tcp
upnpc-static.exe -d 34003 tcp
upnpc-static.exe -d 34004 tcp
upnpc-static.exe -d 34005 tcp

upnpc-static.exe -d 34000 udp
upnpc-static.exe -d 34001 udp
upnpc-static.exe -d 34002 udp
upnpc-static.exe -d 34003 udp
upnpc-static.exe -d 34004 udp
upnpc-static.exe -d 34005 udp

upnpc-static.exe -d 6667 tcp
upnpc-static.exe -d 6667 udp

upnpc-static.exe -d 27900 udp 
