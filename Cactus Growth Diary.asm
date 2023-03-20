INCLUDE Irvine32.inc
INCLUDE Macros.inc
main          EQU start@0

.data

Delay_FPS DWORD    70	;遊戲畫面更新速度
LevelUP_FPS DWORD 1500	;升級後等待時間
Start_Delay DWORD 300
AnimateFlag BYTE 0


BCol BYTE 125			; 螢幕寬度
BRow SBYTE 30			; 螢幕高度

;game
game1 BYTE	"  .-------.  .--------.  ---    ---   --------  ",0
game2 BYTE	" /   ______\ |  .--.  | |   \  /   | |   _____| ",0
game3 BYTE	" |  |  ____  |  |  |  | |    \/    | |  |_____  ",0
game4 BYTE	" |  | |_   | |  |__|  | |          | |   _____| ",0
game5 BYTE	" |  |___|  | |   __   | |  |\  /|  | |  |_____  ",0
game6 BYTE	" \._______./ |__|  |__| |__| \/ |__| |________| ",0

;over
over1 BYTE	"  .--------.   --    --    --------    -------  ",0
over2 BYTE	"  |  .--.  |  |  |  |  |  |   _____|  |   _   \ ",0
over3 BYTE	"  |  |  |  |  |  |  |  |  |  |_____   |  |_|  | ",0
over4 BYTE	"  |  |  |  |  \  \  /  /  |   _____|  |      _/ ",0
over5 BYTE	"  |  |__|  |   \  \/  /   |  |_____   |  |\  \  ",0
over6 BYTE	"  |________|    \____/    |________|  |__| \__\ ",0

;you
you1 BYTE	"   	---    ---  .--------.   --    --    	 ",0
you2 BYTE	"    	\  \  /  /  |  .--.  |  |  |  |  |    	 ",0
you3 BYTE	"     	 \  \/  /   |  |  |  |  |  |  |  |    	 ",0
you4 BYTE	"    	  \    /    |  |  |  |  |  |  |  |    	 ",0
you5 BYTE	"           |  |     |  |__|  |  |  |__|  |    	 ",0
you6 BYTE	"           |__|     |________|  \________/    	 ",0

;win
win1 BYTE	"   --    --    --   --   ----   --     --   --  ",0
win2 BYTE	"  |  |  |  |  |  | |  | |    \ |  |   |  | |  | ",0
win3 BYTE	"  |  |  |  |  |  | |  | |     \|  |   |  | |  | ",0
win4 BYTE	"  \  \  /  \  /  / |  | |         |   |__| |__| ",0
win5 BYTE	"   \  \/ /\ \/  /  |  | |  |\     |    --   --  ",0
win6 BYTE	"    \___/  \___/   |__| |__| \____|   |__| |__| ",0


;標題字串
START0 BYTE   "                                                                                 ",0         
START1 BYTE   "                                                                                 ",0
START2 BYTE   "        ___      __       ___    _______   _     _   _____                       ",0
START3 BYTE   "      .'__ '.   /  \    .'__ '. |__   __| | |   | | /  ___|                      ",0
START4 BYTE   "     / /  |_|  / /\ \  / /  |_|    | |    | |   | | | |___                       ",0
START5 BYTE   "     | |   _  / /__\ \ | |   _     | |    | |   | | \___  \        _________     ",0
START6 BYTE   "     \ \__| | |  __  | \ \__| |    | |    | '._.' |  ___| |       |_________|    ",0
START7 BYTE   "	    '.___.' |_|  |_|  '.___.'    |_|     '.___.'  |_____/        |_______|     ",0

;標題字串更新1
START3a BYTE  "      .'__ '.   /  \    .'__ '. |__   __| | |   | | /  ___|         |* * *|      ",0
START4a BYTE  "     / /  |_|  / /\ \  / /  |_|    | |    | |   | | | |___          |* * *|      ",0
START5a BYTE  "     | |   _  / /__\ \ | |   _     | |    | |   | | \___  \        _|*_*_*|_     ",0

;標題字串更新2
START0b BYTE  "	                                                                   -----       ",0               
START1b BYTE  "	                                                                  /* * *\      ",0            
START2b BYTE  "	      ___      __       ___    _______   _     _   _____          |* * *|      ",0

;標題字串更新3
START0c BYTE  "                                                                     -----  .-.  ",0            
START1c BYTE  "                                                                    /* * *\ |*|  ",0           
START2c BYTE  "        ___      __       ___    _______   _     _   _____      .-. |* * *|_|*|  ",0
START3c BYTE  "      .'__ '.   /  \    .'__ '. |__   __| | |   | | /  ___|     |*|_|* * *|___|  ",0
START4c BYTE  "     / /  |_|  / /\ \  / /  |_|    | |    | |   | | | |___      |___|* * *|      ",0
START5c BYTE  "     | |   _  / /__\ \ | |   _     | |    | |   | | \___  \        _|*_*_*|_     ",0

;規則
rule BYTE "       Use LEFT and RIGHT to control the spaceship ",0
rule2 BYTE "           CTRL + LEFT/RIGHT can move faster",0

;標題字串
PressToStart1 BYTE "__  __  ___  __  __     __ __   _    __ ___    ___  _      __ ___  _   __  ___" ,0
PressToStart2 BYTE "|_) |_) |_  (_  (_     (_  |_) /_\  /   |__     |  / \    (_   |  /_\  |_)  | " ,0
PressToStart3 BYTE "|   | \ |__ __) __)    __) |   |  \ \__ |__     |  \_/    __)  |  |  \ | \  | " ,0

;level1
level1_a BYTE	" ___             ___________    ___       ___    ___________    ___                 ____             ",0
level1_b BYTE	"/___/|          /___________/| /___/|    /___/| /___________/| /___/|              /____/|           ",0
level1_c BYTE	"|   ||          |           || |   ||    |   || |           || |   ||             /     ||           ",0
level1_d BYTE	"|   ||          |     ______|/ |   ||    |   || |     ______|/ |   ||            /      ||           ",0
level1_e BYTE	"|   ||          |   ||______   |   ||    |   || |   ||______   |   ||           /       ||           ",0
level1_f BYTE	"|   ||          |   |/______/| |   ||    |   || |   |/______/| |   ||          /___/|   ||           ",0
level1_g BYTE	"|   ||          |           || \   \\    /   // |           || |   ||               |   ||           ",0
level1_h BYTE	"|   ||          |     ______|/  \   \\  /   //  |     ______|/ |   ||               |   ||           ",0
level1_i BYTE	"|   ||_______   |   ||______     \   \\/   //   |   ||______   |   ||_______    ____|   ||___        ",0
level1_j BYTE	"|   |/_______/| |   |/______/|    \       //    |   |/______/| |   |/_______/| /____|   |/___/|      ",0
level1_k BYTE	"|            || |           ||     \     //     |           || |            || |             ||      ",0
level1_l BYTE	"|____________|/ |___________|/      \___//      |___________|/ |____________|/ |_____________|/      ",0

;level2
level2_a BYTE	" ___             ___________    ___       ___    ___________    ___               ______             ",0
level2_b BYTE	"/___/|          /___________/| /___/|    /___/| /___________/| /___/|            /______/\           ",0
level2_c BYTE	"|   ||          |           || |   ||    |   || |           || |   ||           /        \\          ",0
level2_d BYTE	"|   ||          |     ______|/ |   ||    |   || |     ______|/ |   ||          /   ___    \\         ",0
level2_e BYTE	"|   ||          |   ||______   |   ||    |   || |   ||______   |   ||         /   //  \   ||         ",0
level2_f BYTE	"|   ||          |   |/______/| |   ||    |   || |   |/______/| |   ||         \   \\  /   //         ",0
level2_g BYTE	"|   ||          |           || \   \\    /   // |           || |   ||          \___\\/   //          ",0
level2_h BYTE	"|   ||          |     ______|/  \   \\  /   //  |     ______|/ |   ||               /   //           ",0
level2_i BYTE	"|   ||_______   |   ||______     \   \\/   //   |   ||______   |   ||_______       /   //___         ",0
level2_j BYTE	"|   |/_______/| |   |/______/|    \       //    |   |/______/| |   |/_______/|    /   /_____/|       ",0
level2_k BYTE	"|            || |           ||     \     //     |           || |            ||   /          ||       ",0
level2_l BYTE	"|____________|/ |___________|/      \___//      |___________|/ |____________|/  /___________|/       ",0

;level3
level3_a BYTE	" ___             ___________    ___       ___    ___________    ___              __________          ",0
level3_b BYTE	"/___/|          /___________/| /___/|    /___/| /___________/| /___/|           /__________/|        ",0
level3_c BYTE	"|   ||          |           || |   ||    |   || |           || |   ||          /           \\        ",0
level3_d BYTE	"|   ||          |     ______|/ |   ||    |   || |     ______|/ |   ||          |_______    ||        ",0
level3_e BYTE	"|   ||          |   ||______   |   ||    |   || |   ||______   |   ||            ______|   ||        ",0
level3_f BYTE	"|   ||          |   |/______/| |   ||    |   || |   |/______/| |   ||           /______|   ||        ",0
level3_g BYTE	"|   ||          |           || \   \\    /   // |           || |   ||          /           //        ",0
level3_h BYTE	"|   ||          |     ______|/  \   \\  /   //  |     ______|/ |   ||          \_______    \\        ",0
level3_i BYTE	"|   ||_______   |   ||______     \   \\/   //   |   ||______   |   ||_______    _______|   ||        ",0
level3_j BYTE	"|   |/_______/| |   |/______/|    \       //    |   |/______/| |   |/_______/| /_______|   ||        ",0
level3_k BYTE	"|            || |           ||     \     //     |           || |            || |           ||        ",0
level3_l BYTE	"|____________|/ |___________|/      \___//      |___________|/ |____________|/ \___________//        ",0


;仙人掌第一關
Cactus_mid_1_1 BYTE "     .---.     ",0
Cactus_mid_1_2 BYTE "    /* * *\    ",0
Cactus_mid_1_3 BYTE "    |* * *|    ",0
Cactus_mid_1_4 BYTE "   _|*_*_*|_   ",0
Cactus_mid_1_5 BYTE "  |_________|  ",0
Cactus_mid_1_6 BYTE "   |_______|   ",0

Cactus_right_1_1 BYTE "       .----.  ",0
Cactus_right_1_2 BYTE "      /* * */  ",0
Cactus_right_1_3 BYTE "     /* * */   ",0
Cactus_right_1_4 BYTE "  _ /*_*_*/_   ",0
Cactus_right_1_5 BYTE " /_________/   ",0
Cactus_right_1_6 BYTE "  /______/     ",0

Cactus_left_1_1 BYTE "  .----.       ",0
Cactus_left_1_2 BYTE "  \* * *\      ",0
Cactus_left_1_3 BYTE "   \* * *\     ",0
Cactus_left_1_4 BYTE "   _\*_*_*\ _  ",0
Cactus_left_1_5 BYTE "   \_________\ ",0
Cactus_left_1_6 BYTE "     \______\  ",0

;仙人掌-第二關
Cactus_mid_2_1 BYTE "     -----    ",0
Cactus_mid_2_2 BYTE "    /* * *\   ",0
Cactus_mid_2_3 BYTE "    |* * *|   ",0
Cactus_mid_2_4 BYTE "    |* * *|   ",0
Cactus_mid_2_5 BYTE "    |* * *|   ",0
Cactus_mid_2_6 BYTE "   _|*_*_*|_  ",0
Cactus_mid_2_7 BYTE "  |_________| ",0
Cactus_mid_2_8 BYTE "   |_______|  ",0

Cactus_right_2_1 BYTE "         .----.",0
Cactus_right_2_2 BYTE "        /* * */",0
Cactus_right_2_3 BYTE "       /* * */ ",0
Cactus_right_2_4 BYTE "      /* * */  ",0
Cactus_right_2_5 BYTE "     /* * */   ",0
Cactus_right_2_6 BYTE "  _ /*_*_*/_   ",0
Cactus_right_2_7 BYTE " /_________/   ",0
Cactus_right_2_8 BYTE "  /______/     ",0

Cactus_left_2_1 BYTE " .----.         ",0
Cactus_left_2_2 BYTE " \* * *\        ",0
Cactus_left_2_3 BYTE "  \* * *\       ",0
Cactus_left_2_4 BYTE "   \* * *\      ",0
Cactus_left_2_5 BYTE "    \* * *\     ",0
Cactus_left_2_6 BYTE "    _\*_*_*\ _  ",0
Cactus_left_2_7 BYTE "    \_________\ ",0
Cactus_left_2_8 BYTE "      \______\  ",0

;仙人掌-第三關
Cactus_mid_3_1  BYTE "      -----  .-. ",0
Cactus_mid_3_2  BYTE "     /* * *\ |*| ",0
Cactus_mid_3_3  BYTE " .-. |* * *|_|*| ",0
Cactus_mid_3_4  BYTE " |*|_|* * *|___| ",0
Cactus_mid_3_5  BYTE " |___|* * *|     ",0
Cactus_mid_3_6  BYTE "    _|*_*_*|_    ",0
Cactus_mid_3_7  BYTE "   |_________|   ",0
Cactus_mid_3_8  BYTE "    |_______|    ",0

Cactus_right_3_1 BYTE "        .----.  -.",0
Cactus_right_3_2 BYTE "       /* * */ /*/",0
Cactus_right_3_3 BYTE "  -.  /* * */_/*/ ",0
Cactus_right_3_4 BYTE " /*/_/* * */___/  ",0
Cactus_right_3_5 BYTE "/___/* * */       ",0
Cactus_right_3_6 BYTE "  _/*_*_*/_       ",0
Cactus_right_3_7 BYTE " /_________/      ",0
Cactus_right_3_8 BYTE "  /______/        ",0

Cactus_left_3_1  BYTE "  .----.  -.      ",0
Cactus_left_3_2  BYTE "  \* * *\ \*\     ",0
Cactus_left_3_3  BYTE ".- \* * *\_\*\    ",0
Cactus_left_3_4  BYTE "\*\_\* * *\___\   ",0
Cactus_left_3_5  BYTE " \___\* * *\      ",0
Cactus_left_3_6  BYTE "     _\*_*_*\_    ",0
Cactus_left_3_7  BYTE "     \_________\  ",0
Cactus_left_3_8  BYTE "       \______\   ",0

;太陽
sun0 BYTE "   ",0
sun1 BYTE "\|/",0
sun2 BYTE "-O-",0
sun3 BYTE "/|\",0

;雨
rain0 BYTE "   ",0
rain1 BYTE "|||",0
rain2 BYTE "|||",0
rain3 BYTE "|||",0

;仙人掌碰撞座標
CactusCollisionX1 BYTE ?
CactusCollisionX2 BYTE ?
CactusCollisionY1 BYTE 29
CactusCollisionY2 BYTE 33
Cactus_height BYTE 4
Cactus_width BYTE 13

;仙人掌扣血flag
CactusLoseLive BYTE 0

;仙人掌定位
CactusCoordinateX BYTE 10
CactusCoordinateY BYTE 29

;掉落物位置 RockCoordinateX/RockCoordinateY
FallCoordX BYTE 51,11,31,61,21,41
FallCoordY SBYTE 0,-11,-22,-33,-44,-55

;障礙物碰撞座標
FallCollisionX1 BYTE ?,?,?,?,?,?
FallCollisionX2 BYTE ?,?,?,?,?,?
FallCollisionY1 BYTE 29,29,29,29,29,29
FallCollisionY2 BYTE 33,33,33,33,33,33
Fall_height BYTE 3
Fall_width BYTE 3
Hitflag BYTE 0

;螢幕清除字串
ClearStr BYTE "                                                                                                                                ",0
ClearScore BYTE "            "

;紀錄掉落物總數
Count_Fall Byte 2

;隨機變數-掉落物(0-太陽，1-雨)
randVal BYTE 0,1,0,1,0,1

;關卡
Level BYTE 1
;LevelTitle BYTE " LEVEL : ",0
;LevelCoordX BYTE 60
;LevelCoordY SBYTE 15

;分數
Score DWORD 0
ScoreTitle BYTE "score : ",0
ScoreCoordX BYTE 130
ScoreCoordY SBYTE 3

;血量
Live BYTE "<3",0
LiveCount BYTE 3
LiveTitle BYTE "Live : ",0
LiveCoordX BYTE 130
LiveCoordY SBYTE 7
LiveShine BYTE 0

;顏色
color_white  DWORD white+(black*16)
color_green  DWORD green+(black*16)
color_brown  DWORD brown+(black*16)
color_yellow DWORD yellow+(black*16)
color_blue   DWORD lightblue+(black*16)
color_red DWORD red+(black*16)
color_red_magenta DWORD red+(magenta*16)

.code
;在指定座標添加字串================================================================
Create_str PROC USES eax ebx ecx edx,
	pStr: PTR BYTE,	;字串的pointer
	Xcoord: BYTE,	;座標X
	Ycoord: SBYTE,	;座標Y
	color: DWORD	;顏色

	mov dl,Xcoord
	mov dh,Ycoord
	call Gotoxy
	mov eax,color
	call SetTextColor
	mov edx,pStr
	call WriteString
	
	ret
Create_str ENDP

;在指定座標添加整數=========================================================
Create_int PROC USES eax ebx ecx edx,
    	column: BYTE,	;座標x
    	row: BYTE,	;座標y
	number: DWORD

    	mov  dl,column
    	mov  dh,row
    	call Gotoxy
	mov eax, white+(black*16)
    	call SetTextColor
	mov eax,number
	call WriteDec
    	ret
Create_int ENDP

;顯示開頭動畫============================================================
start_Animate PROC
	mov bl,AnimateFlag
	.IF bl == 0	
		INVOKE Create_str ,OFFSET START0,30,6,color_green
        INVOKE Create_str ,OFFSET START1,30,7,color_green
       	INVOKE Create_str ,OFFSET START2,30,8,color_green
        INVOKE Create_str ,OFFSET START3,30,9,color_green
        INVOKE Create_str ,OFFSET START4,30,10,color_green
		INVOKE Create_str ,OFFSET START5,30,11,color_green
		INVOKE Create_str ,OFFSET START6,30,12,color_green
		INVOKE Create_str ,OFFSET START7,30,13,color_green
		INVOKE Create_str ,OFFSET START0,30,14,color_green
		INVOKE Create_str ,OFFSET PressToStart1,30,20,color_white
		INVOKE Create_str ,OFFSET PressToStart2,30,21,color_white
		INVOKE Create_str ,OFFSET PressToStart3,30,22,color_white
		mov bl,1
	.ELSEIF bl == 1
		INVOKE Create_str ,OFFSET START0,30,6,color_green
		INVOKE Create_str ,OFFSET START1,30,7,color_green
        INVOKE Create_str ,OFFSET START2,30,8,color_green
        INVOKE Create_str ,OFFSET START3a,30,9,color_green
        INVOKE Create_str ,OFFSET START4a,30,10,color_green
		INVOKE Create_str ,OFFSET START5a,30,11,color_green
		INVOKE Create_str ,OFFSET START6,30,12,color_green
		INVOKE Create_str ,OFFSET START7,30,13,color_green
		INVOKE Create_str ,OFFSET START0,30,14,color_green
		INVOKE Create_str ,OFFSET START0,30,20,color_white
		INVOKE Create_str ,OFFSET START0,30,21,color_white
		INVOKE Create_str ,OFFSET START0,30,22,color_white
		mov bl,2
	.ELSEIF bl == 2
		INVOKE Create_str ,OFFSET START0b,30,6,color_green
		INVOKE Create_str ,OFFSET START1b,30,7,color_green
        INVOKE Create_str ,OFFSET START2b,30,8,color_green
        INVOKE Create_str ,OFFSET START3a,30,9,color_green
        INVOKE Create_str ,OFFSET START4a,30,10,color_green
		INVOKE Create_str ,OFFSET START5a,30,11,color_green
		INVOKE Create_str ,OFFSET START6,30,12,color_green
		INVOKE Create_str ,OFFSET START7,30,13,color_green
		INVOKE Create_str ,OFFSET START0,30,14,color_green
		INVOKE Create_str ,OFFSET PressToStart1,30,20,color_white
		INVOKE Create_str ,OFFSET PressToStart2,30,21,color_white
		INVOKE Create_str ,OFFSET PressToStart3,30,22,color_white
		mov bl,3
	.ELSEIF bl == 3
		INVOKE Create_str ,OFFSET START0c,30,6,color_green
		INVOKE Create_str ,OFFSET START1c,30,7,color_green
        INVOKE Create_str ,OFFSET START2c,30,8,color_green
        INVOKE Create_str ,OFFSET START3c,30,9,color_green
        INVOKE Create_str ,OFFSET START4c,30,10,color_green
		INVOKE Create_str ,OFFSET START5c,30,11,color_green
		INVOKE Create_str ,OFFSET START6,30,12,color_green
		INVOKE Create_str ,OFFSET START7,30,13,color_green
		INVOKE Create_str ,OFFSET START0,30,14,color_green
		INVOKE Create_str ,OFFSET START0,30,20,color_white
		INVOKE Create_str ,OFFSET START0,30,21,color_white
		INVOKE Create_str ,OFFSET START0,30,22,color_white
		mov bl,0
	.ENDIF
	mov AnimateFlag,bl
	ret
start_Animate ENDP

;印出開始畫面======================================================
cactus_Start PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET START0,30,6,color_green
	INVOKE Create_str ,OFFSET START1,30,7,color_green
	INVOKE Create_str ,OFFSET START2,30,8,color_green
	INVOKE Create_str ,OFFSET START3,30,9,color_green
	INVOKE Create_str ,OFFSET START4,30,10,color_green
	INVOKE Create_str ,OFFSET START5,30,11,color_green
	INVOKE Create_str ,OFFSET START6,30,12,color_green
	INVOKE Create_str ,OFFSET START7,30,13,color_green
	INVOKE Create_str ,OFFSET START0,30,14,color_green
	INVOKE Create_str ,OFFSET PressToStart1,30,20,color_white
	INVOKE Create_str ,OFFSET PressToStart2,30,21,color_white
	INVOKE Create_str ,OFFSET PressToStart3,30,22,color_white
	INVOKE Create_str ,OFFSET rule,40,25,color_yellow
	INVOKE Create_str ,OFFSET rule2,40,26,color_yellow
	
keycheck:
        	call Readkey
        	.IF dx ==20h ;if space is pressed
            		call Clrscr
            		ret
        	.ENDIF
        	mov ecx , 4
	mov eax, Start_Delay	;螢幕更新速率
	call delay
	call start_Animate		;更新螢幕動畫
	loop keycheck
	ret
cactus_Start ENDP

;印出換關畫面======================================================
LevelUP1 PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET level1_a,30,10,color_white
	INVOKE Create_str ,OFFSET level1_b,30,11,color_white
	INVOKE Create_str ,OFFSET level1_c,30,12,color_white
	INVOKE Create_str ,OFFSET level1_d,30,13,color_white
	INVOKE Create_str ,OFFSET level1_e,30,14,color_white
	INVOKE Create_str ,OFFSET level1_f,30,15,color_white
	INVOKE Create_str ,OFFSET level1_g,30,16,color_white
	INVOKE Create_str ,OFFSET level1_h,30,17,color_white
	INVOKE Create_str ,OFFSET level1_i,30,18,color_white
	INVOKE Create_str ,OFFSET level1_j,30,19,color_white
	INVOKE Create_str ,OFFSET level1_k,30,20,color_white
	INVOKE Create_str ,OFFSET level1_l,30,21,color_white
	ret
LevelUP1 ENDP

LevelUP2 PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET level2_a,30,10,color_white
	INVOKE Create_str ,OFFSET level2_b,30,11,color_white
	INVOKE Create_str ,OFFSET level2_c,30,12,color_white
	INVOKE Create_str ,OFFSET level2_d,30,13,color_white
	INVOKE Create_str ,OFFSET level2_e,30,14,color_white
	INVOKE Create_str ,OFFSET level2_f,30,15,color_white
	INVOKE Create_str ,OFFSET level2_g,30,16,color_white
	INVOKE Create_str ,OFFSET level2_h,30,17,color_white
	INVOKE Create_str ,OFFSET level2_i,30,18,color_white
	INVOKE Create_str ,OFFSET level2_j,30,19,color_white
	INVOKE Create_str ,OFFSET level2_k,30,20,color_white
	INVOKE Create_str ,OFFSET level2_l,30,21,color_white
	ret
LevelUP2 ENDP

LevelUP3 PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET level3_a,30,10,color_white
	INVOKE Create_str ,OFFSET level3_b,30,11,color_white
	INVOKE Create_str ,OFFSET level3_c,30,12,color_white
	INVOKE Create_str ,OFFSET level3_d,30,13,color_white
	INVOKE Create_str ,OFFSET level3_e,30,14,color_white
	INVOKE Create_str ,OFFSET level3_f,30,15,color_white
	INVOKE Create_str ,OFFSET level3_g,30,16,color_white
	INVOKE Create_str ,OFFSET level3_h,30,17,color_white
	INVOKE Create_str ,OFFSET level3_i,30,18,color_white
	INVOKE Create_str ,OFFSET level3_j,30,19,color_white
	INVOKE Create_str ,OFFSET level3_k,30,20,color_white
	INVOKE Create_str ,OFFSET level3_l,30,21,color_white
	ret
LevelUP3 ENDP

win PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET you1,40,10,color_white
	INVOKE Create_str ,OFFSET you2,40,11,color_white
	INVOKE Create_str ,OFFSET you3,40,12,color_white
	INVOKE Create_str ,OFFSET you4,40,13,color_white
	INVOKE Create_str ,OFFSET you5,40,14,color_white
	INVOKE Create_str ,OFFSET you6,40,15,color_white
	INVOKE Create_str ,OFFSET win1,40,16,color_white
	INVOKE Create_str ,OFFSET win2,40,17,color_white
	INVOKE Create_str ,OFFSET win3,40,18,color_white
	INVOKE Create_str ,OFFSET win4,40,19,color_white
	INVOKE Create_str ,OFFSET win5,40,20,color_white
	INVOKE Create_str ,OFFSET win6,40,21,color_white
	ret
win ENDP

Lose PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET game1,40,10,color_white
	INVOKE Create_str ,OFFSET game2,40,11,color_white
	INVOKE Create_str ,OFFSET game3,40,12,color_white
	INVOKE Create_str ,OFFSET game4,40,13,color_white
	INVOKE Create_str ,OFFSET game5,40,14,color_white
	INVOKE Create_str ,OFFSET game6,40,15,color_white
	INVOKE Create_str ,OFFSET over1,40,16,color_white
	INVOKE Create_str ,OFFSET over2,40,17,color_white
	INVOKE Create_str ,OFFSET over3,40,18,color_white
	INVOKE Create_str ,OFFSET over4,40,19,color_white
	INVOKE Create_str ,OFFSET over5,40,20,color_white
	INVOKE Create_str ,OFFSET over6,40,21,color_white
	ret
Lose ENDP


;生成掉落物================================================================
CreateFalling PROC USES eax ebx ecx edx
	movzx ecx,Count_Fall
	mov edi,0
create_start:
	mov bl,FallCoordY[edi]
	cmp bl,0
	jl not_create
	.IF randVal[edi]==0
		INVOKE Create_str ,OFFSET sun0,FallCoordX[edi],bl,color_yellow
		inc bl
		INVOKE Create_str ,OFFSET sun1,FallCoordX[edi],bl,color_yellow
		inc bl
		INVOKE Create_str ,OFFSET sun2,FallCoordX[edi],bl,color_yellow
		inc bl
		INVOKE Create_str ,OFFSET sun3,FallCoordX[edi],bl,color_yellow
	.ELSE
		INVOKE Create_str ,OFFSET rain0,FallCoordX[edi],bl,color_blue
		inc bl
		INVOKE Create_str ,OFFSET rain1,FallCoordX[edi],bl,color_blue
		inc bl
		INVOKE Create_str ,OFFSET rain2,FallCoordX[edi],bl,color_blue
		inc bl
		INVOKE Create_str ,OFFSET rain3,FallCoordX[edi],bl,color_blue
	.ENDIF
not_create:
	inc edi
	dec ecx
	jne create_start
	ret
CreateFalling ENDP

;清空底部畫面(for掉落物)================================================================
ClearGround PROC USES eax ebx ecx edx
	INVOKE Create_str,OFFSET ClearStr,0,24,color_white
	INVOKE Create_str,OFFSET ClearStr,0,25,color_white
	INVOKE Create_str,OFFSET ClearStr,0,26,color_white
	INVOKE Create_str,OFFSET ClearStr,0,27,color_white
	INVOKE Create_str,OFFSET ClearStr,0,28,color_white
	INVOKE Create_str,OFFSET ClearStr,0,29,color_white
	INVOKE Create_str,OFFSET ClearStr,0,30,color_white	
	INVOKE Create_str,OFFSET ClearStr,0,31,color_white
	INVOKE Create_str,OFFSET ClearStr,0,32,color_white
	INVOKE Create_str,OFFSET ClearStr,0,33,color_white
	ret
ClearGround ENDP

;清掉足跡(for角色)========================================================
ClearBottom PROC USES eax ebx ecx edx
	INVOKE Create_str,OFFSET ClearStr,0,27,color_white
	INVOKE Create_str,OFFSET ClearStr,0,28,color_white	
	INVOKE Create_str,OFFSET ClearStr,0,29,color_white
	INVOKE Create_str,OFFSET ClearStr,0,30,color_white
	INVOKE Create_str,OFFSET ClearStr,0,31,color_white
	INVOKE Create_str,OFFSET ClearStr,0,32,color_white
	INVOKE Create_str,OFFSET ClearStr,0,33,color_white
	INVOKE Create_str,OFFSET ClearStr,0,34,color_white
	ret
ClearBottom ENDP

;顯示分數================================================================
WriteScore PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET ScoreTitle,ScoreCoordX,ScoreCoordY,color_white
	mov dl,ScoreCoordY
	add dl,2
	INVOKE Create_str ,OFFSET ClearScore,ScoreCoordX,dl,color_white
	INVOKE Create_int ,ScoreCoordX,dl,Score
	ret
WriteScore ENDP

;顯示血量================================================================
WriteLive PROC USES eax ebx ecx edx
	INVOKE Create_str ,OFFSET ClearScore,LiveCoordX,LiveCoordY,color_white	;清掉被扣掉的血量
	INVOKE Create_str ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_white
	mov dl,LiveCoordX
	add dl,5
	movzx ecx,LiveCount
	cmp ecx,0
	je no_live
write_all:
	add dl,2
	INVOKE Create_str ,OFFSET Live,dl,LiveCoordY,color_white
	loop write_all
no_live:
	ret
WriteLive ENDP

;畫仙人掌================================================================
CreateCactus PROC USES eax ebx ecx edx,
	pStr1: PTR BYTE, pStr2: PTR BYTE, pStr3: PTR BYTE,
	pStr4: PTR BYTE, pStr5: PTR BYTE, pStr6: PTR BYTE,;字串的POINTER
	Xcoord: BYTE,  ;座標X
	color: DWORD   ;顏色

	INVOKE Create_str ,pStr1,Xcoord,29,color
	INVOKE Create_str ,pStr2,Xcoord,30,color
	INVOKE Create_str ,pStr3,Xcoord,31,color
	INVOKE Create_str ,pStr4,Xcoord,32,color
	INVOKE Create_str ,pStr5,Xcoord,33,color_brown
	INVOKE Create_str ,pStr6,Xcoord,34,color_brown
	ret
CreateCactus ENDP

CreateCactus2 PROC USES eax ebx ecx edx,
	pStr1: PTR BYTE, pStr2: PTR BYTE, pStr3: PTR BYTE, pStr4: PTR BYTE, 
	pStr5: PTR BYTE, pStr6: PTR BYTE, pStr7: PTR BYTE, pStr8: PTR BYTE,;字串的POINTER
	Xcoord: BYTE,  ;座標X
	color: DWORD   ;顏色

	INVOKE Create_str ,pStr1,Xcoord,27,color
	INVOKE Create_str ,pStr2,Xcoord,28,color
	INVOKE Create_str ,pStr3,Xcoord,29,color
	INVOKE Create_str ,pStr4,Xcoord,30,color
	INVOKE Create_str ,pStr5,Xcoord,31,color
	INVOKE Create_str ,pStr6,Xcoord,32,color
	INVOKE Create_str ,pStr7,Xcoord,33,color_brown
	INVOKE Create_str ,pStr8,Xcoord,34,color_brown
	ret
CreateCactus2 ENDP

;移動仙人掌==============================================================
CactusMovement PROC USES eax
	call ReadKey
	.IF dx == 25h && ah == 73h	;if left&ctrl are pressed
		.IF CactusCoordinateX > 2	;移動四個單位
           	dec CactusCoordinateX
			dec CactusCoordinateX
			dec CactusCoordinateX
			dec CactusCoordinateX
		.ENDIF

		.IF CactusLoseLive==1
			mov eax,color_red
			mov CactusLoseLive,0
		.ELSE
			mov eax,color_green
		.ENDIF
		;印出左仙人掌
		.IF level == 1
			INVOKE CreateCactus, OFFSET Cactus_left_1_1,OFFSET Cactus_left_1_2,OFFSET Cactus_left_1_3,OFFSET Cactus_left_1_4,
			OFFSET Cactus_left_1_5,OFFSET Cactus_left_1_6,CactusCoordinateX,eax
		.ELSEIF level == 2
			INVOKE CreateCactus2, OFFSET Cactus_left_2_1,OFFSET Cactus_left_2_2,OFFSET Cactus_left_2_3,OFFSET Cactus_left_2_4,
			OFFSET Cactus_left_2_5,OFFSET Cactus_left_2_6,OFFSET Cactus_left_2_7,OFFSET Cactus_left_2_8,CactusCoordinateX,eax
		.ELSE
			INVOKE CreateCactus2, OFFSET Cactus_left_3_1,OFFSET Cactus_left_3_2,OFFSET Cactus_left_3_3,OFFSET Cactus_left_3_4,
			OFFSET Cactus_left_3_5,OFFSET Cactus_left_3_6,OFFSET Cactus_left_3_7,OFFSET Cactus_left_3_8,CactusCoordinateX,eax			
		.ENDIF
	.ELSEIF dx == 25h 	; if left is pressed
		.IF CactusCoordinateX > 1	;移動兩個單位
           	dec CactusCoordinateX
			dec CactusCoordinateX
		.ENDIF

		.IF CactusLoseLive==1
			mov eax,color_red
			mov CactusLoseLive,0
		.ELSE
			mov eax,color_green
		.ENDIF

		;印出左仙人掌
		.IF level == 1
			INVOKE CreateCactus, OFFSET Cactus_left_1_1,OFFSET Cactus_left_1_2,OFFSET Cactus_left_1_3,OFFSET Cactus_left_1_4,
			OFFSET Cactus_left_1_5,OFFSET Cactus_left_1_6,CactusCoordinateX,eax
		.ELSEIF level == 2
			INVOKE CreateCactus2, OFFSET Cactus_left_2_1,OFFSET Cactus_left_2_2,OFFSET Cactus_left_2_3,OFFSET Cactus_left_2_4,
			OFFSET Cactus_left_2_5,OFFSET Cactus_left_2_6,OFFSET Cactus_left_2_7,OFFSET Cactus_left_2_8,CactusCoordinateX,eax
		.ELSE
			INVOKE CreateCactus2, OFFSET Cactus_left_3_1,OFFSET Cactus_left_3_2,OFFSET Cactus_left_3_3,OFFSET Cactus_left_3_4,
			OFFSET Cactus_left_3_5,OFFSET Cactus_left_3_6,OFFSET Cactus_left_3_7,OFFSET Cactus_left_3_8,CactusCoordinateX,eax			
		.ENDIF
	.ELSEIF dx == 27h && ah == 74h ; if right&ctrl is pressed
		mov dl,BCol
		sub dl,16
		.IF CactusCoordinateX < dl	;移動四個單位
			inc CactusCoordinateX
			inc CactusCoordinateX
            inc CactusCoordinateX
			inc CactusCoordinateX
		.ENDIF

		.IF CactusLoseLive==1
			mov eax,color_red
			mov CactusLoseLive,0
		.ELSE
			mov eax,color_green
		.ENDIF

		;印出右仙人掌
		.IF level == 1
			INVOKE CreateCactus, OFFSET Cactus_right_1_1,OFFSET Cactus_right_1_2,OFFSET Cactus_right_1_3,OFFSET Cactus_right_1_4,
			OFFSET Cactus_right_1_5,OFFSET Cactus_right_1_6,CactusCoordinateX,eax			
		.ELSEIF level == 2
			INVOKE CreateCactus2, OFFSET Cactus_right_2_1,OFFSET Cactus_right_2_2,OFFSET Cactus_right_2_3,OFFSET Cactus_right_2_4,
			OFFSET Cactus_right_2_5,OFFSET Cactus_right_2_6,OFFSET Cactus_right_2_7,OFFSET Cactus_right_2_8,CactusCoordinateX,eax
		.ELSE
			INVOKE CreateCactus2, OFFSET Cactus_right_3_1,OFFSET Cactus_right_3_2,OFFSET Cactus_right_3_3,OFFSET Cactus_right_3_4,
			OFFSET Cactus_right_3_5,OFFSET Cactus_right_3_6,OFFSET Cactus_right_3_7,OFFSET Cactus_right_3_8,CactusCoordinateX,eax			
		.ENDIF
	.ELSEIF  dx == 27h ; if right is pressed
		mov dl,BCol
		sub dl,16
		.IF CactusCoordinateX < dl	;移動兩個單位
			inc CactusCoordinateX
			inc CactusCoordinateX
		.ENDIF

		.IF CactusLoseLive==1
			mov eax,color_red
			mov CactusLoseLive,0
		.ELSE
			mov eax,color_green
		.ENDIF

		;印出右仙人掌
		.IF level == 1
			INVOKE CreateCactus, OFFSET Cactus_right_1_1,OFFSET Cactus_right_1_2,OFFSET Cactus_right_1_3,OFFSET Cactus_right_1_4,
			OFFSET Cactus_right_1_5,OFFSET Cactus_right_1_6,CactusCoordinateX,eax			
		.ELSEIF level == 2
			INVOKE CreateCactus2, OFFSET Cactus_right_2_1,OFFSET Cactus_right_2_2,OFFSET Cactus_right_2_3,OFFSET Cactus_right_2_4,
			OFFSET Cactus_right_2_5,OFFSET Cactus_right_2_6,OFFSET Cactus_right_2_7,OFFSET Cactus_right_2_8,CactusCoordinateX,eax
		.ELSE
			INVOKE CreateCactus2, OFFSET Cactus_right_3_1,OFFSET Cactus_right_3_2,OFFSET Cactus_right_3_3,OFFSET Cactus_right_3_4,
			OFFSET Cactus_right_3_5,OFFSET Cactus_right_3_6,OFFSET Cactus_right_3_7,OFFSET Cactus_right_3_8,CactusCoordinateX,eax			
		.ENDIF
	.ELSE
		.IF CactusLoseLive==1
			mov eax,color_red
			mov CactusLoseLive,0
		.ELSE
			mov eax,color_green
		.ENDIF

		;印出仙人掌
		.IF level ==1
			INVOKE CreateCactus, OFFSET Cactus_mid_1_1,OFFSET Cactus_mid_1_2,OFFSET Cactus_mid_1_3,OFFSET Cactus_mid_1_4,
			OFFSET Cactus_mid_1_5,OFFSET Cactus_mid_1_6,CactusCoordinateX,eax
		.ELSEIF level == 2
			INVOKE CreateCactus2, OFFSET Cactus_mid_2_1,OFFSET Cactus_mid_2_2,OFFSET Cactus_mid_2_3,OFFSET Cactus_mid_2_4,
			OFFSET Cactus_mid_2_5,OFFSET Cactus_mid_2_6,OFFSET Cactus_mid_2_7,OFFSET Cactus_mid_2_8,CactusCoordinateX,eax
		.ELSE
			INVOKE CreateCactus2, OFFSET Cactus_mid_3_1,OFFSET Cactus_mid_3_2,OFFSET Cactus_mid_3_3,OFFSET Cactus_mid_3_4,
			OFFSET Cactus_mid_3_5,OFFSET Cactus_mid_3_6,OFFSET Cactus_mid_3_7,OFFSET Cactus_mid_3_8,CactusCoordinateX,eax
		.ENDIF
	.ENDIF
	ret
CactusMovement ENDP

;更新移動物座標================================================================
updateXY PROC USES eax ebx ecx edx esi edi
	movzx ecx,Count_Fall
	mov edi,0
start:
	inc FallCoordY[edi]	;往下掉1
	mov bl,FallCoordY[edi]
	.IF bl>=BRow		;掉落物掉到邊界，刷新掉落物
		call refresh_fall
	.ENDIF

	;設定掉落物碰撞框
	mov dl,FallCoordX[edi]
	mov FallCollisionX1[edi],dl
	mov FallCollisionX2[edi],dl
	mov dl,Fall_width
	add FallCollisionX2[edi],dl
	
	mov dl,FallCoordY[edi]
	mov FallCollisionY1[edi],dl
	inc FallCollisionY1[edi]
	mov FallCollisionY2[edi],dl
	mov dl,Fall_height
	add FallCollisionY2[edi],dl

	inc edi
	dec ecx
	jne start
	.IF level == 2
		mov CactusCollisionY1,27
	.ENDIF

	.IF level == 3
		mov Cactus_width, 16
	.ENDIF

	;設定仙人掌碰撞框
	mov dl,CactusCoordinateX
	add dl,2
	mov CactusCollisionX1,dl
	add dl,Cactus_width
	mov CactusCollisionX2,dl	
	ret
updateXY ENDP

;碰撞判定================================================================
collision PROC USES EAX EBX ECX EDX
	movzx ecx,Count_Fall
	mov edi,0
start:
	mov dl,FallCollisionX1[edi] 
	mov dh,FallCollisionX2[edi]
	.IF dl <= CactusCollisionX2 && dl >= CactusCollisionX1
		mov dl, FallCollisionY2[edi] 
		.IF dl <= CactusCollisionY2 && dl >= CactusCollisionY1
			.IF randVal[edi] == 0
				add score,500
 				call WriteScore
			.ELSEIF randVal[edi] == 1
				dec LiveCount
				call WriteLive
				mov CactusLoseLive,1
			.ENDIF
			call refresh_fall
			call ClearGround
		.ENDIF
	.ELSEIF dh <= CactusCollisionX2 && dh >= CactusCollisionX1
		mov dh, FallCollisionY2[edi] 
		.IF dh<= CactusCollisionY2 && dh >= CactusCollisionY1
			.IF randVal[edi] == 0
				add score,500
 				call WriteScore
			.ELSEIF randVal[edi] == 1
				dec LiveCount
				call WriteLive
				mov CactusLoseLive,1
			.ENDIF
			call refresh_fall
			call ClearGround
		.ENDIF
	.ENDIF
	inc edi
	dec ecx
	jne start

	ret
collision ENDP

;刷新掉落物=================================
refresh_fall PROC USES eax ebx ecx edx
	mov FallCoordY[edi],-3
	mov  eax,124     		;get random 0 to 123      
	call RandomRange 
       	inc  eax        		 ;make range 1 to 124
       	mov  FallCoordX[edi],al
	call ClearGround
	call Random32
	and al,1b		;只取個位數，隨機生成太陽or雨
	mov randVal[edi],al
	ret
refresh_fall ENDP

;血量剩一閃閃發光===========================
shining PROC USES eax ebx ecx edx
	.IF LiveCount == 1   ;血量剩1
		INVOKE Create_str ,OFFSET ClearScore,LiveCoordX,LiveCoordY,color_white
		.IF LiveShine == 0
			INVOKE Create_str ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_red_magenta
			mov dl,LiveCoordX
			add dl,7
			INVOKE Create_str ,OFFSET Live,dl,LiveCoordY,color_red_magenta
			mov LiveShine,1
		.ELSE
			INVOKE Create_str ,OFFSET LiveTitle,LiveCoordX,LiveCoordY,color_white
			mov dl,LiveCoordX
			add dl,7
			INVOKE Create_str ,OFFSET Live,dl,LiveCoordY,color_white
			mov LiveShine,0
		.ENDIF
	.ENDIF
	ret
shining ENDP

;主程式===================================
main PROC
	call Randomize
Init:			;開始遊戲
	mov bl,0
	call cactus_Start
	call Clrscr
	mov eax, Delay_FPS		;螢幕更新速率
	call delay
	call LevelUP1
	mov eax,LevelUP_FPS
	call delay
	call Clrscr
 	call WriteScore
	call WriteLive
GameStart:			;進入遊戲
	call updateXY
	call collision
	call ClearBottom
	call CreateFalling
	call CactusMovement
	call shining
	cmp LiveCount,0
	je GameOver	
	cmp score,3000	;level up
	je LevelChange1
	cmp score,7000
	je LevelChange2
	cmp score,15000
	je WinGame	;win
	
back_to_game:
    mov eax, Delay_FPS		;螢幕更新速率
	call delay
	jmp GameStart

LevelChange1:
	cmp level,2
	je back_to_game
	inc level
	add Count_Fall,2
	mov bl,0
	mov eax,color_white
	call SetTextColor
	call Clrscr		;清空畫面
	call LevelUP2
	jmp trytry

LevelChange2:
	cmp level,3
	je back_to_game
	inc level
	add Count_Fall,2
	mov bl,0
	mov eax,color_white
	call SetTextColor
	call Clrscr		;清空畫面
	call LevelUP3
	jmp trytry
trytry:
	inc bl
	mov eax,LevelUP_FPS
	call delay
	cmp bl,2
	jne trytry
	call Clrscr
 	call WriteScore
	call WriteLive

	mov edi,0
	mov al,0
	movzx ecx,Count_Fall
reset_position:
	mov FallCoordY[edi],al	;把掉落物移回最高點
	inc edi
	sub al,10
	loop reset_position
	jmp back_to_game

GameOver:
	mov eax,1000
	call delay
	mov eax, color_white
	call Clrscr
	call Lose 
	mov eax,3000
	call delay
	jmp EndGame

WinGame:
	mov eax,1000
	call delay
	mov eax, color_white
	call Clrscr
	mov eax, color_white
	call win
	mov eax,3000
	call delay
	jmp EndGame

EndGame:
	exit
main ENDP
END main