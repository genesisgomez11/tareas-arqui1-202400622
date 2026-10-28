    .data
fmt:            .asciz "ingrese el tipo de compuerta, solo los últimos dos dígitos:\n"
compuerta:      .word 0
.balign 4
fmt2:           .asciz "%d"
ok:             .asciz "IC. OK\n"
nook:           .asciz "IC. MAL\n"
mid:            .asciz "COMPUERTA %d DAÑADA\n"
mascara_cero:   .word 612

.balign 4
mili:           .word 5000000
vec7400:        .word 0, 1161, 2322, 3483
salida7400:     .word 612, 612, 612, 0

vec7408:        .word 0, 1161, 2322, 3483
salida7408:     .word 0, 0, 0, 612

vec7432:        .word 0, 1161, 2322, 3483
salida7432:     .word 0, 612, 612, 612





.text
.global main

main:

    stp x29, x30, [sp, #-32]!
    stp x19, x20, [sp, #16]

inicio:

    adr x0, fmt
    bl printf
    adr x0, fmt2
    adr x1, compuerta
    bl scanf
    adr x1, compuerta
    ldr w1, [x1] // x1= compuerta elegida
    cmp w1, #0
    b.eq cero
    cmp w1, #8
    b.eq ocho
    cmp w1, #27
    b.eq vsiete
    cmp w1, #32
    b.eq tdos
    b inicio

//001001100100
//612

cero:                           // 7400
    adr  x5, vec7400
    adr  x6, salida7400
    b    probar

ocho:                           // 7408
    adr  x5, vec7408
    adr  x6, salida7408
    b    probar

tdos:
    adr  x5, vec7432
    adr  x6, salida7432
    b    probar

probar:
    mov  w19, #0              // acumulador de errores 
    adr  x2, mascara_cero
    ldr  w20, [x2]            // w20 = 612 
    mov  w7, #4               // 4 vectores

vec_loop:
    ldr  w0, [x5], #4         // entrada
    ldr  w8, [x6], #4         // salida 

    adr  x9, mili
    ldr  w3, [x9]             
espera:
    subs w3, w3, #1
    b.ne espera               // retardo

    and  w4, w0, w20         // solo los bits de salida
    eor  w4, w4, w8           // 1 en los bits que fallaron
    orr  w19, w19, w4         // acumular fallas

    subs w7, w7, #1
    b.ne vec_loop

    //resultados
    cbz  w19, imprime_ok      // 0 fallas IC. OK
    cmp  w19, w20
    b.eq imprime_mal          // fallaron las 4 IC MAL

    //parcial
    tst  w19, #512            // d9 compuerta 1
    b.eq  c2
    mov  w1, #1
    adr  x0, mid
    bl   printf
c2:
    tst  w19, #64             // d6 compuerta 2
    b.eq  c3
    mov  w1, #2
    adr  x0, mid
    bl   printf
c3:
    tst  w19, #32             // d5 compuerta 3
    b.eq  c4
    mov  w1, #3
    adr  x0, mid
    bl   printf
c4:
    tst  w19, #4              // d2 compuerta 4
    b.eq  fin
    mov  w1, #4
    adr  x0, mid
    bl   printf
    b    fin

imprime_ok:
    adr x0, ok
    bl  printf
    b   fin

imprime_mal:
    adr x0, nook
    bl  printf
    b   fin

fin:
    b   inicio  


    
