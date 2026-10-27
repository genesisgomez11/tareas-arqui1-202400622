# tareas-arqui1-202400622


Basicamente lo que hace mi programa es comparar los msb de numero y luego realizar una resta con carry y activación de banderas para los lsb. Se descarta la resta porque solo pide las banderas. si C = 0 quiere decir que es menor y va a poner a X5 = 3, sino, realiza un XOR para evaluar si son iguales cada parte del numero y un ultimo entre ellos para ver si los 128 bits son iguales y poder saltar a la etiqueta donde X5 = 1, si no salta a ninguna de esas etiquetas, se asume que es mayor y se coloca X5 = 2.

Hace falta colocar numeros de prueba en los registros para probar el programa, estos se pueden modificar.

Génesis Paola Gómez Fernández 202400622