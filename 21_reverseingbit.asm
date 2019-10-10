.model small
.stack 100h
.data
    count db 0
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,0   
    mov bx,0
    mov ah,1
    
    input:
        int 21h
        cmp al,0dh
        je reverse
        
        sub al,48
        inc cx
        shl bl,1
        or bl,al
        
        jmp input
 
    reverse:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
            
    output:
        rcr bl,1
        
        jc outputOne
        
        mov dl,'0'
        int 21h
        jmp last
        
    outputOne:
        mov dl,'1'
        int 21h 
        
    last:
        loop output 
    
    exit:
        mov ah,4ch
        int 21h
        main endp
end main