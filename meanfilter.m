function A = meanfilter(A);

    for z=1:3
        for m=1:length(A(:,1,1))
            for n=1:length(A(1,:,:))
                for i=m:m+2
                    for j=n:n+2
                        sumx(i,j) = B(i,j,z);
                    end
                end
            sumx = round(sum(sumx(:))/9);
            A(m,n,z) = sumx;
            sumx = 0;
            end
        end
    end
end


