#include <stdio.h>
#include <stdbool.h>
#include "funciones.h"
#include "control.h"


int main(){
    int n, b, i, cantidad;
    bool c1, c2, c3, c4;
    int* vector;

    printf("ingresa el numero N: ");
    c1 = verifica_entrada_int(&n);
    printf("\n");

    printf("ingresa el numero de la bomba: ");
    c2 = verifica_entrada_int(&b);
    printf("\n");

    //verificamos si son positivos
    c3 = verifica_int_positivo(n);
    c4 = verifica_int_positivo(b);

    //asignamos espacio al vector
    vector = (int*)malloc(n*sizeof(int));

    if (vector == NULL) {
        printf("No se pudo realizar la operacion\n");
    }
    else if (!(c1 && c2 && c3 && c4))
    {
        printf("Solo se permite datos numericos positivos");
    }
    else if (b == 0)
    {
        printf("La bomba no puede ser igual a 0");
    }
    else
    {
        cantidad = explosion(n, b, vector);

        //imprimimos
        printf("[");
        for (i = 0; i < cantidad; i++)
        {
            printf("%i ", *(vector+i));
        }
        printf("]");
        
    }

    return 1;
}

int explosion(int n, int b, int* size){
    int cant; //cuanta la cantidad de elementos que se cargan
    
    if (n <= b){//caso base
        *size = n;
        cant = 1;
    }
    else{//caso recursivo

        //la primera opcion (n/b) siempre me dara un numero menor a
        //"b" por lo que no tenemos que usar recursion en el
        *size = n/b;
        cant = 1 + explosion((n - *size), b, size+1);
        //el cant cuenta la N1 + la N2 que te devuelve la recursion
    }
    return cant;
}


int contar_digitos(int num) {
    int count = 0;
    while (num != 0) {
        num /= 10; //abreviacion: el resultado de num/4 lo ponen en "num"
        count++;
    }
    return count;
}

bool verifica_entrada_int(int* num){
    bool resultado = true;

    if (scanf("%d", num) != 1) {
        resultado = false;
    }

    return resultado;
}

bool verifica_int_positivo(int num){
    bool r = false;

    if (num >= 0)
    {
        r = true;
    }
    
    return r;
}