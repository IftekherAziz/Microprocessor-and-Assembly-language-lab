                                                                           .model small
.stack 100h
.data
    msg1 db 'Type a character: $'
    msg2 db 'The ascii code of $'
    msg3 db ' in hex is: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    first:
        
        lea dx,msg1
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        mov bl,al
        
        cmp bl,0dh
        je exit
        
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
        
        mov cl,bl
        
        shr bl,4
        
        mov ah,2
        add bl,48
        mov dl,bl
        int 21h
        
        and cl,0fh  ;shl cl,4 ; shr cl,4
        
        cmp cl,10
        jge go
        
        mov ah,2
        add cl,48
        mov dl,cl
        int 21h
        jmp next 
    
    go:
        add cl,55
        mov dl,cl
        int 21h
        
    next:
    mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        jmp first
        
     
    
    exit:
        mov ah,4ch
        int 21h
        main endp
end main