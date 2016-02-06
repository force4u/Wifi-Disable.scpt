(*
WifiをオフにするAppleScript
パワーを切ってから
ネットワーク・サービスを無効にする
Wifi-Disable.scpt
20151212　初回作成
*)
---ネットワーク・サービスの一覧を取得してテキストで格納
set theNetWorkServices to (do shell script "networksetup -listallnetworkservices") as text
---※印を取る
set theNetWorkServices to my doReplace(theNetWorkServices, "*", "")
---リストの区切り文字をリターンに
set AppleScript's text item delimiters to {"\r"}
---取得したテキストをリスト形式に変換
set listNetWorkServices to (every text item of theNetWorkServices) as list
---ログ
log listNetWorkServices
---ネットワークサービス名Wi-Fiの場合
set theWifiName to listNetWorkServices contains "Wi-Fi"
if theWifiName is true then
	try
		do shell script "sudo /usr/sbin/networksetup -setairportpower 'Wi-Fi' off" with administrator privileges
	end try
	try
		do shell script "sudo /usr/sbin/networksetup -setnetworkserviceenabled 'Wi-Fi' off" with administrator privileges
	end try
end if
---ネットワークサービス名AirMacの場合
set theWifiName to listNetWorkServices contains "AirMac"
if theWifiName is true then
	try
		do shell script "sudo /usr/sbin/networksetup -setairportpower 'AirMac' off" with administrator privileges
	end try
	try
		do shell script "sudo /usr/sbin/networksetup -setnetworkserviceenabled 'AirMac' off" with administrator privileges
	end try
end if
---ネットワークサービス名AirPortの場合
set theWifiName to listNetWorkServices contains "AirPort"
if theWifiName is true then
	try
		do shell script "sudo /usr/sbin/networksetup -setairportpower 'AirPort' off" with administrator privileges
	end try
	try
		do shell script "sudo /usr/sbin/networksetup -setnetworkserviceenabled 'AirPort' off" with administrator privileges
	end try
end if
---ネットワークサービス名WiFiの場合
set theWifiName to listNetWorkServices contains "WiFi"
if theWifiName is true then
	try
		do shell script "sudo /usr/sbin/networksetup -setairportpower 'WiFi' off" with administrator privileges
	end try
	try
		do shell script "sudo /usr/sbin/networksetup -setnetworkserviceenabled 'WiFi' off" with administrator privileges
	end try
end if

---文字の置き換えサブルーチン

to doReplace(theText, orgStr, newStr)
	set oldDelim to AppleScript's text item delimiters
	set AppleScript's text item delimiters to orgStr
	set tmpList to every text item of theText
	set AppleScript's text item delimiters to newStr
	set tmpStr to tmpList as text
	set AppleScript's text item delimiters to oldDelim
	return tmpStr
end doReplace
