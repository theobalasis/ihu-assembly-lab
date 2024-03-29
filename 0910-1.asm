TITLE 0910-1
; (N1+N2)^2 - 2(N3+N4)
; N1, N2, N3, AND N4 ARE SINGLE DIGIT NUMBERS
; THUS THE RESULT IS AT MOST 3 DIGITS WIDE
CODESEG SEGMENT
    ASSUME CS:CODESEG, DS:DATASEG
    START:
        MOV DX, DATASEG ; INITIALIZE DS REGISTER TO POINT TO DATASEG
        MOV DS, DX      ;
        MOV DX, 0       ;
        
        LEA DX, MESSAGE ; PRINT MESSAGE TO STDOUT
        MOV AH, 9       ;
        INT 21H         ;
        
        MOV AL, N1 ; PERFORM EXERCISE COMPUTATION
        ADD AL, N2 ;
        MUL AL     ;
        SUB AL, N3 ;
        SUB AL, N3 ;
        SUB AL, N4 ;
        SUB AL, N4 ;
        
        MOV BL, 100 ; USE BL AS DIVISOR
        DIV BL      ; GET NUMBER'S HUNDREDS
        MOV BH, AH  ; CACHE REMAINDER IN BH
        MOV DL, 48  ; INITIALIZE DL FOR PRINTING NUMERIC CHARACTERS
        ADD DL, AL  ;
        MOV AH, 2   ; PRINT TO STDOUT
        INT 21H     ;
        MOV AH, 0   ; SET AX TO THE REMAINDER OF THE DIVISION
        MOV AL, BH  ;
        
        MOV BL, 10 ; USE BL AS DIVISOR
        DIV BL     ; GET NUMBER'S TENS
        MOV BH, AH ; CACHE REMAINDER IN BH
        MOV DL, 48 ; INITIALIZE DL FOR PRINTING NUMERIC CHARACTERS
        ADD DL, AL ;
        MOV AH, 2  ; PRINT TO STDOUT
        INT 21H    ;
        
        MOV DL, 48 ; INITIALIZE DL FOR PRINTING NUMERIC CHARACTERS
        ADD DL, BH ; LAST REMAINDER IS NUMBER'S UNITS
        INT 21H    ; PRINT TO STDOUT
        
        MOV AH, 4CH ; EXIT PROGRAM
        INT 21H     ;
            
CODESEG ENDS

DATASEG SEGMENT
        
    N1 DB 9
    N2 DB 8
    N3 DB 6
    N4 DB 2
    MESSAGE DB "THE RESULT IS: $"    
    
DATASEG ENDS
    END START