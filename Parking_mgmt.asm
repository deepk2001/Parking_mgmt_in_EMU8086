.model small
.stack 100h
.data
menu db '*****************MENU*********************$'
menu1 db 'Press 1 for Bikes$'
menu2 db 'Press 2 for Cars$'
menu3 db 'Press 3 for Bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 to delete the record$'
menu6 db 'Press 6 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'Car$'
msg4 db 'Bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of Bikes parked=$'
msg10 db 'the total number of Cars parked=$'
msg11 db 'the total number of Buses parked=$'
msg12 db '***Record deleted successfully***$'
amount dw 0
count dw '0'
am1 dw ?
am2 dw ?
am3 dw ?
r dw '0'
c db '0'
b db '0'
.code
main proc
mov ax,@data
mov ds,ax
while_: 
 ;Menu
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu1 ; for menu1
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu2 ;for menu2
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu3 ;for menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu4 ;for menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu5 ;for menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset menu6 ;for menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
;userinput
mov ah,1
int 21h
mov bl,al
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
; compare
mov al,bl
cmp al,'1'
je bike
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_
mov dx,offset msg2 ; if none matches then "wrong input"
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_
bike:
call bikee
car:
call caar
bus:
call buss
rec:
call recrd
del:
call delt
end_:
mov ah,4ch
int 21h
main endp
bikee proc
 cmp count,'8'
 jle bike1
 mov dx,offset msg1
 mov ah,9
 int 21h
 jmp while_
 jmp end_
 
 bike1:
 mov ax,20
 add amount, ax
 mov dx,0 ; remainder is 0
 mov bx,10 
 mov cx,0
 l2:
 div bx
 push dx
 mov dx,0
 mov ah,0
 inc cx
 cmp ax,0
 jne l2
 
 l3:
 pop dx
 add dx,48
 mov ah,2
 int 21h
 loop l3
 
 inc count ;no of vehicle
 
 inc r ;no of bikes
 
 jmp while_
 jmp end_
caar proc
 cmp count,'8'
 jle car1
 mov dx,offset msg1
 mov ah,9
 int 21h
 jmp while_
 jmp end_
 
 car1:
 mov ax,30
 add amount, ax
 mov dx,0
 mov bx,10
 mov cx,0
 l22:
 div bx
 push dx
 mov dx,0
 mov ah,0
 inc cx
 cmp ax,0
 jne l22
 
 l33:
 pop dx
 add dx,48
 mov ah,2
