
////////////////////////////////////////////////////
// Biseccion.sce
// 
// 
// 
// 
// Erick González
// Victor Villarreal
// 6/2/2019 versión 1.0
////////////////////////////////////////////////////

////////////////////////////////////////////////////
// PedirInformacion
//
// 
// 
//
// Parámetros:
// no tiene
// 
// Retorno:
// 
// 
////////////////////////////////////////////////////

function [dLower, dUpper, dPorcentual, iMaxIter] = PedirInformacion()
    
    //Solicitar y leer el valor de dLower
    dLower = input("Da el valor de x Lower")
    //Solicitar y leer el valor de dLower
    dUpper = input("Da el valor de x Upper")
    
    //Solicitar y leer el valor de dLower
    dPorcentual = input("Da el valor de error porcentual")
    // pido el valor de dPorcentual y valido que sea positivo
    while (dPorcentual < 0)
        disp("El valor debe ser positivo")
        dPorcentual = input("Da el valor de error porcentual")
    end
    
    //Solicitar y leer el valor de iVeces
    iMaxIter = input("Da el numero maximo de iteraciones")
    // pido el valor de iVeces y valido que sea positivo
    while (iMaxiter < 0)
        disp("El valor debe ser positivo")
        iMaxIter = input("Da el numero maximo de iteraciones")
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
// Volumen
//
// Calcula el valor de la ecuacion del volumen:
//          V = π h ^ 2 [3 R - h ] / 3
// 
// Parámetros
// dRadio:
// dAltura:
// Retorno
// dVolumen:
////////////////////////////////////////////////////
function dVolumen = Volumen(dRadio, dAltura)
    
    dVolumen = ( (pi*(dAltura) ^ 2) * [3 * dRadio - dAltura ] ) / 3
    
endfunction


////////////////////////////////////////////////////
// Biseccion
//
// Calcula el error real
//
// Parámetros:
// dValor1 valor del primer numero
// dValor2 valor del segundo numero
// Retorno:
// 
////////////////////////////////////////////////////

function Biseccion(dLower, dUpper, dPorcentual, iMaxIter)
    dError = 0
    dAnterior = 0
    dVolumen = 0
    dNueva = 0
    iCounter = iMaxIter
    
    while( iCounter >= 0 || dError <= dPorcentual)
     
    dLowVol = Volumen(dLower)
    dUpVol  = Volumen(dUpper)
    dNueva = (dLowVol + dUpVol) / 2
    dVolumen = Volumen(dNueva)
    
    disp("Xl = " + string(dLower) + "| f(Xl) = " string(dLowVol) + "| Xu = " +string(dUpper) + "| f(Xu) = " + string(dUpVol) + "| Xr = " string(dNueva) + "| f(Xr) = " + string(dVolumen)
    
    if(iCounter <> iMaxIter)
        dError = ErrorRelativo(dVieja, dNueva)
        disp("Error Relativo = " + string(dError))
    end
    
    if(dVolumen * dLowVol < 0)
        
       dUpper = dNueva
        else 
            dLower = dNueva
        end
    end
    
    dVieja = dNueva
    iCounter--
    end
    
endfunction 

////////////////////////////////////////////////////
// Instrucciones del programa principal
////////////////////////////////////////////////////






////////////////////////////////////////////////////
// Casos de Prueba
//
// Caso #1
// 
// 
////////////////////////////////////////////////////
