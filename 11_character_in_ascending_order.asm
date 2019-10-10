.model small
.stack 100h
.data
    msg1 db 'Enter your characters: $'
    msg2 db 'In ascending order: $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
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
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    cmp bl,cl
    jge c
    jmp b
    
    c:
        mov ah,2
        mov dl,cl
        int 21h
        
        mov dl,bl
        int 21h
        jmp exit
        
    b:
        mov ah,2
        mov dl,bl
        int 21h
        
        mov dl,cl
        int 21h
     
    
    
    exit:
        mov ah,4ch
        int 21h
        main endp
end main