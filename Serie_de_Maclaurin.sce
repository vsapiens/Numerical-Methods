
////////////////////////////////////////////////////
// Serie_de_Maclaurin.sce
// Esta programa aproxima la funncion coseno a partir 
// de la serie de maclaurin a partir de que el 
// usuario proporcione el valor en x y la potencia 
// de la expresión.
// Erick González
// 21/1/2018 versión 1.0
////////////////////////////////////////////////////

////////////////////////////////////////////////////
// PedirInformacion
//
// Solicito y leo el valor de numero de iteraciones
// y valor inicial de la x para aproximar
//
// Parámetros:
// no tiene
// 
// Retorno:
// dValor valor inicial de x 
// iVeces numero de iteraciones
////////////////////////////////////////////////////

function [dValor, iVeces] = PedirInformacion()
    //Solicitar y leer el valor de dValor
    dValor = input("Da el valor de x")
    // pido el valor de dValor y valido que sea positivo
    while (dValor < 0)
        disp("El valor debe ser positivo")
        dValor = input("Da el valor de x")
    end
    
    //Solicitar y leer el valor de iVeces
    iVeces = input("Da el valor de n")
    // pido el valor de iVeces y valido que sea positivo
    while (iVeces < 0)
        disp("El valor debe ser positivo")
        iVeces = input("Da el valor de n")
    end
endfunction

////////////////////////////////////////////////////
// Factorial
//
// Calcula el factorial de un número
//
// Parámetros:
// iNumero valor límite del cálculo del factorial
// Retorno:
// iNumero valor del factorial
////////////////////////////////////////////////////
function iNumero = Factorial(iNumero)
    // en caso de que sea 1 regresa 1
   if (iNumero<=0) then iNumero = 1
     // calcula recursivamente el factorial hasta iNumero
   else 
       iNumero =  iNumero* Factorial(iNumero-1)     
   end
endfunction
////////////////////////////////////////////////////
// ErrorRelativo
//
// Calcula el error real
//
// Parámetros:
// dValor1 valor del primer numero
// dValor2 valor del segundo numero
// Retorno:
// dErrorRelativo valor del error real relativo
////////////////////////////////////////////////////
function dErrorRelativo= ErrorRelativo(dValor1, dValor2)
    //calcula la diferencia de los valores y divide entre el valor inicial
    dErrorRelativo = 100* abs((dValor1-dValor2)/dValor1)
endfunction

////////////////////////////////////////////////////
// SerieMaclaurin
//
// Calcula el error real
//
// Parámetros:
// dValor
// iVeces
// Retorno:
// iSuma
// dErrorRealRelativo 
// dErrorAproxRelativo
////////////////////////////////////////////////////
function [iSuma, dErrorRealRelativo, dErrorAproxRelativo] = SerieMaclaurin(dValor,iVeces)
    //Se inicializa la suma
    iSuma = 0
    //Se inicializa la suma previa para calcular el error aproximado
    iSumaAnterior = iSuma
    //Se inicializa el contador para ir alternando el signo
    iContador1 = 0
    //
for iContador = 0 : 2: iVeces
    iContador1 = iContador + 1
    if(iContador == 0)
     //Se suma en caso de que sea solo un numero
     iSuma = iSuma + 1
    else 
     //Se asigna el valor previo a la suma
     iSumaAnterior = iSuma
     //Es la suma de la evaluacion en esa iteracion
     iSuma = iSuma +((-1)^iContador1)*((dValor) ^ iContador)/Factorial(iContador)
    end
    //Se llama a la funcion para calcualr el valor real relativo
    dErrorRealRelativo = ErrorRelativo(cos(dValor),iSuma)
    //Se define -1 para que no se muestre en caso de que sea negativo
    dErrorAproxRelativo = -1
    //Se llama a la funcion para calcualr el valor aproximado relativo
    if(iVeces > 0)
        dErrorAproxRelativo = ErrorRelativo(iSuma,iSumaAnterior)
    end
end
endfunction

////////////////////////////////////////////////////
// Resultados
//
// Calcula el factorial de un número
//
// Parámetros:
// iNumero valor límite del cálculo del factorial
// Retorno:
// iNumero valor del factorial
////////////////////////////////////////////////////
function Resultados(iVeces, iSuma, dErrorRealRelativo, dErrorAproxRelativo)
    //Despliega el numero de veces
    disp("n = " + string(iVeces))
     //Despliega la suma aproximada de mclaurin
    disp("Suma = " + string(iSuma))
     //Despliega el valor del error real relativo
    disp("Error Real Relativo  = " + string(dErrorRealRelativo) + " %")
    //Despliega el valor del error aproximado relativo en caso de que exista
    if(dErrorAproxRelativo <> -1)
    disp("Error Aproximado Relativo  = " + string(dErrorAproxRelativo) + " %")
    end
endfunction

////////////////////////////////////////////////////
// Instrucciones del programa principal
////////////////////////////////////////////////////

// Pido la informacion de
[dValor, iVeces] = PedirInformacion()
//Llama a la funcion de MacLaurin para aproximar el resultado
[iSuma, dErrorRealRelativo, dErrorAproxRelativo] = SerieMaclaurin(dValor,iVeces)
// Despliega los resultados de todos los valores
Resultados(iVeces, iSuma, dErrorRealRelativo, dErrorAproxRelativo)

////////////////////////////////////////////////////
// Casos de Prueba
//
// Caso #1
// dValor = .5
// iVeces = 0
// 
// iSuma = 1 dErrorRealRelativo = 13.9494 dErrorAproxRelativo = -1 s(No existe)
// Caso #2
// dValor = .5
// iVeces = 2
// 
// iSuma = 0.875 dErrorRealRelativo = 0.2943 dErrorAproxRelativo = 14.2857
//
// Caso #3
// dValor = .5 
// iVeces = 4
// iSuma = 0.8776 dErrorRealRelativo = 0.0025 dErrorAproxRelativo = 0.2967
////////////////////////////////////////////////////
