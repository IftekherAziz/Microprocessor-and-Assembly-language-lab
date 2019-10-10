.model small
.stack 100h
.data

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0
    mov cl,4
    mov ah,1
    
    for:
        int 21h
        cmp al,0dh
        je end_for
        
        cmp al,41h
        jge letter
        
    digit:
        sub al,48
        jmp shift
        
    letter:
        sub al,37h
        
    shift:
        shl bx,cl
        or  bl,al
        jmp for
        
    end_for:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        mov cx,4
        mov ah,2
        
    for1:
        mov dl,bh
        shr dl,4
        shl bx,4
    
        cmp dl,10
        jge letter1
        
        add dl,48
        int 21h
        jmp end_for2
        
    letter1:
        add dl,55
        int 21h     
        
    end_for2:
        loop for1
    
    
    
    
    
    
    exit:
        mov ah,4ch
        int 21h
        
        main endp
end main