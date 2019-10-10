.model small
.stack 100h
.data

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,0101b    ;given ax
    mov bx,0110b    ;given bx
    
    call multiply
    
    print:  
        mov ah,2
        mov dx,dx
        int 21h
        
        mov bx,dx
        
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
         
        mov cl,8
                    
        xor ch,ch       
        
        mov ah,2
        mov dl,0ah      
        int 21h         
        mov dl,0dh
        int 21h
        
        for:
            rcl bl,1
            jc outputOne
            mov dl, '0' 
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
multiply proc
    push ax
    push bx
    xor dx,dx
    
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
        
        multiply endp
end main
  