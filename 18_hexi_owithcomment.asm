.model small
.stack 100h
.data

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0          ;bx take khali korlam
    mov cl,4          ;4 bar bar use korte hobe tai use korlam
    mov ah,1          
    
    for:
        int 21h
        cmp al,0dh    ;check enter or not
        je end_for
        
        cmp al,41h    ;input er valu ke letter ?
        jge letter    ;hay, tahole letter e jaw
        
    digit:
        sub al,48     ;1 je 1 ta bujhlam
        jmp shift     
        
    letter:
        sub al,55    ;A je 10 ta bujhlam
        
    shift:
        shl bx,cl     ;bl er sese 4 ghor 0 dilam
        or  bl,al     ;al take dhukalam
        jmp for       ;abar scan koro
        
    end_for:
        mov ah,2      
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        mov cx,4      ;loop chalanor jonno cx e ekta value kore dilam
        mov ah,2      
        
    for1:
        mov dl,bh     ;samner 8 line take dl e rekhe dilam
        shr dl,4      ;
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