clear
///////////////////////////////////////////////////////
//  Integral.sce
//
//  Este programa aproxima la integral con rectangulos
//  pidiendo los valores de los limites y el numero de 
//  rectangulos
//
//   Nombre1   Apellido1
//   Nombre2   Apellido2
//   99 / XXX  / 99    version 1.0
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
    dY = dX * dX
endfunction

//////////////////////////////////////////////////////
//  Area
//
//  Funcion que calcula la integral de los trapecios
//
//   Parametros:
//      dA     es el valor del limite inicial
//      dB     es el valor del limite final
//      iN     es el numero de trapecios
//   Regresa:
//     dSuma   es el area calculada como la suma de trapecios
/////////////////////////////////////////////////////
function dSuma = Area(dA, dB, iN)
    
    
    // calculo h (base de cada trapecio)
    dH = (dB - dA) / iN
    // inicializo la suma
    dSuma = 0
    // elaboro el ciclo para cada trapecio
    for i = 1 : iN - 1
        // acumulo la suma
        dSuma = dSuma + F(dA + i * dH)
    end
    
    dSuma = 2*dSuma + F(dB) + F(dA)
    
    dSuma = (dH *dSuma)/2
    
endfunction


/////// Programa Principal

// pido los valores
dA = input("Dame el limite inferior")
dB = input("Dame el limite superior")
iN = input("Dame el numero de trapecios")

// despliego la integral aproximada
disp(" Area Aproximada = " + string(Area(dA, dB, iN)))
