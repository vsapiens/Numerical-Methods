clear
///////////////////////////////////////////////////////
//  Integral.sce
//
//  Este programa aproxima la integral con puntos de la
//  parábola con los valores de los limites y el número de
//  particiones
//
//   Erick González   A01039859
//   Víctor Villarreal   A01039863
//   04 / 11  / 2019    version 1.0
//////////////////////////////////////////////////////

//////////////////////////////////////////////////////
//  F
//
//  Funcion que calcula f(x) = x ^ 2
//
//   Parametros:
//      x     es el valor de x para evaluar
//   Regresa:
//     dY     es el caclulo de x elevado al cuadrado
/////////////////////////////////////////////////////
function dY = F(dX)
    dY = dX*dX
endfunction

//////////////////////////////////////////////////////
//  Area
//
//  Funcion que calcula la integral de los parábola
//
//   Parametros:
//      dA     es el valor del limite inicial
//      dB     es el valor del limite final
//      iN     es el numero de parábola
//   Regresa:
//     dSuma   es el area calculada como la suma de parábola
//     
/////////////////////////////////////////////////////
function dSuma = Area(dA, dB, iN)
    
    
    // calculo h (base de cada parábola)
    dH = (dB - dA) / iN
    // inicializo la sumas de los pares e impares
    dSumaPar = 0
    dSumaImpar = 0
    // elaboro el ciclo para cada parábola
    for i = 2 : 2: iN - 2
        // acumulo la suma
        dSumaPar = dSumaPar + F(dA + i * dH)
    end
    
    for i = 1 :2 : iN - 1
        // acumulo la suma
        dSumaImpar = dSumaImpar + F(dA + i * dH)
    end
    
    dSuma = 4*dSumaImpar + 2*dSumaPar + F(dB) + F(dA)
    
    dSuma = (dH *dSuma)/3
    
endfunction


/////// Programa Principal

// pido los valores
dA = input("Dame el limite inferior")
dB = input("Dame el limite superior")
iN = input("Dame el numero de puntos de la parábola")

// despliego la integral aproximada
disp(" Area Aproximada = " + string(Area(dA, dB, iN)))
