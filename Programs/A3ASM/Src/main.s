;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                ;Bewege den Wert 0x12 in Register r0
                mov   r0,#0x12                      ; Anw-01
                ;Bewege den Wert -128 in Register r1
                mov   r1,#-128                      ; Anw-02
                ;Lade den Wert 0x12345678 in Register r2
                ldr   r2,=0x12345678                ; Anw-03

; Zugriff auf Variable
                ;Lade die Speicheradresse von VariableA in Register r0
                ldr   r0,=VariableA                 ; Anw-04
                ;Lade den Wert von VariableA in Register r1
                ldrh  r1,[r0]                       ; Anw-05
                ;Lade den Wert von VariableA in Register r2
                ldr   r2,[r0]                       ; Anw-06
                ;Speichere den Wert von Register r2 in VariableC
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07

; Zugriff auf Felder (Speicherzellen)
                ;Lade die Speicheradresse von MeinHalbwortFeld in Register r0
                ldr   r0,=MeinHalbwortFeld          ; Anw-08
                ;Lade den Wert von MeinHalbwortFeld [Element 0] in Register r1
                ldrh  r1,[r0]                       ; Anw-09
                ;Lade den Wert von MeinHalbwortFeld [Element 1] in Register r2
                ldrh  r2,[r0,#2]                    ; Anw-10
                ;Bewege den Wert 10 (a) in Register r3
                mov   r3,#10                        ; Anw-11
                ;Lade den Wert von MeinHalbwortFeld [Element 3] in Register r4
                ldrh  r4,[r0,r3]                    ; Anw-12
                ;Lade den Wert von MeinHalbwortFeld [Element 1] in Register r5 und inkrementiere r0 um 2
                ldrh  r5,[r0,#2]!                   ; Anw-13
                ;Lade den Wert von MeinHalbwortFeld [Element 2] in Register r6 und inkrementiere r0 um 2
                ldrh  r6,[r0,#2]!                   ; Anw-14
                ;Speichere den Wert von Register r6 in MeinHalbwortFeld [Element 2] und inkrementiere r0 um 2
                strh  r6,[r0,#2]!                   ; Anw-15

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ;Lade die Speicheradresse von MeinWortFeld in Register r0
                ldr  r0,=MeinWortFeld               ; Anw-16
                ;Lade den Wert von MeinWortFeld [Element 0] in Register r1
                ldr  r1,[r0]                        ; Anw-17
                ;Lade den Wert von MeinWortFeld [Element 1] in Register r2
                ldr  r2,[r0,#4]                     ; Anw-18
                ;Addiere die Werte in Register r1 und r2 und speichere das Ergebnis in Register r3
                adds r3,r1,r2                       ; Anw-19

                ;Lade den Wert von MeinWortFeld [Element 2] in Register r4
                ldr  r4,[r0,#8]                     ; Anw-20
                ;Lade den Wert von MeinWortFeld [Element 3] in Register r5
                ldr  r5,[r0,#12]                    ; Anw-21
                ;Subtrahiere die Werte in Register r4 und r5 und speichere das Ergebnis in Register r6
                subs r6,r4,r5                       ; Anw-22

                ;Lade den Wert von MeinWortFeld [Element 4] in Register r7
                ldr  r7,[r0,#16]                    ; Anw-23
                ;Lade den Wert von MeinWortFeld [Element 5] in Register r8
                ldr  r8,[r0,#20]                    ; Anw-24
                ;Subtrahiere die Werte in Register r7 und r8 und speichere das Ergebnis in Register r9
                subs r9,r7,r8                       ; Anw-25

forever         b   forever                         ; Anw-26
                ENDP
                END