NULL EQU 0
STD_OUTPUT_HANDLE EQU -11

extern _GetStdHandle@4
extern _WriteFile@20
extern _Sleep@4
extern _ExitProcess@4

global Start

section .data
    HelloWorldMessage db "Hello World!", 0Dh, 0Ah
    HelloWorldMessageLength EQU $-HelloWorldMessage

    TwoTimesTwoEqualsFourMessage db "2 x 2 = 4", 0Dh, 0Ah
    TwoTimesTwoEqualsFourMessageLength EQU $-TwoTimesTwoEqualsFourMessage

section .bss
    StandartHandle resd 1
    Written resd 1

section .text
    Start:
        push DWORD STD_OUTPUT_HANDLE
        call _GetStdHandle@4
        mov dword [StandartHandle], EAX

        push 1000
        call _Sleep@4

        push NULL
        push DWORD Written
        push DWORD HelloWorldMessageLength
        push DWORD HelloWorldMessage
        push DWORD [StandartHandle]
        call _WriteFile@20

        push 1000
        call _Sleep@4

        push NULL
        push DWORD Written
        push DWORD TwoTimesTwoEqualsFourMessageLength
        push DWORD TwoTimesTwoEqualsFourMessage
        push DWORD [StandartHandle]
        call _WriteFile@20

        push 3000
        call _Sleep@4

        push NULL
        call _ExitProcess@4