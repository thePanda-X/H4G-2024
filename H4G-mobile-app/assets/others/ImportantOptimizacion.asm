
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0

section .text
    global _start

_start:
    ; Display message asking for input
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 (stdout)
    mov ecx, fibonacci_msg      ; Pointer to the message to be displayed
    mov edx, 17                 ; Length of the message
    int 0x80                    ; Call kernel

    ; Ask user for the number of terms
    mov eax, 4
    mov ebx, 1
    mov ecx, term_msg
    mov edx, 22
    int 0x80

    ; Read user input
    mov eax, 3                  ; System call number for sys_read
    mov ebx, 0                  ; File descriptor 0 (stdin)
    mov ecx, input_buffer       ; Buffer to store the input
    mov edx, 4                  ; Length of the input buffer
    int 0x80                    ; Call kernel

    ; Convert the input to an integer
    mov eax, dword [input_buffer]   ; Load the input into eax
    sub eax, '0'                    ; Convert ASCII to integer
    mov ebx, eax

    ; Calculate Fibonacci sequence
    push ebx                        ; Push the number of terms onto the stack
    call fibonacci                  ; Call the Fibonacci function
    add esp, 4                      ; Adjust the stack pointer

    ; Exit the program
    mov eax, 1                  ; System call number for sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel

fibonacci:
    ; Function to calculate the Fibonacci sequence
    ; Arguments: ebx - number of terms
    ; Returns: Fibonacci sequence up to the specified number of terms

    cmp ebx, 0              ; Check if number of terms is 0
    jle end_fibonacci       ; If so, return

    cmp ebx, 1              ; Check if number of terms is 1
    jle one_term            ; If so, print 0 and return

    ; Print first two terms of the sequence (0 and 1)
    mov eax, 0
    mov ebx, 1
    call print_fibonacci

    ; Calculate and print remaining terms
    mov esi, 2              ; Initialize counter for terms already printed (0 and 1)
calculate_next:
    mov eax, ebx            ; Move second last term into eax
    add ebx, ecx            ; Add last term to second last term to get next term
    call print_fibonacci    ; Print the next term
    inc esi                 ; Increment counter
    cmp esi, dword [esp+4]  ; Check if all terms are printed
    jl calculate_next       ; If not, continue calculating and printing
    ret

one_term:
    ; If only one term is requested, print 0 and return
    mov eax, 0
    call print_fibonacci
    ret

end_fibonacci:
    ret

print_fibonacci:
    ; Function to print a Fibonacci term
    ; Argument: eax - term to print

    push eax                ; Push the term to print onto the stack
    push output_fmt         ; Push the format string onto the stack
    call printf             ; Call printf function
    add esp, 8              ; Adjust the stack pointer
    ret

section .bss
    input_buffer resd 1     ; Buffer to store user input


    
section .data
    fibonacci_msg db "Fibonacci sequence:", 0
    term_msg db "Enter the number of terms:", 0
    output_fmt db "%d", 0