function hasil = ZoomIns( a,v )

    for x = 1:3
        m=v; 
        n=v; 
        y=1;
        z=1;
        c=length(a(1,:,1));
        d=length(a(:,1,1));
        for i=1:d
            for j=1:c 
                for y=m:-1:m-(v-1)
                    for z=n:-1:n-(v-1)
                        hasil(y,z,x) = a(i,j,x);    
                    end
                end 
                n=n+v
            end
            m=m+v
            n=v;
        end
    end

end

