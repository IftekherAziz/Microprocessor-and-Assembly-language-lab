.model small
.stack 100h
.data
     count db 0
.code
main proc
    
    mov ax,@data        ;data initialize
    mov ds,ax
    
    mov bx,0
    
    mov ah,1
    
    take:
        int 21h
        cmp al,0dh      ;enter hole input newa bondho
        je exit
        
        sub al,48       ;0 je 0 ta bujhanor jonno 
        shl bx,1        ;1 ghor bame sorie current bit ta ke bx e dhukanor jonno jayga khali korlam
        or bl,al        ;input take bl e dhukalam
        inc count       ;count variable die count kortechi koto gula input dewa hocche
        jmp take        ;abar input newar jonno pathacchi
        
    exit:
        mov cl,16       ;bx 16 bit tai cl ke 16 korlam
        sub cl,count    ;bx hocche 16 bit samner 0 gulu output dekhabo na tai gune nilam samne koto gula 0 ache
        rcl bx,cl       ;samne joto gulu 0 ache toto bar rcl korlam jate value gula smane chole ase
                    
        xor ch,ch       ;ch ke 0 korlam
        mov cl,count    ;joto input diyechilo toto korlam count variable ke
        
        mov ah,2
        mov dl,0ah      
        int 21h         ;new line
        mov dl,0dh
        int 21h
        
        for:
            rcl bx,1
            jc outputOne
            mov dl, '0' ;0 print korbe
            int 21h
            jmp last
            
            outputOne:  ;one hole outputOne e gie one print korbe
                mov dl,'1'
                int 21h
            
            last:       ;cl joto toto bar chole ei loop ta
                loop for
        
        mov ah,4ch
        int 21h
        main endp
end main