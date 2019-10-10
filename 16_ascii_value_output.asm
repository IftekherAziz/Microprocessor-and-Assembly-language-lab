.model small
.stack 100h
.data

.code
main proc
    
    mov cl,128
    mov bl,255
    mov ch,0
    
    mov ah,2
    
    print:
        int 21h
        mov dl,cl
        int 21h
        mov dl,' '
        inc cl
        inc ch
        cmp ch,10
        je enter
        cmp cl,bl
        jle print
        jmp exit
    
    enter:
        mov ch,0
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        jmp print
    
    
    exit:
        mov ah,4ch
        int 21h
        main endp
end main