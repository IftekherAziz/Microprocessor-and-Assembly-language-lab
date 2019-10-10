.model small
.stack 100h
.data
    var db 0
    msg1 db 'TYPE A CHARACTER: $'
    msg2 db 'THE ASCII CODE OF $'
    msg3 db ' IN BINARY IS $'
    msg4 db 'THE NUMBER OF 1 BITS IS $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0
    mov cx,8
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,0ah
    int 21h 
    mov dl,0dh
    int 21h

    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    mov ah,2
    
    again:
        rcl bl,1
        jc outputOne
        
        mov dl,'0'
        int 21h
        jmp last
        
    outputOne:
        mov dl,'1'
        int 21h
        inc var
        
    last:
        loop again
                   
        mov ah,2
        mov dl,0ah
        int 21h 
        mov dl,0dh
        int 21h 
        
        lea dx,msg4
        mov ah,9
        int 21h
        
        add var,48
        mov ah,2
        mov dl,var
        int 21h
        
    exit:
        mov ah,4ch
        int 21h
        main endp
end main