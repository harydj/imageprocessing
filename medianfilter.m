function A = medianfilter(A)

p=1;
    for z=1:3
        for m=1:length(A(:,1,1))
            for n=1:length(A(1,:,:))
                for i=m:m+2
                    for j=n:n+2
                        sumx(1,p) = B(i,j,z);
                        p = p+1;
                    end
                end
            p=1;
            sumx = sort(sumx,'ascend');
            med = median(sumx);
            A(m,n,z) = med;
            sumx = 0;
            end
        end
    end
end


