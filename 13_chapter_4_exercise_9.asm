.model small
.stack 100h
.data
    msg1 db 'ENTER THREE INITIALS: $'
    char1 db ?
    char2 db ?
    char3 db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov char1,al
    
    int 21h
    mov char2,al
    
    int 21h
    mov char3,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov dl,char1
    int 21h
    
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov dl,char2
    int 21h
    
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov dl,char3
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
    