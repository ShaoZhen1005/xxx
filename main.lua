
local ts = require("ts")
local table = {}
local download_info = ""
local vpn_time = 0
local 下载客户端总耗时 = 0 
local local_file = userPath().."/res/"..getDeviceName()..".apk"        --本地文件名
local num = 0
function MyGetIPInfo(...)
	header_send = {typeget = "ios"}
	status_resp, header_resp,body_resp = ts.httpGet("http://ipip.net", header_send, body_send)
	nLog(body_resp)
	local ip = string.sub(body_resp, string.find(body_resp, "IP地址</span>%d-.%d-.%d-.%d-<"))
	local city = string.sub(body_resp, string.find(body_resp, "位置信息</span>.-</li"))
	i,j = string.find(city, ">.-<")
	return "ip : "..string.sub(ip, string.find(ip, "%d+.%d+.%d+.%d+")) .. "  城市 : " .. string.sub(city, i+1,j-1)
end

function MyDownload()
	delFile(userPath().."/res/mac-1.2.7-1300.dmg")
	mSleep(500)
	local time = os.time()
	local code,msg = ts.tsDownload(userPath().."/res/mac-1.2.7-1300.dmg","http://cdn-oss.touchsprite.net/tsp_store%2F2018%2F04%2F12%2FVZ9ZhUhjgbaAa0gU?response-content-disposition=attachment%3B%20filename%3D%22%E8%A7%A6%E5%8A%A8%E7%B2%BE%E7%81%B5%E5%AE%89%E8%A3%85%E5%99%A8-v2.4.2.ipa%22&OSSAccessKeyId=XPV2tk7a1zgPhJWg&Signature=w9MX89v1knLa3R0TEPa1UoyqJFs%3D&Expires=1557199554")
	local time_num = os.time()-time
	table[#table+1] = time_num
	return code,msg,time_num
end

function My平均数(t)
	for var= 1, #t do
		num = num + tonumber(t[var])
	end
	return num/#t
end

function file_exists(file_name) --检测指定文件是否存在
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end
local path = "/plugin/tsvpn.tsl"
if string.sub(string.match(getOSVer(),"%d+."),1,-2) == "11" then path = "/plugin_ios11/tsvpn.tsl" end
if file_exists(userPath()..path) == false then
	if not file_exists(userPath().."/res/tsvpn.tsl") then dialog("未找到 tsvpn.tsl 文件") lua_exit() dialog("") end
	os.execute("cp -rf " .. userPath().."/res/tsvpn.tsl " .. userPath()..path)
	if file_exists(userPath()..path) then
		dialog("复制成功")
	else
		dialog("复制失败")
	end
end
local tsld = loadTSLibrary("tsvpn.tsl") --库加载，返回一个table
require("tsvpn") --需要加载
require("TSLib")
--引入中控库
local ts_enterprise_lib = require("ts_enterprise_lib")
assert(ts_enterprise_lib,"无法引入企业专用库")

local w,h = getScreenSize()
UINew("企业版云代理测试","开始","取消","ts_ent_tsvpn_test.dat",0,0,w,h)
UILabel("触动版本 : " .. getTSVer(),20,"center","17,170,17")
UILabel("tsvpn 版本 : " ..  TSVPNVersions(),20,"center","17,170,17")
UILabel("选择",20,"center","17,170,17")
UIRadio("rdo1","动态IP,静态IP,不登录","0",-1,0)
UIShow()

if rdo1 == "动态IP" then
	key,psw = "07096ed54238c85f4f78f8f4410e87d2","f9791f47d8bab74157ace94dc072d373"
elseif rdo1 == "静态IP" then
	key,psw = "c0acdd6c8a52cfad9d373d717c0ed8b0","c535edb3ee2a284e18450776fd7acc0f"
end

local w,h = getScreenSize()
fwShowWnd("wid",0,0,w-1,h-1,1) --创建一个可移动的窗口
fwShowTextView("wid","textid","","","FF0000","FFDAB9",10,0,0,0,w-1,h-1,0.8)
fwShowTextView("wid","textid1","初始信息 : " .. MyGetIPInfo(),"","FF0000","FFDAB9",10,0,0,0,w-1,20,0.8)

if rdo1 ~= "不登录" then
	local status,msg = getVPN(key,psw) -- 动态
	if status == false then
		dialog(msg)
	else
		toast("操作完成")
	end
	local b,e = openVPN(key,psw)
	if b then
		toast("启动成功")
	else
		dialog(e)
	end
end
fwShowTextView("wid","textid2","当前信息 : "..MyGetIPInfo(),"","FF0000","FFDAB9",10,0,0,20,w-1,40,0.8)

function MyTSPing(...)
	local ts = require("ts")
	status = ts.ping("www.baidu.com",10)  --也可以是 ip 地址
	local num = 0
	for i,v in pairs(status) do
		num = num + tonumber(v)
	end
	return num/#t
end
--dialog(MyTSPing())

function My上传到云盘()
	local cloud_file_name = "/tsvpn/"..getDeviceName()..".apk"              --云文件名，包含目录的完整文件名
--	delFile(local_file)
	mSleep(500)
	local time = os.time()
	local timeout_seconds = 300;                      --超时秒数,数据较大时，适当延长
	local ok,err = ts_enterprise_lib:cloud_file_push(local_file,cloud_file_name,timeout_seconds)
	if ok then
		nLog("上传成功")
	else
		nLog("上传失败"..err)
	end
	local time_num = os.time()-time
	table[#table+1] = time_num
	return time_num
end

function My从云盘下载()
	local cloud_file_name = "/tsvpn/ROGPG102.apk"              --云文件名，包含目录的完整文件名
	delFile(local_file)
	mSleep(500)
	local time = os.time()
	local timeout_seconds = 300;                      --超时秒数,数据较大时，适当延长
	local ok,err = ts_enterprise_lib:cloud_file_pull(local_file,cloud_file_name,timeout_seconds)
	if ok then
		nLog("上传成功")
	else
		nLog("上传失败"..err)
	end
	local time_num = os.time()-time
	table[#table+1] = time_num
	return time_num
end


下载客户端总耗时 = os.time()
for var= 1, 20 do
	local code,msg,time =MyDownload()
	download_info = "code : " .. code .. " msg : " .. msg .. " 耗时 : " .. time .. "秒\n" .. download_info
	fwShowTextView("wid","textid3","请求 : " .. #table .. "次 平均速度 : " .. (os.time() - 下载客户端总耗时)/var .. "秒 总耗时 : " .. os.time() - 下载客户端总耗时,"","FF0000","FFDAB9",10,0,0,40,w-1,60,0.8)
	fwShowTextView("wid","textid4",download_info,"","FF0000","FFDAB9",10,0,0,60,w-1,h-1,0.8)
	toast("下载完成 耗时 : " .. time .. "秒")
end
--dialog("开始下载",3)
--table = {}
--下载客户端总耗时 = os.time()
--for var= 1, 10 do
--	local time = My从云盘下载()
--	download_info = "耗时 : " .. time .. "秒\n" .. download_info
--	fwShowTextView("wid","textid5","从云盘下载 请求 : " .. #table .. "次 平均速度 : " .. (os.time() - 下载客户端总耗时)/var .. "秒 总耗时 : " .. os.time() - 下载客户端总耗时,"","FF0000","FFDAB9",10,0,0,60,w-1,80,0.8)
--	fwShowTextView("wid","textid4",download_info,"","FF0000","FFDAB9",10,0,0,100,w-1,h-1,0.8)
--	toast("下载完成 耗时 : " .. time .. "秒")
--end

--dialog("开始上传",3)
--table = {}
--下载客户端总耗时 = os.time()
--for var= 1, 10 do
--	local time = My上传到云盘()
--	download_info = "耗时 : " .. time .. "秒\n" .. download_info
--	fwShowTextView("wid","textid6","上传到云盘 请求 : " .. #table .. "次 平均速度 : " .. (os.time() - 下载客户端总耗时)/var .. "秒 总耗时 : " .. os.time() - 下载客户端总耗时,"","FF0000","FFDAB9",10,0,0,80,w-1,100,0.8)
--	fwShowTextView("wid","textid4",download_info,"","FF0000","FFDAB9",10,0,0,80,w-1,h-1,0.8)
--	toast("下载完成 耗时 : " .. time .. "秒")
--end

mSleep(100000*1000)
