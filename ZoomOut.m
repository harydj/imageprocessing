function hasil = ZoomOut( a,v )

    for x = 1:3
        m=v; 
        n=v; 
        c=length(a(1,:,1))/v;
        d=length(a(:,1,1))/v;
        for i=1:d
            for j=1:c 
                hasil(i,j,x) = a(m,n,x);     
                n=n+v;  
            end
                m=m+v;  
                n=v; 
        end
    end

end

