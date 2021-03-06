function AB = dilasi(im)

grayscale = rgb2gray(im);
im_biner = not(im2bw(grayscale));

SE = [1 1 1;1 1 1;1 1 1];

A = im_biner;
B = SE;
x = 1;
y = 1;

[p1 q1] = size(A);
[p2 q2] = size(B);

Xb = [];
Yb = [];
n_anggota = 0;

for i=1:p2
    for j=1:q2
        if B(i,j) == 1
            n_anggota = n_anggota + 1;
            Xb(n_anggota) = -x + j;
            Yb(n_anggota) = -y + i;
        end
    end
end

AB = zeros(p1,q1);

%% Dilasi
for i=1:p1
    for j=1:q1
        for z=1:n_anggota
            if A(i,j) == 1
                porosx = j + Xb(z);
                porosy = i + Yb(z);
                if(ge(porosx,1)) && (le(porosx,q1)) && (ge(porosy,1)) && (le(porosy,p1))
                    AB(porosy,porosx) = 1;
                end
            end
        end   
    end
end

end



