#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program
 

i EQU 0x30
j EQU 0x31
 k EQU 0X32
p EQU 0X33
 
START
    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;hasta aqui apago comparadores
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA ;pongo los puertos de forma de salida
    CLRF PORTB
    CLRF PORTC 
    CLRF PORTD
    CLRF PORTE
INITLCD
    BCF PORTC,0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC,1		;exec EJECUTA MANDO AL PUERTO A1 UN 1
    CALL time
    BCF PORTC,1         ;OFF EJECUTA MANDO AL PUERTO A1 UN 0
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTD
    
    BSF PORTC,1		;exec
    CALL time
    BCF PORTC,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTD
    
    BSF PORTC,1		;exec MODO PULSO
    CALL time
    BCF PORTC,1
    CALL time
        
INICIO	  
   
    BCF PORTC,0		;command mode SI RS(ES 0 COMANDO)
    CALL time
    
    MOVLW 0x80		;LCD position PRIMER RENGLON
    MOVWF PORTD
    CALL exec
    
    BSF PORTC,0		;data mode RS(ES 1 DATOS)
    CALL time 
    ;message1
    
    MOVLW 'B'    ;0
    MOVWF PORTD
    CALL exec
    MOVLW 'I'		
    MOVWF PORTD		;ESPACIO 1
    CALL exec
    MOVLW 'N'		
    MOVWF PORTD		;ESPACIO 2
    CALL exec
    MOVLW 'A'		
    MOVWF PORTD		;ESPACIO 3
    CALL exec
    MOVLW 'R'		
    MOVWF PORTD		;ESPACIO 4
    CALL exec
    MOVLW 'I'
    MOVWF PORTD		;ESPACIO 5	
    CALL exec
    MOVLW 'O'
    MOVWF PORTD		;ESPACIO 6
     CALL exec
    MOVLW ' '
    MOVWF PORTD		;ESPACIO 7
    CALL exec  
;-----------------------------------------------------------------------------------------
;ENTRADA DEL BINARIO
    BTFSC PORTA,7;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,7 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO		
    ;ESPACIO 8
    BTFSC PORTA,6 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,6 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	  
   ;ESPACIO 9
    BTFSC PORTA,5 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,5 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	  
    ;ESPACIO 10
    BTFSC PORTA,4 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,4 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	    
    ;ESPACIO 11
    BTFSC PORTA,3 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,3 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	    
    ;ESPACIO 12
    BTFSC PORTA,2 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,2 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	    
    ;ESPACIO 13
    BTFSC PORTA,1 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,1 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOCERO	    
    ;ESPACIO 14
    BTFSC PORTA,0 ;VE SI A0 ESTA ENCENDIDO 
    CALL MANDOUNO
    BTFSS PORTA,0 ;VE SI A0 ESTA ENCENDIDO
    CALL MANDOCERO	    
   ;ESPACIO 15
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0xC0		;LCD position RENGLON2
    MOVWF PORTD
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTC,0		;data mode
    CALL time
    MOVLW 'H'
    MOVWF PORTD		;ESPACIO 0
    CALL exec 
    MOVLW 'E'
    MOVWF PORTD		;ESPACIO 1
    CALL exec 
    MOVLW 'X'
    MOVWF PORTD		;ESPACIO 2
    CALL exec 
    MOVLW 'A'
    MOVWF PORTD		;ESPACIO 3
    CALL exec 
    MOVLW 'D'
    MOVWF PORTD		;ESPACIO 4
    CALL exec 
    MOVLW 'E'
    MOVWF PORTD		;ESPACIO 5
    CALL exec 
    MOVLW 'C'
    MOVWF PORTD		;ESPACIO 6
    CALL exec 
    MOVLW 'I'
    MOVWF PORTD		;ESPACIO 7
    CALL exec 
    MOVLW 'M'
    MOVWF PORTD		;ESPACIO 8
    CALL exec 
    MOVLW 'A'
    MOVWF PORTD		;ESPACIO 9
    CALL exec 
    MOVLW 'L'
    MOVWF PORTD		;ESPACIO 10
    CALL exec 
    MOVLW ' '
    MOVWF PORTD		;ESPACIO 11
    CALL exec 
;----------------------------------------------------------
   MOVLW '0'
   MOVWF PORTD
   CALL exec
   MOVLW 'x'
   MOVWF PORTD
   CALL exec
   ;----------------------------------------------------------------
    MOVFW PORTA
    MOVWF k
    SWAPF k
    MOVFW k
    ANDLW b'00001111'
    MOVWF k
    MOVFW k
    ADDLW 0x30
    MOVWF PORTD
    BCF STATUS, C
    SUBLW 0x39
    BTFSC STATUS, C
    GOTO $+4
    MOVFW k
    ADDLW 0x37
    MOVWF PORTD 
    CALL exec
   ;-----------------------------------------------------------------------------------------------;
   MOVFW PORTA
   ANDLW b'00001111'
   MOVWF p
   MOVFW p
   ADDLW 0x30
   MOVWF PORTD
   BCF STATUS,C
   SUBLW 0x39
   BTFSC STATUS, C
   GOTO $+4
   MOVFW p
    ADDLW 0x37
    MOVWF PORTD 
    CALL exec 
   ;--------------------------------------------------------
    BCF PORTC,0		;command mode
    CALL time
    
    MOVLW 0x80		;LCD position RENGLON 1
    MOVWF PORTD
    CALL exec
        
    GOTO INICIO

exec

    BSF PORTC,1		;exec R/W(CUANDO ES 1 LEER)
    CALL time
    BCF PORTC,1         ; R/W(CUANDO ES 0 ESCRIBE)
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
MANDOUNO
    MOVLW '1'
    MOVWF PORTD		;ESPACIO N
    CALL exec 
    RETURN
MANDOCERO
    MOVLW '0'
    MOVWF PORTD		;ESPACIO N
    CALL exec 
    RETURN
    END