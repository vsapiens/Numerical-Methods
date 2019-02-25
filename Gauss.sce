function X = Gauss_Jordan(MAT)
    
    for( i = 1 : size(MAT,1)) 
        
        pivote = MAT(i,i)
        
        for ( j = 1 : size(MAT,2)) 
            
            MAT(i,j) = MAT(i,j)/ pivote
            
        end
        
        for(k = 1 : size(MAT,1))
            
            if(k <> i)
            
            factor = -MAT(k,i)
            
               for ( j = 1 : size(MAT,2))  
             MAT(k,j) = MAT(k,j) +factor*MAT(i,j)
            end
            
             end 
        end
            
    
    end  
    
    
    X = MAT
 
endfunction


MAT = input("Da la Matriz")

X = Gauss_Jordan(MAT)

disp(X)
