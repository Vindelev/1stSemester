;
; CAO_project_final.asm
;
; Created: 04-12-2018 10:05:58
; Author : Christian
;

start:
    ldi		r17, 0x00
	out		ddrb, r17	    ; set port B to being the input	
	out     portb, r17      ; sets each bit at portb to 0.
    ldi     r20, 0x00       ; creates the counter for display 1								
	ldi		r23, 0x00		; creates the counter for display 2
	rjmp	picks_a_number_a_out ; jumps to the methods for showing the numbers.
							; this is to achive a default print of 0.
	

button_presser:

read_cipher:

	in	    r19, pinb       ;	val is equal input to portB
	cpi     r19, 0xff		
	breq    read_cipher		;	branches if input is set.

debounced_read:             ;	asures that only one press is detected. 
    call    delay_100ms		
	in      r18, pinb       
	cp      r18, r19		;	checks if the button is still pressed after 20ms
	breq    read_cipher     ;	

incrementer:				;	checks what button is pressed.

	sbrc r19, 0				
	inc	 r20				;	increments only if button at pinb 0 is pressed.
	
	sbrc r19, 2
	inc  r23				;	increments only if button at pinb 2 is pressed.
	
	sbrc r19, 1				
	rjmp reset				;	executes method if button at pinb 1 is pressed.


picks_a_number_a_out:		;	counts the amount of presses.
							;	decrements the counter of presses until 0
	ldi r21, 0x00
	add r21, r20			;	add r20 to r21
	BREQ number0_a
	dec r21
	BREQ number1_a
	dec r21
	BREQ number2_a
	dec r21
	BREQ number3_a
	dec r21
	BREQ number4_a
	dec r21
	BREQ number5_a
	dec r21
	BREQ number6_a
	dec r21
	BREQ number7_a
	dec r21
	BREQ number8_a
	dec r21
	rjmp number9_a
	
	

;>>>>>>>>>Numbers 0-9<<<<<<<<<<<

;Shows number 0 on display
number0_a:
	LDI r16, 0b11111110
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 1 on display
number1_a:
	LDI r16, 0b11001000
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 2 on display
number2_a:
	LDI r16, 0b11110011
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 3 on display
number3_a:
	LDI r16, 0b11111001
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 4 on display
number4_a:
	LDI r16, 0b11001101
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 5 on display
number5_a:
	LDI r16, 0b10111101
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out
	
;Shows number 6 on display	
number6_a:
	LDI r16, 0b10111111
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 7 on display
number7_a:
	LDI r16, 0b11011000
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 8 on display
number8_a:
	LDI r16, 0b11111111
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

;Shows number 9 on display
number9_a:
	LDI r16, 0b11111101
	STS 0x22, r16

	LDI r16, 0b11111111
	STS 0x21, r16
	rjmp picks_a_number_c_out

picks_a_number_c_out:
	ldi r22, 0x00
	add r22, r23 ; add r20 to r21
	BREQ number0_c
	dec r22
	BREQ number1_c
	dec r22
	BREQ number2_c
	dec r22
	BREQ number3_c
	dec r22
	BREQ number4_c
	dec r22
	BREQ number5_c
	dec r22
	BREQ number6_c
	dec r22
	BREQ number7_c
	dec r22
	BREQ number8_c
	dec r22
	rjmp number9_c
;>>>>>>>>>Numbers 0-9<<<<<<<<<<<

;Shows number 0 on display
number0_c:
	LDI r16, 0b11111110
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 1 on display
number1_c:
	LDI r16, 0b11001000
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 2 on display
number2_c:
	LDI r16, 0b11110011
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 3 on display
number3_c:
	LDI r16, 0b11111001
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 4 on display
number4_c:
	LDI r16, 0b11001101
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 5 on display
number5_c:
	LDI r16, 0b10111101
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END
	
;Shows number 6 on display	
number6_c:
	LDI r16, 0b10111111
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 7 on display
number7_c:
	LDI r16, 0b11011000
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 8 on display
number8_c:
	LDI r16, 0b11111111
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

;Shows number 9 on display
number9_c:
	LDI r16, 0b11111101
	STS 0x28, r16

	LDI r16, 0b11111111
	STS 0x27, r16
	rjmp END

END:
	ldi r19, 0x00
	rjmp button_presser
	
reset:								;	resets the counters by loading 0x00 to both counters. 
	ldi r19, 0x00
	ldi r20, 0x00
	ldi r23, 0x00
	rjmp picks_a_number_a_out		;	sets the displays back to 0
	
; 100 ms delay
delay_100ms:
    ldi r31, 8
L1:	ldi r30, 200
L2:	ldi r29, 250
L3:					
	nop				;waste a mashine cycle
	dec	r29
	brne L3

	dec r30
	brne L2

	dec r31
	brne L1
	ret

/*
; 200 ms delay
delay_200ms:
    ldi r31, 16
L1:	ldi r30, 200
L2:	ldi r29, 250
L3:
	nop						;waste a mashine cycle
	dec	r29
	brne L3

	dec r30
	brne L2

	dec r31
	brne L1
	ret */
