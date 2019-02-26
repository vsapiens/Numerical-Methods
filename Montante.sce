

////////////////////////////////////////////////////
// Montante.sce
// En este programa se ejecuta el método montante
// para simplificar la matriz
// 
// 
// Erick González
// Victor Villarreal
// 25/2/2019 versión 1.0
////////////////////////////////////////////////////

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
         //despliega la matriz de procedimiento
         disp(MAT)
         
        
    end
    
      //modificas la X para que acomode la respuesta
      for(i = 1:size(MAT,1))
          
          X(i) = MAT(i,size(MAT,1)+1)/pivote
      end
    
endfunction


////////////////////////////////////////////////////
// Instrucciones del programa principal
////////////////////////////////////////////////////

//se recibe la matriz de la 
MAT = input("Da la matriz")

//se ejecuta el método de la montante
X = Montante(MAT)
//se despliega el vector resultante
disp(X)
