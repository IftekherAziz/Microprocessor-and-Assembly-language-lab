.model small
.stack 100h
.data
    count db 0 
    count1 db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    fist:
    
        mov bx,0
        mov ah,1
    
    input:
    
        int 21h
        cmp al,0dh
        je second
        
        sub al,48
        shl bx,1
        or bl,al
        
        inc count
        cmp count,8
        je second
        
        jmp input 
        
     second:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        
        mov cx,0
        mov ah,1
        
     input1:
        
        int 21h
        cmp al,0dh
        je next
        
        sub al,48
        shl cx,1
        or cl,al
        
        inc count1
        cmp count1,8
        je next
        
        jmp input1
        
     next:
        
        call multiplication 
        
     output:
     
        mov cl,16 
        sub count1,1
        mov bl,count1
        add count,bl
        sub cl,count
        rcl dx,cl
        
        xor ch,ch
        mov cl,count
        mov ah,2
        mov dl,0ah      
        int 21h         ;new line
        mov dl,0dh
        int 21h 
        
     for:
        
        rcl dx,1
        jc outputOne
        mov dl,'0'
        int 21h       
        jmp last
        
     outputOne:
        
        mov dl,'1'
        int 21h
        
     last:
        loop for
        
        
     exit:
        
        mov ah,4ch
        int 21h
        main endp
        
     multiplication proc
        
        push bx
        push cx
        mov dx,0
        
        repeat:      
        
            test bx,1
            jz end_if
            
            add dx,ax
            
        end_if:
            
            shl ax,1
            shr bx,1
            
            jnz repeat
            
            pop bx
            pop ax
           
            ret
            
        multiplication endp
end main