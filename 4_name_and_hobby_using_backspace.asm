.model small
.stack 100h
.data
    msg1 db 'I am Asif $'
    msg2 db 'I love programming$'
.code

main proc
    
    mov ax,@data
    mov ds,ax
        
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,08h
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h    
         
    mov ah,4ch
    int 21h
    main endp
end main