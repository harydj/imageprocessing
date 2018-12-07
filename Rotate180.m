function hasil = Rotate180( a )
    for x = 1:3
    k=length(a(:,1,1));
    c=length(a(1,:,1));
    d=length(a(:,1,1));
        for i = 1:d   
            m=length(a(1,:,1));
            for j = 1:c      
                hasil(k,m,x) = a(i,j,x);  
                m=m-1;
            end  
        k=k-1; 
        end
    end
end



