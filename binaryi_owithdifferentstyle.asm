.model small
.stack 100h
.data      
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,0
    
    mov ah,1
    
    for1:
    int 21h
    cmp al,0dh
    je end_for1 
    
    
    cmp al,'0'
    jl exit
    cmp al,'1'
    jg exit 
    sub al,48
    
    
    shl bx,1
    or bl,al
    inc count            
    jmp for1
    
    end_for1:
    mov cl,16
    sub cl,count
    rcl bx,cl
    
    xor ch,ch
    mov cl,count 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    for2:
    rcl bx,1
    jc output1
    mov dl,'0'
    int 21h
    jmp end
    
    output1:
    mov dl,'1'
    int 21h
    jmp end
    
    end:
    loop for2
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
