function hasil = FlipUpDown( a )
    for x = 1:3
    k=length(a(:,1,1));
    c=length(a(1,:,1));
    d=length(a(:,1,1));
        for i = 1:d   
            for j = 1:c      
                hasil(k,j,x) = a(i,j,x);  
            end
        k=k-1; 
        end
    end
end

