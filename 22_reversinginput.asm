.model small
.stack 100h
.data

.code
main proc
    mov ax,@data
    mov ds,ax
    
    xor cx,cx
    mov ah,1
    
    input:
        int 21h
        cmp al,0dh
        je exit_input
        push ax
        inc cx
        jmp input
        
    exit_input:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        mov ah,2
        
    output:
        pop dx
        int 21h
        
        loop output
        
    exit:
        mov ah,4ch
        int 21h
        main endp
end main