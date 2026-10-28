# tareas-arqui1-202400622

## TAREA 1
Basicamente lo que hace mi programa es comparar los msb de numero y luego realizar una resta con carry y activación de banderas para los lsb. Se descarta la resta porque solo pide las banderas. si C = 0 quiere decir que es menor y va a poner a X5 = 3, sino, realiza un XOR para evaluar si son iguales cada parte del numero y un ultimo entre ellos para ver si los 128 bits son iguales y poder saltar a la etiqueta donde X5 = 1, si no salta a ninguna de esas etiquetas, se asume que es mayor y se coloca X5 = 2.

Hace falta colocar numeros de prueba en los registros para probar el programa, estos se pueden modificar.


## TAREA 2
Mi programa consiste en verificar si las compuertas logicas estan en buen estado o estan malas.

### cero
Este es para la compuerta NAND y lo que hace es .word 0, 1161, 2322, 3483 que serían las 4 opciones de entrada y  .word 612, 612, 612, 0 las 4 de salida

### ocho

Este es para la compuerta AND y lo que hace es .word 0, 1161, 2322, 3483 que serían las 4 opciones de entrada y  .word 0, 0, 0, 612 las 4 de salida

### tdos

Este es para la compuerta ORR y lo que hace es .word 0, 1161, 2322, 3483 que serían las 4 opciones de entrada y .word 0, 612, 612, 612 las 4 de salida

### vsiete


se cargan junto con la mascara que es 001001100100 (612), se espera 10 milisegundos con un delay en loop 

espera:
    subs w3, w3, #1
    b.ne espera 

- con el AND deja solo los bits de salida (D9, D6, D5, D2) y pone el resto en 0
- con el EOR compara con lo esperado
- con ORR acumula las fallas de todos los vectores



Génesis Paola Gómez Fernández 202400622