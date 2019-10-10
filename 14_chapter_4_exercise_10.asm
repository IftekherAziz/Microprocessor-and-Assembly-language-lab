.model small
.stack 100h
.data
    msg1 db 'ENTER A HEX DIGIT: $'
    msg2 db 'IN DECIMAL IT IS $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,'1'
    int 21h
    
    sub cl,17
    
    mov ah,2
    mov dl,cl
    int 21h  
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    