
// tearea genesis gomez 202400622

    .text
    .global _start
    

_start:

    MOV     X0, #0              // a lsb
    MOV     X1, #1              // a msb
    MOV     X2, #0              // b lsb
    MOV     X3, #0              // b msb


    CMP     X0, X2              // resta lsb X0 - X2
    SBCS    XZR, X1, X3         // resta msb: X1 - X3 - !C
                                // C = 1 si a >= b y C = 0 si a < b 

    B.LO    menor            // C = 0:  a < b

    EOR     X6, X0, X2          // X6 = 0 si lsb son iguales
    EOR     X7, X1, X3          // X7 = 0 si msb son iguales
    ORR     X6, X6, X7          // X6 = 0 solo si a == b
    CBZ     X6, iguales         // si X6 es 0 : 128bits iguales

    MOV     X5, #2              // a > b
    B       fin

iguales:
    MOV     X5, #1              // a == b
    B       fin

menor:
    MOV     X5, #3              // a < b

fin:

    NOP // X5 = 1 si es igual, X5 = 2 si a > b y X5 = 3 si a < b
   
    MOV     X8, #93  
    MOV     X0, #0
    SVC     #0