    LIST	P=16F887
    #INCLUDE <P16F887.INC>
    
; CONFIG1
; __config 0x3FF7
 __CONFIG _CONFIG1, _FOSC_EXTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_ON
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

PUNTERO EQU 0X50
VALOR_C EQU .16
CONTADOR EQU 0X20
 
    ORG 0X00
 
INICIO
    MOVLW VALOR_C
    MOVWF CONTADOR
    MOVLW PUNTERO
    MOVWF FSR
LOOP
    RLF INDF,F
    RLF INDF,F
    INCF FSR,F
    DECFSZ CONTADOR,F
    GOTO LOOP
    SLEEP
    END


