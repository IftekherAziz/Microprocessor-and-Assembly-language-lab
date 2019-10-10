.model small
.stack 100h
.data
    msg1 db 'Please type a character: $'
    msg2 db 'Inputed character is: $'
    char db ?
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov char,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,char
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main