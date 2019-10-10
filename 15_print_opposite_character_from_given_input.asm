.model small
.stack 100h
.data
    msg1 db 'Enter a character: $'
    msg2 db 'In opposite case it is: $'
    msg3 db 'You have inputed wrong $'
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
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    cmp bl,65
    jl wrong
    
    cmp bl,122
    jg wrong
    
    cmp bl,91
    jge check
    jmp next  
    
    
    check:
        cmp bl,96
        jle wrong
        jmp next
    
    
    next:
        lea dx,msg2 
        mov ah,9
        int 21h
        
        cmp bl,97
        jge biyog
        
        
    jug:
        add bl,32
        
        mov ah,2
        mov dl,bl
        int 21h 
        
        jmp exit        
        
        
    biyog:
        sub bl,32
        
        mov ah,2
        mov dl,bl
        int 21h 
        
        jmp exit             
    
    
    wrong:
        lea dx,msg3 
        mov ah,9
        int 21h
         
    
    exit:
        mov ah,4ch
        int 21h
        main endp
end main