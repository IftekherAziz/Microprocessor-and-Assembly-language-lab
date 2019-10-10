.model small
.stack 100h
.data
    msg1 db 'THE SUM OF $'
    msg2 db ' AND $'
    msg3 db ' IS $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    mov dl,'?'
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    int 21h
    mov cl,al
      
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,cl
    int 21h
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    sub bl,48
    sub cl,48
    add bl,cl
    add bl,48
    
    
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    