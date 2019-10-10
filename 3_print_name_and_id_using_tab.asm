.model small
.stack 100h
.data
    msg1 db 'Md. Asif shahariar$'
    msg2 db 'Id: 162-15-7772$'
.code                         

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,09h
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
                                