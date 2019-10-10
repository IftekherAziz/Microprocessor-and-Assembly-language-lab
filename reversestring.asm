.model small
.stack 100h
.data
    msg1 db 'Please enter a Stirng: $'
    msg2 db 'Reversed string is:    $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0
    mov cx,0
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    
    input:
        int 21h
        cmp al,0dh
        je  next
        
        inc  cx
        push ax
        
        jmp input
        
    next:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        lea dx,msg2
        mov ah,9
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
        
          