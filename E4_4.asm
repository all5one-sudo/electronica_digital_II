    LIST P=16F887
    #include <p16f887.inc>

	ESTADO EQU 0X20
  
   ORG 0X00
   
    BANKSEL TRISA
    MOVLW b'00010000'
    MOVWF TRISA ;configuro RA4 como entrada
    BANKSEL TRISB
    MOVLW b'00000001'
    MOVWF TRISB ;configuro RB0 como entrada 
    BANKSEL TRISD
    CLRF TRISD ;configuro todo el puerto d como salida 
    BANKSEL ANSEL
    CLRF ANSEL;determino que sea digital
    BANKSEL ANSELH
    CLRF ANSELH;determino que sea digital    

   BANKSEL PORTA
   CLRF ESTADO
LOOP
   BTFSS PORTA,4 
   BCF ESTADO,1	    ; RA4=0
   GOTO UNO
UNO
   BTFSC PORTA,4 
   BSF ESTADO,1	    ; RA4=0
   GOTO P_B
P_B
   BTFSS PORTB,0 
   BCF ESTADO,0	    ; RB0=0
   GOTO UNO_B
UNO_B
   BTFSC PORTA,0 
   BSF ESTADO,0	    ; RB0=1

   MOVF ESTADO,W
   CALL TABLA
   MOVWF PORTD
   GOTO LOOP
    
TABLA
    ADDWF PCL,F
	RETLW 0XAA ; 00
	RETLW 0X55 ; 01
	RETLW 0X0F ; 10
	RETLW 0XF0 ; 11
	
    END
