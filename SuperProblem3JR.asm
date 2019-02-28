COMMENT*
		Julio Rosario

		Counting  vowels 
•	Given the paragraph shown below count how many times each vowel appeared and how many vowels in all.

A Most Unusual paragraph 
This is an unusual paragraph.I'm curius as to just how quickly you can find out what is so unsual about it. It
looks so ordinary and plain that you would think nothing was wrong with it. In fact, nothing is wrong with it! it is
highly unsual though. Study it and think about it, but you still my not find anything odd. But if you work at it a bit,
you might find out. Try to do so withouth any coaching.

*COMMENT

include irvine32.inc

.data

quote1 byte  "a most unusual paragraph this is an unusual paragraph.i'm curius as to just how quickly you can find out what is so unsual about it.",0
quote2 byte "it looks so ordinary and plain that you would think nothing was wrong with it.in fact, nothing is wrong with it! it is ",0
quote3 byte "highly unsual though.study it and think about it, but you still my not find anything odd.but if you work at it a bit,",0
quote4 byte "you might find out.try to do so withouth any coaching.",0

count byte 122 DUP(0)
display byte "Total vowels ",0
.code

main PROC
	
	MOV EAX,0
	MOV ECX,lengthof quote1
	MOV ESI,offset quote1
	call getCount

	MOV EAX,0
	MOV ECX,lengthof quote2
	MOV ESI,offset quote2
	call getCount

	MOV EAX,0
	MOV ECX,lengthof quote3
	MOV ESI,offset quote3
	call getCount

  	MOV EAX,0
	MOV ECX,lengthof quote4
	MOV ESI,offset quote4
	call getCount

	call displayValues
	
exit
main endp

getCount PROC USES ECX ESI EAX
	L1:
	   MOV AL,[ESI]			   
        add count[EAX],1               
	                                    							   
	   MOV EAX,0
	   INC ESI
	LOOP L1
ret
getCount ENDP

displayValues PROC

	MOV EBX,0  
	MOV EAX,0
	MOV ESI,97
	MOV AL,97
	MOV ECX,3
	L1:
		call writechar
		push EAX

		MOV AL," "
		call writechar

		MOV AL,count[ESI]
		add BH,AL
		call writedec
		
		add ESI,4
		pop EAX
		add AL,4

		call crlf
	LOOP L1

	MOV EAX,111
	MOV ESI,111
	MOV ECX,2
	L2:
		call writechar
		push EAX

		MOV AL," "
		call writechar

		MOV AL,count[ESI]
		add BH,AL
		call writedec
		
		add ESI,6
		pop EAX
		add AL,6

		call crlf
	LOOP L2

	MOV EAX,0
	MOV EDX,offset display
	call writestring

	MOV AL,BH
	call writedec
	call crlf	
ret
displayValues ENDP
end main 