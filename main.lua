--	adb connect 10.0.0.40 
--	/data/touchSpriteCore &
--	/data/TSTransfer &
--	/data/data/com.touchspriteent.android/bin/run.sh
--	ps | grep touchSpriteCore
--	ps | grep TSTransfer

-- /Applications/TouchSpriteENT.app/TSTransfer &

-- adb kill-server
-- adb start-server
-- adb remount

--[[
	"L-L" //左
	"L-R" //右
	"L-U" //上
	"L-D" //下
	//右4个键
	"R-L"   //方块
	"R-R"   //圆
	"R-U"   //三角
	"R-D"   //叉

	"L1"
	"L2"
	"R1"
	"R2"

	"Share"
	"Options"
	"Board"
	"Home"
	"Reset"
--]]

--[[
	ST		中锋。
	CF		二前锋，又名影子前锋。
	LW/RW	边锋，左边锋，右边锋。
	ACM		前腰。
	CM		前卫。
	CDM		防守能力强的前卫叫后腰。
	LM/RM	左边前卫，右边前卫。
	LB/RB	左边后卫，右边后卫。
	CB		中卫。
	GK		门将，即守门员。
--]]

--[[
	冲刺速度	0
	加速度		100
	射门失误	100
	传球失误	100
	射门速度	0
	传球速度	0
	受伤频率	50
	受伤轻重	50
	守门员能力	100
	盯人防守	100
	跑动频率	100
	防守线位置	0
	防守线长度	0
	防守线宽度	0
	后卫走位	0
	控球失误	100
--]]

--[[ PS4 账号
	yuefulie491@163.com		sa99413  
	meitunhaofan892@163.com	he8082086 
	guaixiesong59@163.com	j790200  
	jiuhankeshi349@163.com	m8443932 
	hanzayouji86@163.com	bmf46942417 
	nazibo63@163.com		ll23959316 
	fangguazhun509@163.com	be105649 
	guciwen558@163.com	zpi75251  
	已用统一ps4密码：Q135792468
--]]

local 方向 = -50
-- 主场 左大右小禁区
local LR1 = {0, 0, 1, 1, 697, 615, 727, 643}
-- 客场 左小右大禁区
local LR2 = {554, 615, 583, 646, 0, 0, 1, 1}
local LR = (方向 > 0 ) and LR1 or LR2
local 左球门中心 = {563,  576}
local 右球门中心 = {716,  576}

local key_table = {
	["1"] = {x = 1, y = 1},	["2"] = {x = 2, y = 1},	["3"] = {x = 3, y = 1},	["4"] = {x = 4, y = 1},	["5"] = {x = 5, y = 1},
	["6"] = {x = 6, y = 1},	["7"] = {x = 7, y = 1},	["8"] = {x = 8, y = 1},	["9"] = {x = 9, y = 1},	["0"] = {x = 10, y = 1},
	["q"] = {x = 1, y = 2},	["w"] = {x = 2, y = 2},	["e"] = {x = 3, y = 2},	["r"] = {x = 4, y = 2},	["t"] = {x = 5, y = 2},
	["y"] = {x = 6, y = 2},	["u"] = {x = 7, y = 2},	["i"] = {x = 8, y = 2},	["o"] = {x = 9, y = 2},	["p"] = {x = 10, y = 2},
	["a"] = {x = 1, y = 3},	["s"] = {x = 2, y = 3},	["d"] = {x = 3, y = 3},	["f"] = {x = 4, y = 3},	["g"] = {x = 5, y = 3},
	["h"] = {x = 6, y = 3},	["j"] = {x = 7, y = 3},	["k"] = {x = 8, y = 3},	["l"] = {x = 9, y = 3},	["-"] = {x = 10, y = 3},
	["z"] = {x = 1, y = 4},	["x"] = {x = 2, y = 4},	["c"] = {x = 3, y = 4},	["v"] = {x = 4, y = 4},	["b"] = {x = 5, y = 4},
	["n"] = {x = 6, y = 4},	["m"] = {x = 7, y = 4},	["@"] = {x = 8, y = 4},	["."] = {x = 9, y = 4},	["_"] = {x = 10, y = 4},
	["L2"] = {x = 1, y = 5},	["L2U"] = {x = 2, y = 5},	["U"] = {x = 3, y = 5},	["RN"] = {x = 4, y = 5},	["R"] = {x = 5, y = 5},
	["下"] = {x = 1, y = 6},	["上"] = {x = 2, y = 6},	["L1"] = {x = 3, y = 6},	["R1"] = {x = 4, y = 6},	["键盘"] = {x = 5, y = 6},
	["指南"] = {x = 6, y = 6},	["R3"] = {x = 7, y = 6},	["R2"] = {x = 8, y = 6},
--	[""] = {x = , y = },
}

local m转会球员级别 = {
	{  616,  231, 0xe0d496},
	{  740,  247, 0x846d55},
	{  825,  250, 0x846d55},
	{  909,  246, 0xeadb9f},
	{  996,  252, 0x1c1e1f},
	{ 1083,  250, 0x866f57},
}

function MyDown(k,t,ms)
	if t == nil then t = 30 end
	if ms == nil then ms = 0 end
	ps4KeyDown(k)
	mSleep(t)
	ps4KeyUp(k)
	mSleep(ms)
end

-- Options
-- MyDown("Home")
function MyRocker(k,x,y,t)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if t == nil then t = 30 end
	if ms == nil then ms = 0 end
	ps4Rocker(k,x,y)
	mSleep(t)
	ps4Rocker(k,0,0)
	mSleep(ms)
end

function MyInput(text,boo)
	if boo == nil then boo = false end
	-- 初始坐标
	local fk_x,fk_y = 5,3
	
	function My移动光标(x,y)
		-- 向右移动
		for i = 1, x - fk_x do
			MyDown("L-R",30,500)
		end
		-- 向左移动
		for i = 1, fk_x - x do
			MyDown("L-L",30,500)
		end
		-- 向下移动
		for i = 1, y - fk_y do
			MyDown("L-D",30,500)
		end
		-- 向上移动
		for i = 1, fk_y - y do
			MyDown("L-U",30,500)
		end
		fk_x,fk_y = x,y
		MyDown("R-R",30,1000)
	end
	
	if boo then
		local info = key_table[text]
		if not info then return false end
		My移动光标(info.x,info.y)
	else
		local text_info = {}
		for i = 1, string.len(text) do
			local info = key_table[string.sub(text,i,i)]
			My移动光标(info.x,info.y)
		end
	end
	
end

--MyInput("6321375@qq.com")
local m全局判断 = {}
local m主页相关 = {}
local m踢球相关 = {}
local m换人相关 = {}
local mEA断开连接	 = {["log"] = "mEA断开连接",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a1b5, "0|-5|0x1f1f1f,-6|0|0x191c19,0|6|0x131111,5|0|0x1a1a18,95|-58|0xe3e1e2,122|-50|0xc1c0c7,178|-51|0xbbbac1,189|-79|0xced2e3", 90, 339, 301, 680, 416 }}
local mEA重连		 = {["log"] = "mEA重连",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe68a92, "6|-5|0xd5d3dd,11|-2|0x5f5c6f,54|-7|0x161616,54|-2|0xdedde4,60|-2|0x161714,67|-2|0xdedde4,66|-7|0x161616", 90, 807, 53, 897, 89 }}
local mEA已连		 = {["log"] = "mEA已连",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x5d5a6d, "0|12|0xd8d9e2,-9|5|0xd6d9e4,9|5|0xd6d9e4,31|3|0x161616,40|11|0x161616,49|4|0x161616,-98|5|0xb28c6e", 90, 1029, 53, 1201, 89 }}
local m比赛实况		 = {["log"] = "m比赛实况",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe2e0e1, "13|1|0xe2dfe3,5|4|0x3e465a,4|-4|0x3e465a,36|17|0xdcdadb,41|19|0x3e465a,30|10|0x3e465a,58|0|0x3e465a", 90, 436, 56, 523, 97 }}
local m继续比赛		 = {["log"] = "m继续比赛",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x33ffb8, "4|-6|0x2957cf,4|5|0x2957cf,115|51|0x2958cd,108|51|0xe3e1e2,131|42|0xe3e1e2,131|62|0xe3e1e0", 90, 717, 184, 906, 290 }}
local m点球			 = {["log"] = "m点球",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "-4|-4|0x3e465a,4|4|0x3e465a,53|-2|0xe1dee1,58|-6|0x3e465a,80|-3|0x3e465a", 90, 524, 48, 627, 93 }}
local m点球引导		 = {["log"] = "m点球引导",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xdddce3, "-2|-1|0x8c909e,2|2|0x6f717e,55|-1|0xe3e1e4,73|-1|0xe3e1e2,-26|296|0x33ffb8", 90, 560, 138, 713, 478 }}
local m我方点球		 = {["log"] = "m我方点球",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x5d5d5f, "1|38|0x79364b,-4|33|0x763146,7|33|0x783140,1|65|0x818286", 90, 1026, 41, 1058, 138 }}
local m首页进入游戏	 = {["log"] = "m首页进入游戏",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x9f072f, "-1|5|0xece9ea,-14|21|0x9d052d,-15|26|0xeae8e9,-15|41|0xa10931,7|26|0xece9ea,23|16|0x9d082d,31|16|0xece9ea", 90, 895, 102, 1024, 181 }}
local m使用者协议	 = {["log"] = "m使用者协议",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "3|8|0x3e465a,-4|8|0x3e465a,-1|11|0xe3e1e2,-4|14|0x3e465a,3|14|0x3e465a", 90, 563, 48, 607, 94 }}
local m初始默认选项	 = {["log"] = "m初始默认选项",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "-4|5|0x3e465a,4|4|0x3e465a,7|12|0x3e465a,-8|13|0x3e465a,-5|21|0x3e465a,5|21|0x3e465a,27|2|0x3e465a", 90, 548, 113, 616, 162 }}
local m收取电邮		 = {["log"] = "m收取电邮",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x3e465a, "4|-9|0xe0dede,5|6|0x3e465a,-1|11|0x3e465a,-12|-3|0xe1dfdf,8|-4|0xd3d2d5", 90, 712, 34, 778, 77 }}
local m欢迎回来		 = {["log"] = "m欢迎回来",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "-5|0|0x525c7f,-5|7|0x525c7f,6|9|0xe3e1e4,15|5|0x525c7f,20|12|0x525c7f,20|-14|0x525c7f", 90, 536, 110, 588, 156 }}
local m团队信息		 = {["log"] = "m团队信息",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe5e0e2, "3|-2|0x3e465a,-4|5|0x3e465a,0|14|0xe3e1e2,-9|14|0x3e465a,7|14|0x3e465a", 90, 259, 160, 298, 207 }}
local m首页			 = {["log"] = "m首页",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xd8e2fc, "1|-3|0x28448a,23|16|0x28448a,24|-2|0xe0e1e8,35|0|0x284488", 90, 295, 157, 357, 190 }}
local m开始游戏		 = {["log"] = "m开始游戏",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xc2cdeb, "11|-9|0x284488,5|3|0xb2b7cc,9|1|0x28448a,18|1|0x28448a,35|-3|0xe1dfdf", 90, 315, 154, 375, 193 }}
local m开始UT模式	 = {["log"] = "m开始UT模式",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x3dedc8, "5|0|0x265acb,9|0|0x39fbc0,4|16|0x1f61c0,5|19|0x39fac2,12|20|0x2957cf,17|19|0x33ffb8,57|11|0x33ffb8,57|0|0x2957cf", 90, 157, 203, 1117, 246 }}
local mUT模式		 = {["log"] = "mUT模式",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x304886, "29|0|0x28448a,15|20|0x2a4486,11|20|0xe3e1e2,4|17|0xe3e1e2,51|12|0x284488,51|4|0xe3e1e2,51|18|0xe3e1e2", 90, 161, 206, 1095, 250 }}
local m切换设定档	 = {["log"] = "m切换设定档",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x212121, "0|13|0x131111,0|6|0x85a1b5,260|-74|0x9096aa,262|-64|0x424c6d,284|-74|0xd2d1d6,282|-64|0xd4d3d8", 90, 334, 301, 675, 421 }}
local m选择语言		 = {["log"] = "m选择语言",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x32ffb7, "298|0|0x33ffb8,164|93|0x33ffba,159|100|0x2957cf,168|100|0x2957cf,122|94|0x2856ce", 90, 472, 321, 820, 476 }}
local m接受			 = {["log"] = "m接受",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a4b9, "0|-7|0x222222,0|4|0x151714,28|-10|0xe3e1e2,45|3|0xe3e1e2,113|-465|0xe3e1e2,1004|-29|0xe3e1e2", 90, 61, 152, 1102, 645 }}
local mFUT中心		 = {["log"] = "mFUT中心",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xd9dce6, "4|3|0x28448a,0|6|0xdcdce7,41|-1|0xdfe1f0,37|3|0x28448a,44|3|0x28448a,40|10|0xd2d3dc", 90, 157, 150, 247, 185 }}
local m单人模式		 = {["log"] = "m单人模式",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xd2d3dc, "23|-2|0xc0c4d3,23|3|0x2a4484,48|5|0xe2e1e6,68|2|0x27448a,71|-7|0xd6dcee", 90, 300, 152, 408, 188 }}
local m可以比赛		 = {["log"] = "m可以比赛",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a3bb, "-4|-3|0x7e9ab0,3|4|0x7e9ab0,0|-5|0x1e1e1e,0|5|0x151714,81|-3|0x23d3b1,81|4|0x37d2b5", 90, 70, 620, 177, 646 }}
local m有对手更新	 = {["log"] = "m有对手更新",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x2c58c5, "6|-2|0x6f8ad5,30|2|0xb2c7ff,48|0|0xa5bfff,45|11|0xd6d9e8,1|10|0x2958cb,12|10|0x2957cf", 90, 1096, 148, 1208, 193 }}
local m选择对手		 = {["log"] = "m选择对手",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xa8b0c6, "10|13|0x28448a,3|11|0xd0cfd6,28|12|0x28448a,30|3|0xe3e1e2,35|1|0x28448a,42|5|0x28448a", 90, 88, 151, 367, 183 }}
local m选择难易度	 = {["log"] = "m选择难易度",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x9b9ea6, "24|14|0xd0d1da,32|3|0x3f4859,53|9|0x3e465a,50|6|0xc4c7d1,38|2|0xc3c0c1,1|14|0x3e465a", 90, 77, 191, 202, 228 }}
local m允许参赛		 = {["log"] = "m允许参赛",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x86a0b5, "126|-80|0xd4d7e3,142|-84|0x404d6d,165|-81|0xe1dee1,233|-86|0x888e9e,217|-73|0x404d6d", 90, 331, 284, 691, 397 }}
local m选择手柄		 = {["log"] = "m选择手柄",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x84a2ba, "81|0|0x1c1c1c,81|-5|0xcc4a66,232|-535|0x3e465a,548|-513|0x3e465a,548|-527|0x9899a2,559|-527|0x3e465a,559|-522|0x3e465a,574|-515|0xa0a1aa", 90, 66, 89, 681, 641 }}
local m确认对手		 = {["log"] = "m确认对手",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a4b9, "81|-5|0xd14f6b,81|-1|0x1c1c1c,541|-196|0x4a4d55,544|-191|0xd7d9dd,544|-186|0x4a4d55,549|-181|0xd8dadc,540|-182|0xd8dade", 90, 76, 412, 677, 645 }}
local m选择队服		 = {["log"] = "m选择队服",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a3bb, "81|-4|0xd14f6b,81|0|0x1c1c1c,293|-277|0x33ffba,506|-277|0x33ffba,507|-283|0x2957cf,507|-270|0x2957cf", 90, 66, 327, 602, 645 }}
local m进行比赛		 = {["log"] = "m进行比赛",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a3bb, "79|-4|0xc0536d,80|0|0x1c1c1c,103|-93|0x33f5ba,111|-92|0x2957cf,124|-92|0x19daa0,122|-90|0x2958cd,130|-55|0x33ffba", 90, 70, 527, 266, 645 }}
local m球员就位		 = {["log"] = "m球员就位",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xc20012, "3|0|0xd70010,1|3|0xcf0014,1|10|0x587d34,6|5|0x577c35,1|-2|0x1d310a,1|-5|0x587d34", 90, 630, 235, 666, 264 }}
local m足球			 = {["log"] = "m足球",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe4b318, "-1|0|0xe4b318,-1|1|0xd5a409,0|1|0xd8a60b", 90, 554, 580, 726, 681 }}
local m游戏首页		 = {["log"] = "m游戏首页",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x54e6e6, "2|-3|0x2958cd,13|2|0x245bc7,24|1|0x32feb9,29|13|0x31c3c3,24|16|0x2957cf,12|20|0x894cab", 90, 286, 151, 361, 194 }}
local m更新球队内容	 = {["log"] = "m更新球队内容",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xcdcccf, "3|4|0x414b6e,28|3|0x414b6c,27|-2|0xb6b7c2,35|4|0x414b6e,41|2|0x414b6c,55|-8|0xbcbdc6,63|-4|0x424c6d,70|-2|0x414b6c", 90, 358, 303, 471, 342 }}
local m更新球队完成	 = {["log"] = "m更新球队完成",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x485577, "6|0|0xe3e1e2,12|0|0x485479,18|-3|0xbabbc3,34|0|0x485479,-11|-71|0x41c839", 90, 584, 269, 755, 413 }}
local m按X略过		 = {["log"] = "m按X略过",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xdcdbe0, "22|0|0x82a3ba,22|-6|0x1f1f1f,22|5|0x151611,26|0|0x171a16,51|-5|0xdadbe4,68|5|0xc2d0f6,78|1|0xd1d8f1,86|-1|0xc8cde2", 90, 1074, 651, 1208, 685 }}
local m按X略过2		 = {["log"] = "m按X略过2",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x37fab6, "22|0|0x84a4bb,22|-5|0x1e1f1c,22|5|0x141510,51|-5|0x39f7b5,79|1|0x54e8b4", 90, 1076, 650, 1206, 685 }}
local m新手上路		 = {["log"] = "m新手上路",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x4e5261, "10|-8|0xacafd2,8|6|0xabadd5,26|-5|0x4a4d55,45|-5|0x696c81,47|2|0xa8acd6,72|-5|0x5a5e6e", 90, 74, 34, 167, 65 }}
local mOPTIONS继续	 = {["log"] = "mOPTIONS继续",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x161616, "7|0|0x7e7c7d,12|3|0x161616,21|1|0x817c80,30|1|0xc7c5c6,40|1|0x161616,64|-4|0xdedbdc,80|4|0xbec1c0", 90, 69, 614, 177, 645 }}
local m精选阵容		 = {["log"] = "m精选阵容",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "1|-4|0xa9b1c7,1|4|0xd0d0d4,10|12|0x284488,20|6|0x28448a,19|0|0x28448a,32|8|0x28448a,45|-2|0xb2b8ca", 90, 95, 148, 202, 186 }}
local m十二码点球	 = {["log"] = "m十二码点球",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "-4|-3|0x3e465a,4|5|0x3e465a,57|-6|0x3e465a,58|-4|0x3e465a,53|-1|0xe1dee1,69|0|0xe3e1e2,80|-2|0x3e465a", 90, 527, 54, 634, 92 }}
local m比赛奖金		 = {["log"] = "m比赛奖金",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x7b7c83, "14|-4|0xe3e1e2,29|1|0x4e5259,33|4|0xe3e1e2,43|2|0x56575d,43|-4|0x6f7177,56|-3|0xe3e1e2,64|-7|0xe3e1e2", 90, 591, 327, 685, 363 }}
local m需要联网		 = {["log"] = "m需要联网",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xb8b7be, "7|-2|0x3f4a6c,18|1|0x3f4c6e,29|2|0x3e4a6c,81|6|0xceced7,128|3|0xcfd0d8,131|5|0x434d6e", 90, 363, 304, 529, 344 }}
local m服务器报错	 = {["log"] = "m服务器报错",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xcccbd0, "-1|5|0x444f6f,23|-2|0x434d6e,50|1|0xbbbdca,126|-4|0xa3a7ba,130|-5|0x444f6f,175|-4|0xd1ced1,170|-4|0x444f6f", 90, 360, 301, 578, 345 }}
local m合约即将到期	 = {["log"] = "m合约即将到期",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xbfc2cc, "18|-8|0xcfd0d8,-9|-6|0x404d6d,78|-3|0xc9cbd8,81|-6|0x3f4c6c,81|0|0x404d6d,92|-9|0x404d6d,103|-8|0xdbd8dc", 90, 365, 306, 535, 343 }}
local m球员评分		 = {["log"] = "m球员评分",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e1e2, "6|4|0x3e465a,14|5|0xe1dee1,12|-6|0xe3e1e2,16|-3|0x3e465a,67|6|0xe3e1e2,63|9|0x3e465a", 90, 577, 48, 693, 94 }}
local m受伤或到期	 = {["log"] = "m受伤或到期",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xb0b4c2, "7|-9|0xbdbec7,37|0|0xd9dae1,37|-3|0x424c6d,66|0|0x4b526b,72|-9|0x404d6d,78|-6|0xcacfdd,82|-7|0x404d6d", 90, 471, 302, 613, 346 }}
local m有奖励没领取	 = {["log"] = "m有奖励没领取",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x999fb1, "0|6|0x3e4a6c,5|1|0x3f4c6e,39|-4|0xc8c7ce,38|8|0x3f4c6e,66|7|0xb4b6c5,57|5|0x3f4c6e", 90, 363, 304, 517, 342 }}
local m球员合约到期1 = {["log"] = "m球员合约到期1",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xa74d53, "-7|0|0xdfdfe1,-1|7|0xeddbdd,4|-4|0xe3e1e0,3|0|0xaa656a,3|4|0xa9696f", 80, 255, 12, 1030, 554 }}
local m球员合约到期2 = {["log"] = "m球员合约到期2",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xb65e65, "-6|-1|0xe2d9dc,3|-5|0xddb7b8,7|-1|0xd5d0d0,0|6|0xebd9d8,0|-7|0xe1dfdf", 80, 250, 21, 1032, 539 }}
local m选中球员方框	 = {["log"] = "m选中球员方框",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x46f6ba, "89|1|0x32ffb7,90|112|0x33ffb8,1|111|0x33ffb8,25|118|0x283dc2,68|118|0x1e2da0,61|115|0x2535b5,31|115|0x2336be", 90, 260, 10, 1053, 552 }}
local m替补空位		 = {["log"] = "m替补空位",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x33ffb8, "-1|219|0x33ffb8,154|218|0x33ffb8,152|2|0x33ffb8,58|115|0x414b62,94|125|0x5b6886,82|117|0x414b62,70|125|0x5b6886", 90, 592, 357, 1236, 625 }}
local m替补没合约	 = {["log"] = "m替补没合约",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x32ffb7, "121|7|0xe2e0e1,137|7|0xe7e3e2,129|-2|0xe5e2e3,151|1|0x33ffb8,151|216|0x33ffb8,1|216|0x33ffb8", 90, 659, 360, 1228, 619 }}
local m没有对手		 = {["log"] = "m没有对手",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xb0afb6, "12|7|0x434e6c,19|1|0x434d6e,26|0|0x434d6e,25|7|0x434d6e,22|3|0xa3a7ba,80|7|0xb5b7c6,71|6|0x434d6e", 90, 361, 304, 498, 348 }}
local m更新对手		 = {["log"] = "m更新对手",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x83a0b4, "0|-6|0x212121,0|6|0x111111,32|-79|0x9396a9,-1|-25|0xdfdcdf,95|-75|0xd0d0d4,255|-69|0x9397a7,241|-69|0x434d6e", 90, 339, 303, 647, 418 }}
local m球员受伤		 = {["log"] = "m球员受伤",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xdbdbdb, "-5|4|0xd9d9d9,-3|8|0x8b181f,3|3|0x911c26,6|6|0xd8cacc,1|11|0xd9d2d0,-13|114|0x555768", 80, 253, 21, 1049, 555 }}
local m替补受伤 	 = {["log"] = "m替补受伤",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x33ffb8, "124|1|0xdedbdc,135|10|0xe0dede,133|3|0x920714,125|11|0x910611,151|1|0x32ffb7,152|217|0x33ffb8", 90, 666, 365, 1231, 620 }}
local m建议替补球员	 = {["log"] = "m建议替补球员",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x3dbfa5, "-6|0|0x1e1e1e,5|0|0x201d1e,0|11|0x111111,-4|7|0x2ed6b9,3|7|0x2ed6b9,27|-3|0xdedcda,48|-3|0xdedcd8,56|6|0x507434", 90, 155, 656, 299, 687 }}
local m球员合约到期	 = {["log"] = "m球员合约到期",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xb65d62, "-7|0|0xe1e0e3,6|0|0xe2e2e2,-1|-7|0xe3dde1,-1|6|0xeddbdd,-47|116|0x59586d,-1|-4|0xd65b67,-1|2|0xb05d67", 80, 253, 21, 1049, 555 }}
local m服务器错误	 = {["log"] = "m服务器错误",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xa3a7b6, "18|1|0x414b6c,18|7|0x424b68,28|4|0xb5b7c4,39|11|0x414b6c,39|0|0xdbdae1,74|-1|0x414b6c,66|2|0xdedbdc", 90, 355, 299, 502, 345 }}
local m比赛实况返回	 = {["log"] = "m比赛实况返回",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x1c1c1c, "0|-5|0xc94a65,0|6|0xc2405a,-4|1|0xbf4661,6|1|0xa1324a", 90, 69, 616, 98, 645 }}
local mSB已完成		 = {["log"] = "mSB已完成",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a4b9, "0|-6|0x1e1e1e,0|5|0x111411,515|-166|0x1f61c0,519|-170|0x33ffba,519|-162|0x33ffb8,552|-160|0x33ffba,556|-163|0x2b5ad2", 90, 60, 447, 688, 646 }}
local mSB奖励		 = {["log"] = "mSB奖励",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x3cf1c4, "4|-2|0x325bbc,3|6|0x345cc2,20|12|0x32fcb8,34|12|0x33f7ba,38|3|0x305cb8,47|5|0x35fcbb,50|-3|0x335abc,85|3|0x335abc", 90, 557, 92, 722, 146 }}
local m结束在重启	 = {["log"] = "m结束在重启",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x858ab1, "1|-5|0x344165,92|0|0x26345c,710|-80|0xd1d2dd,713|-85|0x1f3986,713|-72|0x1f3988,716|-79|0x1f3986", 90, 65, 540, 826, 665 }}
local m快捷选项		 = {["log"] = "m快捷选项",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe3e3f0, "14|0|0xe8e9f2,14|11|0xece9ea,17|4|0x17275f,15|20|0x16285f,20|14|0x17275f,50|12|0xeae9f0,116|10|0xe8e6ee,116|2|0x16285f", 90, 54, 36, 216, 86 }}
local m选中电源		 = {["log"] = "m选中电源",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xc2c2ce, "0|59|0xc2c2ce,29|26|0xeae9f0,29|43|0xece9ea,289|0|0xc3c4cf,289|59|0xc2c2ce", 90, 58, 348, 366, 421 }}
local m电源方块		 = {["log"] = "m电源方块",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xc2c2ce, "0|59|0xc2c2ce,289|59|0xc2c2ce,289|0|0xc3c4cf", 90, 41, 94, 386, 600 }}
local mOptions继续	 = {["log"] = "mOptions继续",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x282b28, "-1|-4|0xc9c6c7,-9|-8|0xc7c5c6,20|-5|0xcbc9c9,44|-1|0xc7c5c4,78|-3|0xd0cecc,96|-3|0x262926,109|0|0x292c2b", 90, 502, 610, 684, 665 }}
local m进行比赛2	 = {["log"] = "m进行比赛2",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x32ffb7, "0|7|0x38fcc0,-10|3|0x33ffb8,-13|9|0x2957cf,-20|16|0x2957cf,22|1|0x2957cf,50|5|0x35fcbb", 90, 64, 180, 190, 239 }}
local m选择主客场	 = {["log"] = "m选择主客场",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x222428, "37|0|0x25262a,18|-12|0x161a1e,28|-16|0x262628,2|-16|0x3f3e43,10|-6|0x424448,26|-6|0x454449", 90, 434, 249, 851, 314 }}
local m继续			 = {["log"] = "m继续",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x2160c2, "3|4|0x3ef1c9,23|8|0x2957cf,25|0|0x2958cd,29|5|0x32ffb7,216|55|0xe3e1e2,216|60|0x2a59ce,216|65|0xe3e1e2", 90, 74, 185, 335, 293 }}
local m联赛记录		 = {["log"] = "m联赛记录",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a4b9, "0|-6|0x1e1e1e,0|5|0x121512,169|-220|0x71757a,208|-220|0xe3e1e2,239|-219|0x4a4d55,248|-222|0x51545c,942|-223|0xe3e1e2", 90, 64, 393, 1051, 647 }}
local m赛季奖励		 = {["log"] = "m赛季奖励",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xc3b16d, "8|9|0x535763,7|22|0x555960,8|38|0x4f5460,48|-33|0xe3e1e2,28|-27|0xe3e1e2,30|-22|0xe3e1e2,0|58|0xcdba78", 90, 508, 489, 621, 608 }}
local m赛程表		 = {["log"] = "m赛程表",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xecdd91, "-14|18|0x817958,-6|34|0x201d13,6|100|0xb0fc42,-2|198|0xdc9829,-2|185|0xe3d7ae,2|118|0x7a6f51", 90, 941, 227, 1038, 509 }}
local m游戏列表		 = {["log"] = "m游戏列表",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xe7cb40, "-1|-8|0xd0af49,1|8|0xcaa037,-7|9|0x1b459c,7|-9|0x1c469e,411|5|0xece9ea,420|-4|0xece9ea,63|6|0x1d469a", 90, 54, 39, 526, 99 }}
local m开始单人赛季	 = {["log"] = "m开始单人赛季",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x859fb4, "0|-5|0x1f1f1f,0|-25|0xe0dde0,40|-71|0x434d6e,32|-80|0x9396a9,95|-75|0xd0d0d4,104|-68|0x434d6e,211|-76|0xb3b3be,211|-70|0x434d6e", 90, 337, 303, 606, 418 }}
local m比赛中		 = {["log"] = "m比赛中",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x222220, "232|-1|0x292929,115|33|0xe7e4e5,118|33|0xe6e4e2,115|30|0x222220,116|36|0x222220", 90, 126, 35, 374, 96 }}
local m角球			 = {["log"] = "m角球",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x2d3927, "-4|-1|0x989e91,3|3|0x96a08f,7|1|0x2c3826,0|6|0x2b3625,-4|35|0x899382,-1|32|0x2c3625", 90, 1017, 37, 1060, 105 }}
local m转会市场200	 = {["log"] = "m转会市场200",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xd5d4db, "4|-8|0xd5d6dc,5|-1|0x676a72,9|-3|0xd3d5db,17|-10|0xaeafb8,17|-3|0xaeafb8", 90, 754, 538, 787, 565 }}
local m球员选项		 = {["log"] = "m球员选项",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x1b1b1b, "-6|-4|0xb66ba4,5|7|0xbb73a6,289|228|0x85a1b7,289|222|0x1f1f1f,289|232|0x121919,283|227|0x1a1d1a,302|234|0x445074", 90, 698, 390, 1089, 671 }}
local m购买成功		 = {["log"] = "m购买成功",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a1b5, "0|-4|0x1d1f1e,0|5|0x141915,5|0|0x1a1a18,50|3|0x2eb1c2,79|-76|0xc2c3cc,69|-76|0x3f4c6c,76|-84|0xc0c0c9,99|-84|0xb6b9c3", 90, 344, 306, 481, 424 }}
local m错误			 = {["log"] = "m错误",			["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x859fb4, "0|-5|0x1f1f1f,0|6|0x111111,31|1|0x41decf,38|1|0x2958cd,56|-57|0x3f4c6e,50|-1|0x2759cb,55|-47|0xdfe0e9", 90, 338, 316, 423, 402 }}
local m非当前账号开局= {["log"] = "m非当前账号开局",["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x83a0b4, "0|-6|0x212121,0|6|0x131111,227|-84|0xdfdcdd,245|-76|0xb2b5c2,95|-82|0xe1e0e5,95|-70|0xbec0c6", 90, 340, 303, 619, 416 }}
local m已选中游戏	 = {["log"] = "m已选中游戏",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xece9ea, "0|31|0xece9ea,8|23|0x1d9fb9,9|7|0x1da1bb,143|7|0x1d9fbb,148|18|0xece9ea,135|26|0x1d9cb9", 90, 209, 265, 394, 330 }}
local m需要切换账号	 = {["log"] = "m需要切换账号",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x2a4f92, "0|12|0xcacfdb,12|12|0x2a4f90,11|3|0x2a4f92,65|1|0x5b595a,59|11|0xe2ddde", 90, 63, 134, 180, 187 }}
m换人相关["m继续单人赛季"]	 = {["log"] = "m继续单人赛季",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x859fb4, "0|-5|0x1f1f1f,0|6|0x111111,95|-67|0xaaa9b0,123|-81|0xb3b7ca,139|-78|0x9094a7,147|-80|0x424c6d,188|-75|0xb9bdd0,211|-71|0x434d6e", 90, 338, 301, 586, 421 }}
m换人相关["m静态合约到期"]	 = {["log"] = "m静态合约到期",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x890814, "-3|-5|0xe5e2e3,-11|4|0xe4dfe1,-2|12|0xdfdcdd,5|5|0xe2e2e2,1|6|0x8d212a,-6|6|0x961e2a,-6|-1|0xb6303e", 90, 484, 94, 512, 120 }}
m换人相关["m静态受伤"]		 = {["log"] = "m静态受伤",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0xd5b7ba, "5|-4|0x910915,-4|4|0x910611,-4|-3|0xe1dfdf,0|-7|0xe2ddde,1|6|0xe3e1e2,5|2|0xe1dfdf", 90, 484, 94, 512, 120 }}
m换人相关["m铜牌球员"]		 = {["log"] = "m铜牌球员",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x816951, "134|3|0x8f7457,1|180|0x917558,133|178|0x917558,67|-9|0x8f7457", 90, 360, 86, 528, 334 }}
m换人相关["m消耗品页面"]	 = {["log"] = "m消耗品页面",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x84a3b8, "1|-5|0x1e1e1e,1|5|0x151714,82|0|0x1c1c1c,80|-4|0xc0536d,163|0|0x1b1b1b,160|-4|0xb0729f,247|4|0xbbb8b9", 90, 66, 613, 372, 648 }}
m换人相关["m选中没有消耗品"] = {["log"] = "m选中没有消耗品",["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x33ffb8, "136|-3|0x32ffb7,-2|194|0x32ffb7,20|163|0x819db3,20|159|0x1e1e1e,20|168|0x141414,99|163|0x9598a4,66|158|0x9a9ca9", 90, 391, 393, 871, 627 }}
m换人相关["m没有可用道具"]	 = {["log"] = "m没有可用道具",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x33ffb8, "136|192|0x32ffb7,21|165|0x84a4bb,21|159|0x212121,20|171|0x101010,54|160|0xb5b6bf,67|160|0x999ba8,85|164|0x3b4662,85|167|0x3c4763", 90, 557, 401, 720, 619 }}
m换人相关["m全部任意"]		 = {["log"] = "m全部任意",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x77797f, "21|1|0xd9d6d9,21|32|0xe3e1e2,26|32|0xb3b3b5,17|30|0xa5a5a7,8|32|0x7b7b7d,4|35|0xe3e1e2", 90, 1000, 104, 1059, 176 }}
m换人相关["m位置任意"]		 = {["log"] = "m位置任意",		["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x3ac3cd, "4|-1|0x2957cf,4|4|0x2957cf,12|4|0x2957cf,12|-2|0x2957cf,18|1|0x2c93c6,26|1|0x2c8dc7,22|2|0x205fc1", 90, 1009, 144, 1053, 171 }}
m换人相关["m没有可用球员"]	 = {["log"] = "m没有可用球员",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x85a1b5, "0|-7|0x222222,259|-52|0xb9b9c4,258|-57|0xa2a5b1,511|-107|0x8d91a2,488|-111|0x434d6e,477|-103|0x434d6e,481|-110|0xa7acba", 90, 336, 289, 875, 434 }}
m主页相关["m不满11个人"]	 = {["log"] = "m不满11个人",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = { 0x86a5ba, "0|-6|0x222222,68|-50|0xcbcacf,98|-49|0xa9acb8,503|-105|0xb0b1ba,521|-99|0x9498a6,485|-136|0xcfd2dd,480|-132|0x404d6d,485|-127|0x404d6d", 90, 341, 275, 897, 441 }}
local m	 = {["log"] = "",	["cx"] = -1,["cy"] = -1,["boo"] = false,["color"] = {  }}

function My找色判断(tab,b)
	if b == nil then b = true end
	local x,y = findMultiColorInRegionFuzzy(table.unpack(tab.color))
	if tab.boo and x == tab.cx and y == tab.cy then
		if b then nLog(tab.log .. " : 成功" ) end return true,x,y
	elseif not tab.boo and x ~= tab.cx and y ~= tab.cy then
		if b then nLog(tab.log .. " : 成功" ) end return true,x,y
	else
		return false
	end
end

function My切换进攻方向(...)
	if 方向 > 0 then
		方向 = -50
		LR = LR2
	else
		方向 = 50
		LR = LR1
	end
end

function My退出程序(...)
	nLog("退出程序")
	MyDown("Home",1000,2000)
	MyDown("L-U",30,1000) 
	MyDown("L-U",30,1000) 
	MyDown("L-U",30,1000) 
	MyDown("R-R",30,1000) 
	MyDown("R-R",30,1000) 
	repeat
		mSleep(1000)
	until (My找色判断(m游戏列表))
end

function MY进入游戏(...)
	MyRocker("L", -100,0,100)
	mSleep(1000)
	if My找色判断(m需要切换账号) then MyDown("Home",30,3000) end
	MyRocker("L", -100,0,3000)
	local time = os.time()
	while true do
		if os.time() - time > 30 then return false end
		if My找色判断(m已选中游戏) then 
			MyDown("R-R",30,1000)
			return true
		end
		MyDown("L-R",30,1000)
	end
end

function My重连EA服务器(...)
	for var= 1, 60 do
		if My找色判断(mEA已连) then
			break
		elseif My找色判断(mEA重连) then
			MyDown("R",30,1000)
		elseif My找色判断(m错误) then
			MyDown("R-D",30,1000)
		elseif var == 60 then
			nLog("重连EA服务器失败")
			lua_exit()
			dialog("")
		elseif My找色判断(m需要联网) then
			My退出程序()
			mSleep(2000)
			if not MY进入游戏() then lua_exit() dialog() end
--			lua_exit()
--			dialog("")
		else
			nLog(var .. " 重连EA服务器中~~~")
			mSleep(1000)
		end
	end
end

function MyZhaoDuiShou(...)
	if getColor(84,  632) == 0x85a4b9 then MyDown("R-D",30,1000) return end
	for var= 1, 4 do
		MyDown("L-L") mSleep(1000)
		if getColor(84,  632) == 0x85a4b9 then MyDown("R-D",30,1000) return end
	end
	for var= 1, 4 do
		MyDown("L-R") mSleep(1000)
		if getColor(84,  632) == 0x85a4b9 then MyDown("R-D",30,1000) return end
	end
	-- 没有对手 可以刷新对手
	if My找色判断(m转会市场200) then
		MyDown("R2") mSleep(3000)
	end
end

function MY填补替补空位(...)
	MyDown("R-L",30,1000)
	if not MY找色判断(m换人相关.m全部任意) then
		MyDown("L-D",30,1000)
		MyDown("L-D",30,1000)
		repeat
			MyDown("L-R",30,1000)
		until (MY找色判断(m换人相关.m位置任意))
	end
	MyDown("R-U",30,1000)
	if MY找色判断(m换人相关.m没有可用球员) then
		lua_exit()
		nLog("去买礼包")
	end
	MyDown("R-D",30,1000)
	MyDown("R-R",30,1000)
	MyDown("R-R",30,1000)
end
function MY查找替补空位(...)
	MyDown("L-D",30,1000) -- 找替补
	MyDown("L-D",30,1000) 
	MyDown("L-D",30,1000) 
	MyDown("L-D",30,1000) 
	for var= 1, 12 do
		MyDown("L-R",30,200)
	end
	mSleep(1000)
	for var= 1, 5 do
		if My找色判断(m替补空位) then
			MY填补替补空位()
			break
--					MyDown("L-L",30,1000)
		elseif My找色判断(m替补没合约) then
			MyDown("L-L",30,1000)
		elseif My找色判断(m替补受伤) then
			MyDown("L-L",30,1000)
		else
			MyDown("R-D",30,1000) -- 替换选中问题球员
			MyDown("L-U",30,1000)
			nLog("替换队员成功")
--				MyDown("Options",30,1000)
			break
		end
		if var == 5 then
			boo_能否换人 = false
		end
	end
end
function My选中坐标()
	for var= 1, 10 do
		b,FK_x,FK_y = My找色判断(m选中球员方框,false)
		if b then break end
		mSleep(100)
	end	
end
function My换人(x,y)
	repeat
		My选中坐标()
		if (FK_y + 20 - ZL_y) <= -40 then
			MyDown("L-D",30,1000)
			nLog("FK_x : " .. FK_x .. " FK_y : " .. FK_y .. "ZL_x : " .. ZL_x .. " ZL_y : " .. ZL_y .. "下")
		elseif (FK_y + 20 - ZL_y) >= 40 then
			MyDown("L-U",30,1000)
			nLog("FK_x : " .. FK_x .. " FK_y : " .. FK_y .. "ZL_x : " .. ZL_x .. " ZL_y : " .. ZL_y .. "上")
		elseif (FK_x + 80 - ZL_x) <= -40 then
			MyDown("L-R",30,1000)
			nLog("FK_x : " .. FK_x .. " FK_y : " .. FK_y .. "ZL_x : " .. ZL_x .. " ZL_y : " .. ZL_y .. "右")
		elseif (FK_x + 80 - ZL_x) >= 40 then
			MyDown("L-L",30,1000)
			nLog("FK_x : " .. FK_x .. " FK_y : " .. FK_y .. "ZL_x : " .. ZL_x .. " ZL_y : " .. ZL_y .. "左")
		end
	until ((math.abs(FK_x + 80 - ZL_x) < 20) and (math.abs(FK_y + 20 - ZL_y) < 25))
	
	MyDown("R-L",30,2000) nLog(475)
	if My找色判断(m换人相关.m静态受伤) then			 -- 2-1 受伤
		if boo_能否换人 then -- 有可替换替补
			MY查找替补空位()
		else				 -- 没有可替换替补 出售球员
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
			MyDown("L-U",30,1000)
			MyDown("R-D",30,5000)
			MY填补替补空位()
		end	
	elseif My找色判断(m换人相关.m静态合约到期) then	 -- 2-3 合约到期
		if My找色判断(m换人相关.m铜牌球员) then		 -- 2-3-2 合约到期 铜牌球员 
			--[[
				1 使用道具	
				2 没有道具 卖掉球员
			--]]
			mSleep(2000)
			MyDown("R-D",30,1000)
			repeat
				mSleep(1000)
				x,y = findMultiColorInRegionFuzzy(table.unpack(m换人相关.m消耗品页面.color))
				if x ~= m换人相关.m消耗品页面.cx and y ~= m换人相关.m消耗品页面.cy then
					nLog(m换人相关.m消耗品页面.log .. " : 成功" )
				end
			until (x ~= -1)
			MyDown("R1",30,2000)
			MyDown("R1",30,2000)
			x,y = findMultiColorInRegionFuzzy(table.unpack(m换人相关.m没有可用道具.color))
			if x ~= m换人相关.m没有可用道具.cx then -- 没有可用道具 卖掉球员
				nLog(m换人相关.m没有可用道具.log .. " : 成功" )
				MyDown("R-D",30,2000)
				MyDown("R-L",30,1000)
				MyDown("L-U",30,1000)
				MyDown("R-D",30,1000)
				MyDown("L-U",30,1000)
				MyDown("R-D",30,1000)
			end
			MyDown("R-D",30,5000)
			MyDown("R-R",30,2000)
			nLog(m换人相关.m消耗品页面.log .. " : 结束" )
		else								 -- 2-3-1 合约到期 非铜球员 卖掉 ts.json.decode json 串解码
			nLog("非铜牌球员 卖掉")
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
			MyDown("L-U",30,1000)
			MyDown("R-D",30,5000)
			MY填补替补空位()
		end
	else									 -- 2-2 禁赛
	end
	--[[ 会员转会
		My转会()
	--]]
	
	--[[ 替换球员逻辑
		MyDown("R-D",30,1000) -- 选中问题球员
		MY查找替补空位()
	--]]
end
	
function My替换球员(...)
	--[[
		球员受伤或禁赛或合约到期
		1 找到异常球员
		2 判断类型
			1 受伤 替换到替补席位
				1 有可用替补
				2 替补有空位
					1 填补空位 重新开始找异常球员
				3 没有可用替补 使用道具	
				4 没有可用替补没有道具 卖掉球员
			2 禁赛 替换到替补席位
				1 有可用替补
				2 替补有空位
					1 填补空位 重新开始找异常球员
				3 没有可用替补 卖掉球员	
			3 合约到期 
				1 非铜球员 卖掉 
				2 铜牌球员
					1 使用道具
					2 没有道具 卖掉球员
		如果出现没有球员的情况需要去商店买400球员包			
	--]]	
	
	local boo_能否换人 = true
	local ZL_x,ZL_y = x,y -- 需要替换治疗
	local FK_x,FK_y = -1,-1 -- 当前选中方框
		
	::ZR::
	for var= 1, 20 do
		b,x,y = My找色判断(m球员受伤)
		if b then
			nLog("m球员受伤 ------------")
			My换人(x,y) 
			goto ZR
		else
			b,x,y = My找色判断(m球员合约到期1)
			if b then
				nLog("m球员合约到期1 ------------")
				My换人(x,y)
				goto ZR
--			else
--				b,x,y = My找色判断(m球员合约到期2)
--				if b then
--					nLog("m球员合约到期2 -----------")
--					My换人(x,y)
--				end
			end
		end
		mSleep(100)
	end
end

function My转会(...)
	function My找到合适球员(...)
		MyDown("R-D",30,1000)
		MyDown("L-D",30,1000)
		MyDown("R-D",30,1000)
		MyDown("L-U",30,1000)
		MyDown("R-D",30,1000)
		while (not My找色判断(m购买成功)) do
			mSleep(500)
		end
		MyDown("R-D",30,2000)
	end
	function MY没有合适球员(...)
		MyDown("R-R",30,1000)
		MyDown("R-L",30,1000)
		MyDown("L-U",30,1000)
		MyDown("R-D",30,1000)
		MyDown("L-U",30,1000)
--		MyDown("R-R",30,1000)
	end
			
	MyDown("L1",30,1000) -- 转会市场更换球员
	mSleep(2000)
	for var= 1, 30 do
		if (not My找色判断(m转会市场200)) then
			MyDown("L-R",30,2000)
		else
			My找到合适球员()
			return
		end
	end
	MY没有合适球员()
	lua_exit()
	dialog("")
end

function MY使用道具(...)
	MyDown("R-L",30,1000)
	MyDown("R-D",30,5000)
end

function My点球(...)
	local num = 0
	while (true) do
		nLog("My点球循环")
		keepScreen(false)
		keepScreen(true)
		-- 点球大赛
		if My找色判断(m点球引导) then
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m球员评分) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m比赛奖金) then
			while (not My找色判断(m选择对手) and not My找色判断(m精选阵容)) do
				MyDown("R-D",30,1000)
			end
			return
		elseif My找色判断(m我方点球) then
			mSleep(2000)
			ps4KeyDown("R-R")
			mSleep(430)
			ps4KeyUp("R-R")
			mSleep(200)
			for var= 1, 20 do
				ps4Rocker("L",40,-100)
				mSleep(200)
			end
			ps4Rocker("L",0,0)
			num = num + 1
			if num == 5 then break end
		else
			ps4KeyDown("R-U",1000)
		end
	end
end

function MyXJ8T(...)
	MyDown("R-D")
	while (true) do
		nLog("MyXJ8T循环")
		for var= 1, 10 do
			keepScreen(false)
			keepScreen(true)
			if My找色判断(m继续) then
				main()
			elseif My找色判断(m十二码点球) then
				My点球()
--			elseif My找色判断(m建议替补球员) then
--				MyDown("R-U",30,2000)
			elseif My找色判断(m我方点球) then
				My点球()
			elseif My找色判断(mOptions继续) then
				MyDown("Options",30,1000)
			elseif My找色判断(m继续比赛) then
				MyDown("R-D",30,2000)
			elseif My找色判断(m球员评分) then
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				main()
			elseif My找色判断(m比赛奖金) then
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				MyDown("R-D",30,2000)
				main()
			elseif My找色判断(m赛季奖励) then
				MyDown("R-D",30,2000)
			elseif My找色判断(m赛程表) then
				MyDown("R-D",30,2000)
			elseif My找色判断(m换人相关.m继续单人赛季) then
				MyDown("L-U",30,2000)
				MyDown("R-D",30,2000)
			elseif My找色判断(m进行比赛2) then
				MyDown("R-D",30,2000)
			elseif My找色判断(m联赛记录) then
				MyDown("R-D",30,2000)
			elseif My找色判断(m非当前账号开局) then
				MyDown("R-D",30,1000)
				My退出程序()
				if not MY进入游戏() then lua_exit() dialog() end
			elseif My找色判断(m选择对手) then
				方向 = 50
				main()
			elseif My找色判断(m精选阵容) then
				方向 = 50
				main()
			elseif My找色判断(m比赛实况) then
				if My找色判断(m比赛实况返回) then 
					MyDown("R-R",30,2000)
				else
					MyDown("R-D",30,2000)
					MyDown("R-D",30,2000)
					My切换进攻方向()
				end
			elseif My找色判断(m比赛奖金) then
				while (not My找色判断(m选择对手) and not My找色判断(m精选阵容)) do
					MyDown("R-D",30,1000)
				end
				方向 = 50
				main()
			elseif My找色判断(m选择手柄) then
				b,x,y = My找色判断(m选择主客场)
				if b and x >= 639 then -- 客场
					nLog("客场")
					方向 = -50
					LR = LR2
				elseif b then
					nLog("主场")
					方向 = 50
					LR = LR1
				end
			elseif My找色判断(m角球) then
				MyDown("R-D")
			elseif My找色判断(m比赛中) then
					nLog("开始踢球")
					repeat
						MyDown("R1")
						b,x,y = My找色判断(m足球)
						if b and (( (LR[1] < x) and (LR[2] < y) and (LR[3] > x) and (LR[4] > y) ) or ( (LR[5] < x) and (LR[6] < y) and (LR[7] > x) and (LR[8] > y) )) then
							nLog("禁区")
							MyRocker("L", 方向,0,300)
							ps4KeyDown("L")
							mSleep(100)
							ps4KeyDown("R")
							mSleep(100)
							ps4KeyDown("R-R")
							mSleep(100)
							ps4KeyUp("R-R")
							mSleep(100)
							ps4KeyUp("L")
							mSleep(100)
							ps4KeyUp("R")
						elseif My找色判断(m球员评分) then -- 下半边球场
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							return
						elseif My找色判断(m比赛奖金) then -- 下半边球场
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							MyDown("R-D",30,2000)
							return
						elseif b and y >= 635 then -- 下半边球场
							MyRocker("L", 0,-50,300)
						elseif My找色判断(mOPTIONS继续) then
							MyDown("Options",30,1000)
						elseif b and y <= 625 then -- 上半边球场
							MyRocker("L", 0,50,300)
						else -- 当做在中间
							MyRocker("L", 方向,-5,300)
						end
						mSleep(500)
					until (not b)
					nLog("踢球结束")
					ps4Rocker("L", 0,0,300)
			else
				MyDown("R-D")
			end
			mSleep(100)
		end
	end
end

function main(...)
	while (true) do	
--	for var= 1, 1 do
		nLog("main循环1")
		keepScreen(false)
		keepScreen(true)
		if My找色判断(mEA断开连接) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m进行比赛2) then
			MyDown("R-D",30,2000)
		elseif My找色判断(mEA重连) then
			MyDown("R",30,1000)
			My重连EA服务器()
		elseif My找色判断(m首页进入游戏) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m初始默认选项) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m结束在重启) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m联赛记录) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m赛季奖励) then
			MyDown("R-D",30,2000)
		elseif My找色判断(m赛程表) then
			MyDown("R-D",30,2000)
		elseif My找色判断(m欢迎回来) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m非当前账号开局) then
			MyDown("R-D",30,1000)
			My退出程序()
			if not MY进入游戏() then lua_exit() dialog() end
		elseif My找色判断(m服务器报错) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m服务器错误) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m主页相关.m不满11个人) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m选择语言) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m球员选项) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m错误) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m选择难易度) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m有奖励没领取) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m继续) then
			MyDown("R-D",30,2000)
		elseif My找色判断(m允许参赛) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m开始单人赛季) then
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m更新球队内容) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m更新球队完成) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m按X略过) then
			MyDown("R-D",30,1000)
		elseif My找色判断(mSB已完成) then
			MyDown("R-D",30,1000)
		elseif My找色判断(mSB奖励) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m合约即将到期) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m没有对手) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m更新对手) then
			MyDown("L-U",30,1000)
			MyDown("R-D",30,3000)
		elseif My找色判断(m受伤或到期) then
			MyDown("R-D",30,1000)
			My替换球员()
		elseif My找色判断(m需要联网) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m按X略过2) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m新手上路) then
			MyDown("R-D",30,1000)
		elseif My找色判断(mOPTIONS继续) then
			MyDown("Options",30,1000)
		elseif My找色判断(m选择手柄) then
			b,x,y = My找色判断(m选择主客场)
			if b and x >= 639 then -- 客场
				nLog("客场")
				方向 = -50
				LR = LR2
			else
				nLog("主场")
				方向 = 50
				LR = LR1
			end
			MyDown("R-D",30,1000)
		elseif My找色判断(m确认对手) then
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m精选阵容) then
			MyDown("R1",30,1000)
		elseif My找色判断(m选择队服) then
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m进行比赛) then
			MyDown("R-D",30,1000)
			MyXJ8T()
		elseif My找色判断(m球员就位) then
			MyXJ8T()
		elseif My找色判断(m选择对手) then 
			MyZhaoDuiShou()
		elseif My找色判断(m团队信息) then
			MyDown("R-D",30,1000)
		elseif My找色判断(mFUT中心) then
			MyDown("R1",30,1000)
		elseif My找色判断(m游戏首页) then
			MyDown("L-D",30,1000)
			MyDown("R1",30,1000)
		elseif My找色判断(m单人模式) then
			-- SQUAD BATTLE 模式
			-- MyDown("R-D",30,1000) 
			-- 单人游戏赛季
			MyDown("L-D",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m接受) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m切换设定档) then
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m首页) then
			MyDown("R1",30,1000)
		elseif My找色判断(m开始游戏) then
			if My找色判断(m开始UT模式) then
				MyDown("R-D",30,1000)
			elseif My找色判断(mUT模式) then
				for var= 1, 3 do
					if My找色判断(m开始UT模式) then
						MyDown("R-D",30,1000)
						break
					end
					MyDown("L-R",30,1000)
				end
			else
				nLog("未找到UT模式")
				lua_exit()
				mSleep(0)
				toast("")
			end
		elseif My找色判断(m收取电邮) then
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m使用者协议) then
			MyDown("L-U",30,1000)
			MyDown("R-D",30,1000)
		end
		mSleep(1000)
	end
end

function My换账号(...)
--	MyDown("Home",1000,1000)
	function My选择电源(...)
		while not My找色判断(m选中电源) do	
			nLog("My选择电源")
			keepScreen(false)
			keepScreen(true)
			b,x,y = My找色判断(m快捷选项)
			if y - 355 >= 10 then
				MyDown("L-U",30,1000)
			elseif y - 355 <= 10 then
				MyDown("L-D",30,1000)
			end
			mSleep(100)
		end
		
		repeat
			-- body
		until (true)
	end
	
	while (true) do	
		nLog("My换账号")
		keepScreen(false)
		keepScreen(true)
		if My找色判断(m快捷选项) then
			MyDown("R-D",30,1000)
--		elseif My找色判断(mEA重连) then
--			MyDown("R-D",30,1000)
		end
		mSleep(1000)
	end
end
--	MyDown("Home",1000,1000)

-- MyDown("R-D",30,1000)

--My退出程序()
--				if not MY进入游戏() then lua_exit() dialog() end

-- main()
-- MyXJ8T()
-- My点球()
-- My替换球员()
-- m快捷选项()
-- My退出程序()
-- MY填补替补空位()

---[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	b,x,y = My找色判断(m换人相关.m全部任意)
	if b then
		nLog(">>>>>>>>>>> " .. x .. " : "..y .. " <<<<<<<<<<<<<")
	end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]

--[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	for var= 1, 20000000000 do
		b,x,y = My找色判断(m球员合约到期)
		if b then
			nLog(x .. " : " .. y) mSleep(3000)
		end
		mSleep(100)
	end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]

--[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	b,x,y = My找色判断(m选择主客场)
				if b and x >= 639 then -- 客场
					nLog("客场")
					方向 = -50
					LR = LR2
				elseif b then
					nLog("主场")
					方向 = 50
					LR = LR1
				end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]

--[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	for var= 1, 10 do
		snapshot(var .. "test.png", 0, 0, 1279, 719)
	end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]

--[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	local num = 0
	while (true) do
		nLog("My点球循环")
		keepScreen(false)
		keepScreen(true)
		-- 点球大赛
		if My找色判断(m点球引导) then
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
			MyDown("R-D",30,1000)
		elseif My找色判断(m球员评分) then
			MyDown("R-D",30,1000)
		elseif My找色判断(m比赛奖金) then
			while (not My找色判断(m选择对手) and not My找色判断(m精选阵容)) do
				MyDown("R-D",30,1000)
			end
			return
		elseif true then
			mSleep(2000)
			ps4KeyDown("R-R")
			mSleep(430)
			ps4KeyUp("R-R")
			mSleep(200)
			for var= 1, 20 do
				ps4Rocker("L",40,-100)
				mSleep(100)
			end
			ps4Rocker("L",0,0)
			mSleep(2000)
			num = num + 1
			if num == 13 then return end
		else
			ps4KeyDown("R-U",1000)
		end
	end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]

--[[
	nLog(">>>>>>>>>>> 12321 <<<<<<<<<<<<<")
	for var = 1 , 10 do
			if My找色判断(m替补空位) then
				return
			elseif My找色判断(m替补没合约) then
				return
			elseif My找色判断(m替补受伤2) then
				return
			end
		end
	nLog(">>>>>>>>>>> 32123 <<<<<<<<<<<<<")
--]]
--My截图()
--My替换伤员(0xc8bcb5, "0|14|0xd4c8c1,13|0|0xd1cfc0,9|11|0x8b3736,5|5|0x933434", 90, 279, 24, 1005, 529)
--MyDown("Home")
-- MyDown("R-D")
-- mSleep(1000)
-- MyDown("R-D")

--[[

function MyDown(k,t,ms)
	if t == nil then t = 30 end
	if ms == nil then ms = 0 end
	ps4KeyDown(k)
	mSleep(t)
	ps4KeyUp(k)
	mSleep(ms)
end

-- Options
-- MyDown("Home")
function MyRocker(k,x,y,t)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if t == nil then t = 30 end
	if ms == nil then ms = 0 end
	ps4Rocker(k,x,y)
	mSleep(t)
	ps4Rocker(k,0,0)
	mSleep(ms)
end

MyDown("R-R")

--]]




