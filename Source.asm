include Irvine32.inc
include Macros.inc

Buff_Size=255
.data

MenuSize dd 3490
GameScreenSize dd 3490
NameScreenSize dd 1500
;filename db "Gamedata.txt",0
prompt4 db "Enter the File name:",0
filename db Buff_Size dup(?)
filehandle dd 0
bytesWritten  dd 0
prompt1 BYTE "Enter your name: ", 0
prompt2 byte "Your Level:",0
prompt3 byte "Your Score:",0





    nameStr DB 255 Dup (?)
    

menu  BYTE "------------------------------------------------------------------------------------------------------------------------"
      BYTE "|                                                                                                                      |"
      BYTE "| QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ                                                             |"
      BYTE "| QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ   IIIII  I   I IIII IIIII IIII I  I IIII IIIII        I     |"
      BYTE "| QQ                                                    QQ     I    II  I I      I   I  I I  I I      I    I           |"
      BYTE "| QQ  QQQQQQQQQQQQQQQ  QQQQQQQQQ  QQQQQQQQQ  QQQ   QQQ  QQ     I    I I I IIII   I   IIII I  I I      I          I     |"
      BYTE "| QQ  QQQQQQQQQQQQQQQ  QQQQQQQQQ  QQQQQQQQQ  QQQ   QQQ  QQ     I    I  II    I   I   I I  I  I I      I    I     I     |"
      BYTE "| QQ  QQQQQQQQQQQQQQQ  QQQQQQQQQ  QQQQQQQQQ  QQQ   QQQ  QQ   IIIII  I   I IIII   I   I  I IIII IIII   I          I     |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQ        QQQ   QQQ  QQQ   QQQ  QQ                                                             |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQ        QQQ   QQQ  QQQ   QQQ  QQ   SSSSS SSSSS SSSSS SSSSS SSSSS                       SSSS  |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQ   QQQ  QQ   S       S   S   S S   S   S                   S     S     |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQ   QQQ  QQ   SSSSS   S   SSSSS SSSSS   S                         SSSS  |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQ   QQQ  QQ       S   S   S   S S  S    S                   S        S  |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQ        QQQ   QQQ  QQQ   QQQ  QQ   SSSSS   S   S   S S   S   S                         SSSS  |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQ        QQQ   QQQ  QQQ   QQQ  QQ                                                             |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQQQQQQQ  QQ   EEEEE E    E EEEEE EEEEE                            EEEEE |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQQQQQQQ  QQ   E      E  E    E     E                         E    E   E |"
      BYTE "| QQ  QQQ   QQQ   QQQ  QQQQQQQQQ  QQQ   QQQ  QQQQQQQQQ  QQ   EEE     EE     E     E                              EEEEE |"
      BYTE "| QQ                                                    QQ   E      E  E    E     E                         E    E     |"
      BYTE "| QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ   EEEEE E    E EEEEE   E                              EEEEE |"
      BYTE "| QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ                                                             |"
      BYTE "|                                                            WWWWW WWWWW WWWWW W    W WWWWWWW WWWWWW             WWWW  |"
      BYTE "|                                                            W   W W     W     W    W W  W  W W             W    W   W |"
      BYTE "|                                                            WWWW  WWW   WWWWW W    W W  W  W WWWW               W     |"
      BYTE "|                                                            W  W  W         W W    W W     W W             W    W     |"
      BYTE "|                                                            W   W WWWWW WWWWW WWWWWW W     W WWWWWW             W     |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "------------------------------------------------------------------------------------------------------------------------",0


  GameScreen  BYTE "WRRRRRRRRRRRRRRRRRRQQQQQQQQQQQQQQQQQQQQQQQ|||||||||||||||||||||||||||||||MMMMMMMMMMMMMMMMMMMMMMMMMMMMMGGGGGGGGGGGW"
              BYTE "WRRRRRRRRRRRRRRRRRRQQQQQQQQQQQQQQQQQQQQQQQ|||||||||||||||||||||||||||||||MMMMMMMMMMMMMMMMMMMMMMMMMMMMMGGGGGGGGGGGGGGGGGW"
              BYTE "WRRRRRRRRRRRRRRRRRRQQQQQQQQQQQQQQQQQQQQQQQ|||||||||||||||||||||||||||||||MMMMMMMMMMMMMMMMMMMMMMMMMMMMMGGGGGGGGGGGGGGGGGW"
              BYTE "WRRRRRRWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWGGGGGGGW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW             MMMMMMMMMMMMM         BB     BB       MMM   MMM      BBBBBBBB      BBBBBB               WWGGGGGGGW"
              BYTE "WMMMMMMWW                       MM          BB     BB       MMMM MMMM      BB    BB     BBB  BBB              WWGGGGGGGW"
              BYTE "WMMMMMMWW                     MM            BB     BB       MM MMM MM      BB    BB     BBB  BBB              WWGGGGGGGW"
              BYTE "WMMMMMMWW                   MM              BB     BB       MM     MM      BB    BB     BBB  BIB              WWQQQQQQQW"
              BYTE "WMMMMMMWW                 MM                BB     BB       MM     MM      BBBBBBBB     BBBBBBBB              WWQQQQQQQW"
              BYTE "WMMMMMMWW               MM                  BB     BB       MM     MM      BB    BB     BB    BB              WWQQQQQQQW"
              BYTE "WMMMMMMWW             MM                    BB     BB       MM     MM      BB    BB     BB    BB              WWQQQQQQQW"
              BYTE "WMMMMMMWW            MMMMMMMMMMMMMM         BBBBBBBBB       MM     MM      BBBBBBBB     BB    BB              WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WMMMMMMWW                                                                                                     WWQQQQQQQW"
              BYTE "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
              BYTE "WRRRRRRRRRRRRRRRRRRQQQQQQQQQQQQQQQQQQQQQQQ|||||||||||||||||||||||||||||||MMMMMMMMMMMMMMMMMMMMMMMMMMMMMGGGGGGGGGGGGGGGGGW", 0

      
      


      GameOverScreen   BYTE 0ah,"------------------------------------------------------------------------------------------------------------------------"
      BYTE "|WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                   =222222   22222  222    222 2222222      222222  22    22 2222222 222222                         W|"
      BYTE "|W                  =22       22   22 2222  2222 22          22    22 22    22 22      22   22                        W|"
      BYTE "|W                  =22   222 2222222 22 2222 22 22222       22    22 22    22 22222   222222                         W|"
     BYTE  "|W                  =22    22 22   22 22  22  22 22          22    22  22  22  22      22   22                        W|"
      BYTE "|w                   =222222  22   22 22      22 2222222      222222    2222   2222222 22   22                        W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|W                                                                                                                    W|"
      BYTE "|WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW|"
      BYTE "------------------------------------------------------------------------------------------------------------------------",0


      NameScreen BYTE "------------------------------------------------------------------------------------------------------------------------"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                   w   w wwwww wwwwwww       wwwww  wwwww wwwww wwwww w     w WWWWW W   W                             |"
      BYTE "|                   ww  w w   w w  w  w       w    w w   w   w   w   w  w   w  W     WW  W                             |"
      BYTE "|                   w w w wwwww w  w  w       wwwww  wwwww   w   wwwww   www   WWW   W W W                             |"
      BYTE "|                   w  ww w   w w     w       w    w w   w   w   w   w    w    W     W  WW                             |"
      BYTE "|                   w   w w   w w     w       wwwww  w   w   w   w   w    w    WWWWW W   W                             |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||",0
       
        

      
InstructionScreen BYTE "------------------------------------------------------------------------------------------------------------------------"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                   PPPPP P   P PPPPP PPPPP PPPPP  P    P PPPPP PPPPP PPPPP PPPPP P   P PPPPP                          |"
      BYTE "|                     P   PP  P P       P   P    P P    P P       P     P   P   P PP  P P                              |"
      BYTE "|                     P   P P P PPPPP   P   PPPPP  P    P P       P     P   P   P P P P PPPPP                          |"
      BYTE "|                     P   P  PP     P   P   P  P   P    P P       P     P   P   P P  PP     P                          |"
      BYTE "|                   PPPPP P   P PPPPP   P   P   P  PPPPPP PPPPP   P   PPPPP PPPPP P   P PPPPP                          |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "|                                                                                                                      |"
      BYTE "------------------------------------------------------------------------------------------------------------------------",0

instrs1 db "1. Match 3 or more same-colored balls to clear them before they reach the end of the path.",0 
instrs2 db "2. Balls move along a fixed winding path and a launcher fires balls into the chain.",0   
instrs3 db "3. Earn points for matches and combos.",0
instrs4 db "4. If the balls reach the end, the game ends and clear balls faster or slow down the chain.",0
instrs5 db "5. Press Any Key to Go Back to Menu Screen ",0  
     
;Resume game screen layout


  Resume BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|   __________      _________    _________                            _______ |", 0
          BYTE "|  ||        ||    ||           ||          ||         || |\      /| |        |", 0
          BYTE "|  ||        ||    ||           ||          ||         || | \    / | |        |", 0
          BYTE "|  ||        ||    ||           ||          ||         || |  \  /  | |        |", 0
          BYTE "|  ||________||    ||________   ||________  ||         || |   \/   | |_______ |", 0
          BYTE "|  ||       \\     ||                    || ||         || |        | |        |", 0
          BYTE "|  ||        \\    ||                    || ||         || |        | |        |", 0
          BYTE "|  ||         \\   ||                    || ||         || |        | |        |", 0
          BYTE "|  ||          \\  ||                    || ||         || |        | |        |", 0
          BYTE "|  ||           \\ ||_________  _________|| ||_________|| |        | |_______ |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0

 ; Level #1 layout

    walls BYTE " _____________________________________________________________________________ ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|---------------------------------------------    ------------------:         |", 0
          BYTE "|---------------------------------------------|  |----------------  |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                    ---      |  |                | |         |", 0
          BYTE "|                                   |   |     |  |                | |         |", 0
          BYTE "|                                   |   |     |  |                | |         |", 0
          BYTE "|                                   |   |     |  |                | |         |", 0
          BYTE "|                                    ---      |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|                                             |  |                | |         |", 0
          BYTE "|---------------------------------------------    ----------------  |         |", 0
          BYTE "|-------------------------------------------------------------------:         |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|_____________________________________________________________________________|", 0


    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

    ; Player's starting position (center)
    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)

    xDir db 0
    yDir db 0

    ; Default character (initial direction)
    inputChar db 0
    direction db "d"

    ; Colors for the emitter and player
    color_red db 4       ; Red
    color_green db 2     ; Green
    color_yellow db 14   ; Yellow (for fire symbol)

    current_color db 4   ; Default player color (red)

    emitter_color1 db 2  ; Green
    emitter_color2 db 4  ; Red

    fire_color db 14     ; Fire symbol color (Yellow)

    ; Emitter properties
    emitter_symbol db "#"
    emitter_row db 8    ; Two rows above player (fixed row for emitter)
    emitter_col db 20    ; Starting column of the emitter

    ; Fire symbol properties (fired from player)
    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic

    ; Interface variables
    score db 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0


;________________________________________________________________________


  





;------------------------------------------------------------------------------------------>
    ; Score variable
    score1 DWORD 0 ; Initialize the score

    ; Remove character
   ; remove BYTE ' ' ; Character used to erase bricks

   ;--------------------------------------------------------------------------------------->lives

   livingonce db "1",0
   livingtwice  db  "2",0
   livingthrice db "3",0
   livingend   db    "0",0
   ;----------------------------------------->

   gamekhatam db "GAME OVER",0


   ;------------------------------------------>

   scoreLabel BYTE "Score: ", 0 ; Label for the score display
   ;---------------------------------------------------------------------->





 ; Path coordinates array (x,y pairs representing the path)
     pathCoords WORD 20,7                                             
              WORD 21,7, 22,7, 23,7, 24,7, 25,7                      
              WORD 26,7, 27,7, 28,7, 29,7, 30,7                     
              WORD 31,7, 32,7, 33,7, 34,7, 35,7                 
              WORD 36,7, 37,7, 38,7, 39,7, 40,7                 
              WORD 41,7, 42,7, 43,7, 44,7, 45,7                 
              WORD 46,7, 47,7, 48,7, 49,7, 50,7                 
              WORD 51,7, 52,7, 53,7, 54,7, 55,7                 
              WORD 56,7, 57,7, 58,7, 59,7, 60,7                 
              WORD 61,7, 62,7, 63,7, 64,7, 65,7                 
              WORD 66,23, 67,7, 68,7, 69,7, 70,7                 
              WORD 71,7, 72,7, 73,7, 74,7, 75,7                 
              WORD 76,7, 77,7, 78,7, 79,7, 80,7                 
              WORD 81,7, 82,7, 83,7, 84,7, 85,7                 
              WORD 85,7, 85,8, 85,9, 85,10, 85,11
              WORD 85,12, 85,13, 85,14, 85,15, 85,16
              WORD 85,17, 85,18, 85,19, 85,20, 85,21
              WORD 85,22, 85,23, 85,24
              WORD 84,24, 83,24, 82,24, 81,24 ,80,24
              WORD 79,24, 78,24, 77,24, 76,24, 75,24
              WORD 74,24, 73,24, 72,24, 71,24, 70,24
              WORD 69,24, 68,24, 67,24, 66,24, 65,24
              WORD 64,24, 63,24, 62,24, 61,24, 60,24
              WORD 59,24, 58,24, 57,24, 56,24, 55,24
              WORD 53,24, 52,24, 51,24
               WORD 50,24, 49,24, 48,24, 47,24, 46,24
               WORD 45,24, 44,24, 43,24, 42,24, 41,24
               WORD 40,24, 39,24, 38,24, 37,24, 36,24
               WORD 35,24, 34,24, 33,24, 32,24, 31,24
               WORD 30,24, 29,24, 28,24, 27,24, 26,24
               WORD 25,24, 24,24, 23,24, 22,24, 21,24
               WORD 50,24, 49,24, 48,24, 47,24, 46,24
               WORD 45,24, 44,24, 43,24, 42,24, 41,24
               WORD 40,24, 39,24, 38,24, 37,24, 36,24
               WORD 35,24, 34,24, 33,24, 32,24, 31,24
               WORD 30,24, 29,24, 28,24, 27,24, 26,24
               WORD 25,24, 24,24, 23,24, 22,24, 21,24
               WORD 55,24, 54,24, 53,24, 52,24, 51,24
               WORD 50,24, 49,24, 48,24, 47,24, 46,24
               WORD 45,24, 44,24, 43,24, 42,24, 41,24
               WORD 40,24, 39,24, 38,24, 37,24, 36,24
               WORD 35,24, 34,24, 33,24, 32,24, 31,24
               WORD 30,24, 29,24, 28,24, 27,24, 26,24
               WORD 25,24, 24,24, 23,24, 22,24, 21,24 
               


    pathLength = ($ - pathCoords) / 4 
    
    currentBall STRUCT
        xPos BYTE ?
        yPos BYTE ?
        color BYTE ?
        active BYTE ?    ; 1 if ball is active, 0 if not
pathIndex BYTE ? 
    currentBall ENDS

    ; Array of balls (max 50 balls)
    MAX_BALLS = 50
    balls currentBall MAX_BALLS DUP(<>)
    activeBalls BYTE 0   ; Counter for active balls
    
    ballDelay DWORD 10   ; Delay between ball movements (ms)
    spawnDelay DWORD 10 ; Delay between new ball spawns (ms)
    lastSpawnTime DWORD 0
    
    ;pathIndex BYTE 0     ; Current position in path





.code
FireBall PROC
    ; Fire a projectile from the player's current face direction

    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 20            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mWrite "*"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 50
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
        mov dx, 0
        call GoToXY

    ret
FireBall ENDP

DrawWall PROC
;	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
	mWrite <"Score: ">
	mov eax, Blue + (black * 16)
	call SetTextColor
	mov al, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, Red + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy

	mov esi, offset walls

	mov counter1, 50
	mov counter2, 80
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow
		
        dec counter1
		movzx ecx, counter1

		mov dl, 19
		inc dh
		call Gotoxy
	loop printcolumn

	ret
DrawWall ENDP

PrintPlayer PROC
    mov eax, brown + (black * 16)
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    
ret
PrintPlayer ENDP

MovePlayer PROC
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move

    ; if character is invalid, check for a new keypress
    jmp checkInput

    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    paused:
        ; call your pause menu here... once you make it. for now, this will exit the game.
        ret
        
    shoot:
        call FireBall

    chosen:
           call MoveBalls
        call PrintPlayer
       call MovePlayer

    ret
MovePlayer ENDP

InitialiseScreen PROC
    ; Draw the level layout at the start
    call DrawWall

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen ENDP

main PROC
call Randomize
call DrawGameScreen

SPLASHSCRN:
		call ReadKey
		cmp eax, 1
		jne MenuDisplay
		mov eax, 10
		call Delay
		jmp SPLASHSCRN
 


 MenuDisplay:
    call clrscr
    call DrawMenu
    mov eax , 0
    call ReadChar
    cmp al , 's'
    jz StartGame
  
    cmp al , 'i'
    je InstructionsDisplay
    
    cmp al, 'e'
    jz Exit1

    jmp Exit1


 
InstructionsDisplay:
    mov eax, 0
    mov edx ,0
    mov ecx,0
    mov ebx,0
    call clrscr
    call DrawInstructionScreen 
    mov eax, white (black*16)
    call SetTextColor
    mov dh, 12
    mov dl , 0
    call Gotoxy
    mov edx, offset instrs1
    call WriteString
    call crlf
     mov edx, offset instrs2
    call WriteString
    call crlf
     mov edx, offset instrs3
    call WriteString
    call crlf
     mov edx, offset instrs4
    call WriteString
    call crlf
    mov dh, 20
    mov dl , 39
    call Gotoxy
    mov edx, offset instrs5
    call WriteString
 
    mov eax , 0
    mov edx ,0
    call ReadChar
    cmp al , 'e'
    jmp MenuDisplay

  StartGame:
  call clrscr
    mov eax, 0
    mov dh, 12
    mov dl , 0
    call Gotoxy


    mov eax , blue + (white *16)
    call SetTextColor

    mov edx, offset prompt4
    call writestring

    ;setting name colour
    mov eax ,0
    mov eax , brown (black *16)
    call SetTextColor

    mov edx, offset filename
    mov ecx , Buff_Size
    call readstring

    mov edx, offset filename
    call CreateOutputFile
    mov filehandle, eax

    mov eax , blue + (white *16)
    call SetTextColor

    ;printing coloured prompt1
    mov edx, offset prompt1
    call WriteString

    ;setting name colour
    mov eax ,0
    mov eax , brown (black *16)
    call SetTextColor

    ;Taking the name in the string
    mov ecx , 255
    mov edx, offset nameStr
    call Readstring

    ;Creating File 
    mov edx, offset filename
    call CreateOutputFile
    mov filehandle, eax

  show_error_Msg:
   mov eax, filehandle
   mov ecx , Buff_Size
   mov edx, offset nameStr
   call WriteToFile
   jc show_error_Msg
   mov bytesWritten, eax

   mov eax , filehandle
   call closefile
   call clrscr
   mov eax, white + (black*16)
   call setTextColor
   ; Initialize screen and emitter
    call InitialiseScreen

    ; Call Player Cannon movement function(this function is recursive, and will repeat until the game is either won or lost)
    call GameLoop

;call level1
; mov eax, 21
;    cmp eax, score
;    je Level2

;    call DrawGameOver

;    Level2:
;    call clrscr
;    call DrawMenu

;call clrscr
;call level2
;call clrscr
;call level3
   



    Exit1:
call clrscr
mov dl, 0
mov dh ,0
call Gotoxy
call DrawGameOver

mov dl , 20
mov dh, 20
call Gotoxy
mov edx, offset prompt2
call writestring

mov dl , 90
mov dh, 20
call Gotoxy
mov edx,0
mov edx, offset prompt3
call writestring

main ENDP

DrawWhatYouSee PROC
   
   cmp al , '2'
   je SETRED


   cmp al, 'E'
    je SETRED

	cmp al, 'S'
    je SETGREEN

	cmp al, 'M'
    je SETMAGENTA

    cmp al, 'T'
    je SETMAGENTA

	cmp al, "G"
	je SETGREEN

	cmp al, "Q"
	je SETYELLOW

	cmp al, "|"
	je SETCYAN

	cmp al, "-"
	je SETCYAN

	cmp al, "_"
	je SETMAGENTA

	cmp al, "I"
	je SETMAGENTA
	
    cmp al, "R"
    je SETRED

    cmp al, "W"
	je SETWHITE

    cmp al, "P"
	je SETBROWN

    cmp al, "B"
	je SETWHITE

	cmp al, 0
	je CARRIAGERETURNPLS

	cmp al, " "
	je PRINTSPACEPLS


	PRINTSPACEPLS :
		mov eax, black 
		call SetTextColor
		jmp KEEPDRAWING

	SETYELLOW :
		mov eax, yellow + (yellow*16)
	    call SetTextColor
		jmp KEEPDRAWING

	SETCYAN :
		mov eax, cyan + (cyan*16)
		call SetTextColor
		jmp KEEPDRAWING

     SETGRAY :
		mov eax, gray + (gray*16) 
		call SetTextColor
		jmp KEEPDRAWING

	SETRED :
		mov eax, red + (red*16)
		call SetTextColor
		jmp KEEPDRAWING

	SETMAGENTA :
		mov eax, magenta +(magenta*16)
		call SetTextColor
		jmp KEEPDRAWING

	SETGREEN :
		mov eax, 10 (10*16)
		call SetTextColor
		jmp KEEPDRAWING
	
	SETWHITE :
		mov eax, 15 (15*16)
		call SetTextColor
		jmp KEEPDRAWING

      SETBROWN :
		mov eax, brown (brown*16)
		call SetTextColor
		jmp KEEPDRAWING

    SETLIGHTBLUE :
		mov eax, lightblue + (lightblue*16)
		call SetTextColor
		jmp KEEPDRAWING

    SETLIGHTGREEN :
		mov eax, lightgreen +(lightgreen*16)
		call SetTextColor
		jmp KEEPDRAWING



	
	CARRIAGERETURNPLS :
		
        
		mov eax, black 
		call SetTextColor
       

	KEEPDRAWING :

		ret

DrawWhatYouSee ENDP

DrawInstructionScreen PROC uses eax

mov ecx, GameScreenSize
mov esi, OFFSET InstructionScreen

DRAWSPLASHLOOP:
	mov eax, 0
	mov al, [esi]

	call DrawWhatYouSee
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP

	mov eax, black
    call SetTextColor	; reset text color
	
	ret

DrawInstructionScreen ENDP


DrawGameOver PROC uses eax

mov ecx, GameScreenSize
mov esi, OFFSET GameOverScreen

DRAWSPLASHLOOP:
	mov eax, 0
	mov al, [esi]

	call DrawWhatYouSee
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP

	mov eax, white (black*16)
    call SetTextColor	; reset text color
	
	ret

DrawGameOver ENDP


DrawNameScreen PROC uses eax

mov ecx, NameScreenSize
mov esi, OFFSET NameScreen

DRAWSPLASHLOOP:
	mov eax, 0
	mov al, [esi]

	call DrawWhatYouSee
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP

	mov eax, black
    call SetTextColor	; reset text color
	
	ret

DrawNameScreen ENDP


DrawGameScreen PROC uses eax

mov ecx, GameScreenSize
mov esi, OFFSET GameScreen

DRAWSPLASHLOOP:
	mov eax, 0
	mov al, [esi]

	call DrawWhatYouSee
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP

	mov eax, black
    call SetTextColor	; reset text color
	 
	ret

DrawGameScreen ENDP


;------------------------------------------------
;------------------------------------------------
;------------------------------------------------
;------------------------------------------------
;------------------------------------------------
;------------------------------------------------Game loop

GameLoop PROC
    ; Initialize the game state
    call InitialiseScreen
    
GameLoopStart:
    ; Check for exit condition (ESC key)
    mov eax, 50  ; Small delay to prevent CPU hogging
    call Delay
    
    ; Non-blocking key check
    call ReadKey
    jz NoKeyPressed    ; Jump if no key was pressed
    
    cmp al, VK_ESCAPE
    je ExitGameLoop
    
    ; Handle player input if a key was pressed
    mov inputChar, al
    
    cmp inputChar, VK_SPACE
    je shoot
    
    ; Update player direction based on input
    cmp al, "w"
    je update_direction
    cmp al, "a"
    je update_direction
    cmp al, "s"
    je update_direction
    cmp al, "d"
    je update_direction
    cmp al, "q"
    je update_direction
    cmp al, "e"
    je update_direction
    cmp al, "z"
    je update_direction
    cmp al, "c"
    je update_direction
    jmp NoKeyPressed
    
update_direction:
    mov direction, al
    jmp NoKeyPressed
    
shoot:
    call FireBall
    
NoKeyPressed:
    ; Move balls regardless of player input
    call MoveBalls
    
    ; Update screen (including player)
    call UpdateScreen
    
    ; Continue loop
    jmp GameLoopStart
    
ExitGameLoop:
    ret
GameLoop ENDP

UpdateScreen PROC
    pushad
    
    ; Update score/lives/level info without clearing screen
    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    mov dl,90
    mov dh,2
    call Gotoxy
    mWrite <"Lives: ">
    mov eax, Red + (black * 16)
    call SetTextColor
    mov al, lives
    call WriteDec
    
    ; Draw the player
    call PrintPlayer
    
    ; Draw all active balls
    mov esi, OFFSET balls
    xor ecx, ecx
    
DrawBallsLoop:
    cmp ecx, MAX_BALLS
    jge DoneDrawing
    
    cmp (currentBall PTR [esi]).active, 0
    je NextBall
    
    mov dl, (currentBall PTR [esi]).xPos
    mov dh, (currentBall PTR [esi]).yPos
    call Gotoxy
    
    movzx eax, (currentBall PTR [esi]).color
    call SetTextColor
    mov al, 'O'
    call WriteChar
    
NextBall:
    add esi, TYPE currentBall
    inc ecx
    jmp DrawBallsLoop
    
DoneDrawing:
    mov eax, white + (black * 16)
    call SetTextColor
    
    popad
    ret
UpdateScreen ENDP



;---------------------------------------
;---------------------------------------
;---------------------------------------
;---------------------------------------
;---------------------------------------
;---------------------------------------changes done 



DrawMenu PROC uses eax

mov ecx, MenuSize
mov esi, OFFSET menu

DRAWSPLASHLOOP:
	mov eax, 0
	mov al, [esi]

	call DrawWhatYouSee
	mov eax, 0
	mov al, [esi]
	call WriteChar
	inc esi
	loop DRAWSPLASHLOOP

	mov eax, black
    call SetTextColor	; reset text color
	
	ret

DrawMenu ENDP






 ; i have not called these functions. try to understand them before implementing them. these functions are untouched by me(i think).
update_emitter PROC
    ; Update the emitter symbols to animate the line
    push ax
    push cx
    push dx

    mov cx, 80           ; Number of columns (console width)
    mov dl, emitter_col
    mov dh, emitter_row

    ; Redraw emitter with updated colors
emitter_update_loop:
    ; Alternate emitter colors between green and red
    cmp al, emitter_color1
    jne set_green_color
    mov al, emitter_color2
    jmp draw_symbol

set_green_color:
    mov al, emitter_color1

draw_symbol:
    mov al, emitter_symbol
    call Gotoxy
    call WriteChar

    inc dl               ; Move to the next column
    cmp dl, 80           ; Wrap around at the end of the row
    jne emitter_update_loop
    mov dl, emitter_col  ; Reset column

    pop dx
    pop cx
    pop ax
    ret
update_emitter ENDP

; i have not called this function
draw_emitter PROC
    ; Draw the emitter with alternating colors
    push ax
    push cx
    push dx

    mov cx, 50          ; Number of columns (console width)
    mov dl, emitter_col
    mov dh, emitter_row

emitter_loop:
    ; Alternate emitter colors between green and red
    mov al, emitter_color1
    call SetTextColor

    mov al, emitter_symbol
    call Gotoxy
    call WriteChar

    ; Toggle color for the next symbol
    cmp al, emitter_color1
    jne set_green
    mov al, emitter_color2
    jmp next_symbol

set_green:
    mov al, emitter_color1

next_symbol:
;call update_emitter
    inc dl               ; Move to the next column
    cmp dl, 50          ; Wrap around at the end of the row
    jne emitter_loop
    mov dl, emitter_col  ; Reset column

    pop dx
    pop cx
    pop ax
     call MoveBalls
    ret
draw_emitter ENDP



MoveBalls PROC
    pushad
    
    ; Check if it's time to spawn a new ball
    call GetTickCount
    sub eax, lastSpawnTime
    cmp eax, spawnDelay
    jl check_existing_balls
    
    ; Spawn new ball if we haven't reached maximum
    movzx eax, activeBalls
    cmp eax, MAX_BALLS
    jge check_existing_balls
    
    ; Initialize new ball
    mov esi, offset balls
    movzx eax, activeBalls
    imul eax, TYPE currentBall
    add esi, eax
    
    ; Set initial position (start of path)
    movzx eax, WORD PTR pathCoords[0]    ; First X coordinate
    mov (currentBall PTR [esi]).xPos, al
    movzx eax, WORD PTR pathCoords[2]    ; First Y coordinate
    mov (currentBall PTR [esi]).yPos, al
    
    mov (currentBall PTR [esi]).pathIndex, 0
    mov (currentBall PTR [esi]).active, 1
    
    ; Set random color (1-4)
    mov eax, 4
    call RandomRange
    inc eax
    mov (currentBall PTR [esi]).color, al
    
    inc activeBalls
    call GetTickCount
    mov lastSpawnTime, eax
    
check_existing_balls:
    xor ecx, ecx
    mov esi, offset balls

move_ball_loop:
    cmp ecx, MAX_BALLS
    jge done_moving
    
    cmp (currentBall PTR [esi]).active, 0
    je next_ball
    
    ; Get current path index
    movzx eax, (currentBall PTR [esi]).pathIndex
    mov ebx, 4          ; Each point is 4 bytes (2 WORDs)
    mul ebx
    
    ; Get target coordinates from path
    movzx ebx, WORD PTR pathCoords[eax]     ; Target X
    movzx edx, WORD PTR pathCoords[eax + 2]  ; Target Y
    
    ; Clear old position
    push eax
    push ebx
    push edx
    mov dl, (currentBall PTR [esi]).xPos
    mov dh, (currentBall PTR [esi]).yPos
    call Gotoxy
    mov al, ' '
    call WriteChar
    pop edx
    pop ebx
    pop eax
    
    ; Move toward target
    mov al, (currentBall PTR [esi]).xPos
    cmp al, bl
    je check_y_pos
    jl inc_x_pos
    dec al
    jmp update_x_pos
inc_x_pos:
    inc al
update_x_pos:
    mov (currentBall PTR [esi]).xPos, al
    
check_y_pos:
    mov al, (currentBall PTR [esi]).yPos
    cmp al, dl
    je at_target
    jl inc_y_pos
    dec al
    jmp update_y_pos
inc_y_pos:
    inc al
update_y_pos:
    mov (currentBall PTR [esi]).yPos, al
    
    ; Draw ball at new position
    mov dl, (currentBall PTR [esi]).xPos
    mov dh, (currentBall PTR [esi]).yPos
    call Gotoxy
    movzx eax, (currentBall PTR [esi]).color
    call SetTextColor
    mov al, 'O'
    call WriteChar
    jmp next_ball
    
at_target:
    ; Move to next path point
    inc (currentBall PTR [esi]).pathIndex
    movzx eax, (currentBall PTR [esi]).pathIndex
    cmp eax, pathLength
    jge deactivate_ball
    jmp next_ball
    
deactivate_ball:
    mov (currentBall PTR [esi]).active, 0
    dec activeBalls
    
next_ball:
    add esi, TYPE currentBall
    inc ecx
    jmp move_ball_loop
    
done_moving:
    mov eax, ballDelay
    call Delay
    popad
    ret
MoveBalls ENDP
 end main