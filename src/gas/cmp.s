    .global _start
    .text
_start:
    movl $123, %eax     # eaxに123を格納
    cmpl $123, %eax     # eaxと456を比較
    je   L1             # eaxが456ならL1ラベルにジャンプ
    movl $msg_neq, %ecx # ecxにmsg_neqのアドレスを格納
    movl $10, %edx      # 10文字
    jmp  L2
L1:
    movl $msg_eq, %ecx  # msg_eq
    movl $6, %edx
L2: 
    movl $4, %eax       # システムコール4番はwrite
    movl $1, %ebx       # 標準出力 (1)
    int  $0x80          # システムコール呼び出し

    movl $1, %eax       # 1番はexit
    int  $0x80          # システムコール呼び出し

    .data
msg_eq: .ascii "equal\n"
msg_neq: .ascii "not equal\n"
