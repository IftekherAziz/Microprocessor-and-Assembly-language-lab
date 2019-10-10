.model small
.stack 100h
.data
    msg1 db 'Enter a binary number (max 16 bit): $'
    msg2 db 'Inputed binary number is: $'
    msg3 db 'N.B.You have inputed wrong digit. Please input binary number$'
    msg4 db 'Do you want to try agian?$'
    msg5 db 'For yes press y/Y | For exit press any other key$'
    count db 0 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    first:
        
        mov ah,00
        mov al,02
        int 10h
        
        lea dx,msg1
        mov ah,9
        int 21h
        
        mov bx,0
        mov ah,1
        
    input:
        
        int 21h
        cmp al,0dh
        je counter
        
        cmp al,'0'
        je continue
        
        cmp al,'1'
        je continue
        
        jmp wrong
        
    continue:
        
        sub al,48
        shl bx,1
        or bl,al
        
        inc count
        cmp count,16
        je counter        
        
        jmp input
        
        
    counter:
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        lea dx,msg2
        mov ah,9
        int 21h
        
        mov cl,16
        sub cl,count
        
        rcl bx,cl
        
        xor ch,ch
        mov cl,count
        
        mov ah,2
        
        
    output:
        
        rcl bx,1
        jc outputOne
        
        mov dl,'0'
        int 21h
        
        jmp last
        
        
    outputOne:
        
        mov dl,'1'
        int 21h
        jmp last
        
        
    last:
        
        loop output
        jmp again
        
        
    wrong:
        
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        lea dx,msg3
        mov ah,9
        int 21h
        
        
    again:  
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        lea dx,msg4
        mov ah,9
        int 21h
        
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        lea dx,msg5
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        mov cl,al
        
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        mov bx,0
        mov count,0
        
        cmp cl,'y'
        je first
        
        cmp cl, 'Y'
        je first
        
        
        
        
    exit:
        mov ah,4ch
        int 21h
        main endp
end main