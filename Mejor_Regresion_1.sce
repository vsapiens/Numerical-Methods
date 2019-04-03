/////////////////////////////////////
// Caculo de la mejor regresión
// Este programa calcula el mejor modelo de regresión para un conjunto de valores de ""x"" y "y"
// Victor Villarreal
// A01039863
// Erick González
// A01039859
// 01/04/2019
/////////////////////////////////////


////////////////////////////////////////////////////
// PidoEstimacion
// Lee la estimación del valor 
// Parámetros:
// 
// Retorno:
// Valor de la estimación por hacer
// 
////////////////////////////////////////////////////
function  dEst  =  PidoEstimacion ()
           // pido el numero de elementos
          dEst  =  input  (  "¿Para que valor desea estimar?"  )   // pido cada valor del arreglo
endfunction
////////////////////////////////////////////////////
// PidoValores
// Lee la cantidad de valores de x y y con sus respectivos
// valores
// Parámetros:
// 
// Retorno:
// Arreglo con los valores de entrada
// 
////////////////////////////////////////////////////
function  ARREGLO  =  PidoValores  ()
           // pido el numero de elementos
          n  =  input  (  "¿Cuantos valores quieres?"  )   // pido cada valor del arreglo
         for  i  =  1  :  n
           // con string(i) puedo desplegar que elemento estoy pidiendo
             ARREGLO  (  1  ,i  )  =  input  (  "Da el elemento "  +  string  (  i  ) + ":")
         end
endfunction
////////////////////////////////////////////////////
// dXYSuma
// Suma las multiplicación de las matrices X y Y
// Parámetros:
//  Arreglo X y Arreglo Y
// Retorno:
// Suma de la multiplicación de las matrices X y Y
// 
////////////////////////////////////////////////////
function  s = dXYSuma (ARRX, ARRY)
           // inicializo s
           s  =  0
           // para cada renglon
           for  i  =  1  :  size  (  ARRX  ,  2  )   // size(ARR,2) porque es horizontal
                  //acumulo el elemento a la suma
                  s  =  s  +  (ARRX(1,i) * ARRY(1,i))
           end
endfunction
////////////////////////////////////////////////////
// dX2YSuma
// Suma las multiplicación de las matrices X^2 y Y
// Parámetros:
//  Arreglo X y Arreglo Y
// Retorno:
// Suma las multiplicación de las matrices X^2 y Y
// 
////////////////////////////////////////////////////
function  s = dX2YSuma (ARRX, ARRY)
           // inicializo s
           s  =  0
           // para cada renglon
           for  i  =  1  :  size  (  ARRX  ,  2  )   // size(ARR,2) porque es horizontal
                  //acumulo el elemento a la suma
                  s  =  s  +  (ARRX(1,i)^2 * ARRY(1,i))
           end
endfunction
////////////////////////////////////////////////////
// dXYlnSuma
// Suma las multiplicación de las matrices X y ln(Y)
// Parámetros:
//  Arreglo X y Arreglo Y
// Retorno:
// Suma las multiplicación de las matrices X y ln(Y)
// 
////////////////////////////////////////////////////
function  s = dXYlnSuma (ARRX, ARRY)
           // inicializo s
           s  =  0
           // para cada renglon
           for  i  =  1  :  size  (  ARRX  ,  2  )   // size(ARR,2) porque es horizontal
                  //acumulo el elemento a la suma
                  s  =  s  +  (ARRX(1,i) * log(ARRY(1,i)))
           end
endfunction
////////////////////////////////////////////////////
// dXlnYlnSuma
// Suma las multiplicación de las matrices ln(X) y ln(Y)
// Parámetros:
//  Arreglo X y Arreglo Y
// Retorno:
// Suma las multiplicación de las matrices ln(X) y ln(Y)
// 
////////////////////////////////////////////////////
function  s = dXlnYlnSuma (ARRX, ARRY)
           // inicializo s
           s  =  0
           // para cada renglon
           for  i  =  1  :  size  (  ARRX  ,  2  )   // size(ARR,2) porque es horizontal
                  //acumulo el elemento a la suma
                  s  =  s  +  (log(ARRX(1,i)) * log(ARRY(1,i)))
           end
endfunction
////////////////////////////////////////////////////
// Montante
// Funcion que simula el metodo montante de una 
// matriz
//
// Parámetros:
// MAT- recibe una matriz que es la que se va a reducir
// 
// Retorno:
// X vector de respuesta de la matriz
////////////////////////////////////////////////////
function X = Montante(MAT)
    //empieza con el pivote  = 0
    pivote = 1
    // para cada renglón i de la matriz se ejecuta el método
    for(i = 1:size(MAT,1))
        for(k = 1:size(MAT,1))
                if(i <> k)
                
                    for(j = i+1:size(MAT,2))
                        //en caso de que k sea diferente a i se obtiene determinante entre la determinante anterior
                        MAT(k,j) = (MAT(i,i)*MAT(k,j) - MAT(k,i)*MAT(i,j))/pivote
                        
                    end
                end
         end
         //cambia el pivote
         pivote = MAT(i,i)     
    end
      //modificas la X para que acomode la respuesta
      for(i = 1:size(MAT,1))    
          X(i) = MAT(i,size(MAT,1)+1)/pivote
      end 
endfunction

////////////////////////////////////////////////////
// dR2
//  Calcula los valores cuadrados de la r
// Parámetros:
//  Vector X de los valores y el valor calculado en arreglo
// Retorno:
// Valor de r^2
// 
////////////////////////////////////////////////////
function dR2 = R2(X,xCalculated)
    
    xMean = sum(log(X)) / size(X,2)
    
    dSST = sum((log(X) - xMean)^2)
        
    dR2 = (dSST - sum((log(X) - log(xCalculated))^2)) / dSST
    
endfunction

////////////////////////////////////////////////////
// Lineal
//  Calcula la regresión de este tipo
// Parámetros:
//  Numero de terminos, arreglo X y Y, suma de X,
//  suma de X^2,suma de Y, suma de XY y valor a estimar 
// Retorno:
// Valor de la r^2 y su estimación
// 
////////////////////////////////////////////////////
function [Rlineal,estLineal] = Lineal(iN, iXs, iYs, iXSum, iX2Sum, iYSum, iXYSum, dEst)
    dNewMat = [iN, iXSum, iYSum; iXSum, iX2Sum, iXYSum]
    //resolver por Montante
    X = Montante (dNewMat)
    //valores evaluados en la regresión
    xCalculated = X(1,1) + X(2,1)*iXs
    //valor de la estimación
    estLineal = X(1,1) + X(2,1)*dEst
    //caclulo de la r^2
    dR2 = R2(iYs,xCalculated)
    Rlineal = dR2
    
    
    disp("Lineal : y = " + string(X(1,1)) + " + (" + string(X(2,1)) + ") * x , r2 = " + string(dR2))
    
     disp("Valores Evaluados:")
         
     disp(xCalculated)
    
    
endfunction
////////////////////////////////////////////////////
// Cuadrática
//  Calcula la regresión de este tipo
// Parámetros:
//  Numero de terminos, arreglo X y Y, suma de X,
//  suma de X^2, uma de X^3, uma de X^4,
//  suma de Y, suma de XY, suma de X^2Y y el valor a estimar 
// Retorno:
// Valor de la r^2 y su estimación
// 
////////////////////////////////////////////////////
function [RCuadr,estCuadr] = Cuadratica(iN, dXs, dYs, dXSum, dX2Sum, dX3Sum, dX4Sum, dYSum, dXYSum, dX2YSum,dEst)
    dNewMat2 = [iN, dXSum, dX2Sum, dYSum; dXSum, dX2Sum, dX3Sum, dXYSum; dX2Sum, dX3Sum, dX4Sum, dX2YSum]
    //resolver por Montante
    X = Montante (dNewMat2)
            //valores evaluados en la regresión
          xCalculated = X(1,1) + X(2,1)*(dXs) +X(3,1)*(dXs^2)
          //valor de la estimación
          estCuadr =  X(1,1) + X(2,1)*(dEst) +X(3,1)*(dEst^2)
          //caclulo de la r^2
          dR2 = R2(dYs,xCalculated)
          RCuadr = dR2
    disp("Cuadratica : y = " + string(X(1,1)) + " + (" + string(X(2,1)) + ") * x + (" + string(X(3,1)) +  ") * x^2, r2 = " + string(dR2))
    
         disp("Valores Evaluados:")
     disp(xCalculated)
    
endfunction
////////////////////////////////////////////////////
// Exponencial
//  Calcula la regresión de este tipo
//  Parámetros:
//  Numero de terminos, arreglo X y Y, suma de X,
//  suma de X^2,suma de ln(Y), suma de Xln(Y) y valor a estimar 
//  Retorno:
// Valor de la r^2 y su estimación
// 
////////////////////////////////////////////////////
function [RExp,estExp] = Exponencial(iN, dXs, dYs, dXSum, dX2Sum, dYlnSum, dXYlnSum,dEst)
    dNewMat3 = [iN, dXSum, dYlnSum; dXSum, dX2Sum, dXYlnSum]
    //resolver por Montante
    X = Montante (dNewMat3)
        //valores evaluados en la regresión
        xCalculated = %e^X(1,1)*%e^( X(2,1) * dXs)
        //valor de la estimación
        estExp = %e^X(1,1)*%e^( X(2,1) * dEst)
        //caclulo de la r^2
         dR2 = R2(dYs,xCalculated)
        RExp = dR2
    disp("Exponencial : y = " + string(%e^(X(1,1))) + " * e^(" + string(X(2,1)) + " * x), r2 = "+ string(dR2))
     disp("Valores Evaluados:")
     disp(xCalculated)
    
    
endfunction
////////////////////////////////////////////////////
// Exponencial
//  Calcula la regresión de este tipo
//  Parámetros:
//  Numero de terminos, arreglo X y Y, suma de ln(X),
//  suma de ln(X)^2,suma de ln(Y), suma de ln(X)ln(Y) y valor a estimar 
//  Retorno:
// Valor de la r^2 y su estimación
// 
////////////////////////////////////////////////////
function [RPot, estPot] = Potencia(iN, dXs, dYs, dXlnSum, dXln2Sum, dYlnSum, dXlnYlnSum,dEst)
    dNewMat4 = [iN, dXlnSum, dYlnSum; dXlnSum, dXln2Sum, dXlnYlnSum]
    //resolver por Montante
    X = Montante (dNewMat4)
     //valores evaluados en la regresión
     xCalculated = %e^X(1,1)*dXs^(X(2,1))
     //valor de la estimación
     estPot = %e^X(1,1)*dEst^(X(2,1))
       //caclulo de la r^2
     dR2 = R2(dYs,xCalculated)
     RPot = dR2
     disp("Potencia : y = " + string(%e^(X(1,1))) + " * x^(" + string(X(2,1)) + "), r2 = "+ string(dR2))
     
     disp("Valores Evaluados:")
     disp(xCalculated)
    
endfunction

////////////////////////////////////////////////////
// Instrucciones del programa principal
////////////////////////////////////////////////////

disp("Ingresa los valores de x")
dXs = PidoValores()
disp("Ingresa los valores de y")
dYs = PidoValores()
dEst = PidoEstimacion()

//Calculamos todos los valores que utilizaremos en las regresiones
iN = size(dXs, 2)
dXSum = sum(dXs)
dYSum = sum(dYs)
dX2Sum = sum(dXs^2)
dX3Sum = sum(dXs^3)
dX4Sum = sum(dXs^4)
dXYSum = dXYSuma(dXs, dYs)
dX2YSum = dX2YSuma(dXs, dYs)
dXlnSum = sum(log(dXs))
dYlnSum = sum(log(dYs))
dXln2Sum = sum((log(dXs))^2)
dXYlnSum = dXYlnSuma(dXs, dYs)
dXlnYlnSum = dXlnYlnSuma(dXs, dYs)

RLineal = 0
RCuadr = 0
RExp = 0
RPot = 0

estLineal = 0
estCuadr = 0
estExp = 0
estPot = 0



disp("Modelos:")
//Regresión Lineal
[Rlineal,estLineal] = Lineal(iN, dXs,dYs, dXSum, dX2Sum, dYSum, dXYSum, dEst)
//Regresión Cuadrática
[RCuadr,estCuadr] = Cuadratica(iN, dXs, dYs, dXSum, dX2Sum, dX3Sum, dX4Sum, dYSum, dXYSum, dX2YSum,dEst)
//Regresión Exponencial
[RExp,estExp] = Exponencial(iN, dXs, dYs, dXSum, dX2Sum, dYlnSum, dXYlnSum,dEst)
//Regresión Potencial
[RPot, estPot] = Potencia(iN, dXs, dYs, dXlnSum, dXln2Sum, dYlnSum, dXlnYlnSum,dEst)
//vector de las r2
vR2 = [RLineal,RCuadr,RExp,RPot]

disp("Conclusiones:")
//la mejor r^2
maxR2 = max(vR2)


if(maxR2 == RLineal)
        
disp("El mejor modelo es el lineal con R2 = " + string(RLineal))
disp("Usando el mejor modelo el valor estimado para x = " + string(dEst)+ " es: " + string(estLineal))
end
if(maxR2 == RCuadr)
        
disp("El mejor modelo es el cuadrático con R2 = " + string(RCuadr))
disp("Usando el mejor modelo el valor estimado para x = " + string(dEst)+ " es: " +string(estCuadr))
end

if(maxR2 == RExp)
        
disp("El mejor modelo es el exponencial con R2 = " + string(RExp))
disp("Usando el mejor modelo el valor estimado para x = " + string(dEst)+ " es: " +string(estExp))
end
if(maxR2 == RPot)

disp("El mejor modelo es el potencial con R2 = " + string(RPot))
disp("Usando el mejor modelo el valor estimado para x = " + string(dEst)+ " es: " +string(estPot))
        
end

