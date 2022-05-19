.intel_syntax noprefix

.text
.global array_sort
array_sort:
	push ebp
	mov ebp, esp
	//--------
	push ebx
	push ecx
	push edx
	
	mov eax, [ebp + 4*2]	// tömb
	mov ebx, [ebp + 4*3]	// length
	
// FOR
	mov ecx, 0	// i
	mov edx, 1	// j
STARTLOOP_I:
	push ebx
	sub ebx, 1
	cmp ecx, ebx	// cmp ecx, ebx-1
	pop ebx
	
	jge ENDLOOP_I
	
	push ecx
	inc ecx
	mov edx, ecx	// mov edx, ecx+1
	pop ecx
STARTLOOP_J:
	cmp edx, ebx
	jge ENDLOOP_J
	//--------------
	push ebx
	mov ebx, [eax + ecx*4]	// ebx := array[i]
	cmp ebx, [eax + edx*4]	// array[i] <? array[j]
	jge SWITCHED
	
	// switch
	push ebx
	mov ebx, [eax + edx*4]	// ebx := array[j]
	mov [eax + ecx*4], ebx	// array[i] := ebx (array[j])
	pop ebx	// ebx := array[i]
	mov [eax + edx*4], ebx	// array[j] := ebx (array[i]);
	
SWITCHED:
	pop ebx	// ebx := j
	
	//--------------
	inc edx	// j++
	jmp STARTLOOP_J
ENDLOOP_J:
	inc ecx	// i++
	jmp STARTLOOP_I
ENDLOOP_I:
// END FOR

	pop edx
	pop ecx
	pop ebx
	//--------
	mov esp, ebp
	pop ebp
	ret
