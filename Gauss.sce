
////////////////////////////////////////////////////
// Gauss.sce
// El método Gauss Jordan para resolver matrices
// 
// Erick González
// Victor Villarreal
// 26/2/2019 versión 1.0
////////////////////////////////////////////////////
////////////////////////////////////////////////////
// Gauss_Jordan
//La función recibe una matriz para resolver las 
// incógnitas
// 
//
// Parámetros:
// MAT matriz de entrada
// 
// Retorno:
// X solución de la matriz en forma reducida
// 
////////////////////////////////////////////////////
function X = Gauss_Jordan(MAT)
    
    
    
    for( i = 1 : size(MAT,1)) 
        //el pivote anterior es 
        pivote = MAT(i,i)
        
        for ( j = 1 : size(MAT,2)) 
            //divide cada parte de la columna entre el pivote
            MAT(i,j) = MAT(i,j)/ pivote
            
        end
        
        for(k = 1 : size(MAT,1))
            // mientras que sea diferente el renglón k de i entonces se modifica el factor
            if(k <> i)
            
            factor = -MAT(k,i)
                // cada columna se añade la posición I,J por el factor de cambio anterior
               for ( j = 1 : size(MAT,2))  
             MAT(k,j) = MAT(k,j) +factor*MAT(i,j)
            end
            
             end 
        end
            
    
    end  
    
    
    X = MAT
 
endfunction

////////////////////////////////////////////////////
// Instrucciones del programa principal
////////////////////////////////////////////////////
// se llama para leer la entrada de la matriz
MAT = input("Da la Matriz")
//se llama la función principal para resolver la matriz
X = Gauss_Jordan(MAT)
// despliegar la solución de la matriz
disp(X)
