function hasil = FlipLR( a )
    for x = 1:3
    c=length(a(1,:,1));
    d=length(a(:,1,1));
        for i = 1:d 
            k=length(a(1,:,1));
            for j = 1:c      
                hasil(i,k,x) = a(i,j,x);  
                k=k-1; 
            end
        end
    end
end

