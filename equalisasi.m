function im2 = equalisasi(im)

[x1,y1] = size(im(:,:,1));
i = imhist(im(:,:,1));
i1 = imhist(im(:,:,2));
i2 = imhist(im(:,:,3));
[x,y] = size(i);
a = sum(i);
a1 = sum(i1);
a2 = sum(i2);

%% menghitung probability kemunculan
for n = 1 : x
    i(n,2) = i(n,1)/a;
    i1(n,2) = i1(n,1)/a;
    i2(n,2) = i2(n,1)/a;
end

b = 0;
b1 = 0;
b2 = 0;

%% Fungsi Transformasi tiap layer
for n = 1 : x
    b = b + i(n,2);
    i(n,3) = b;
    b1 = b1 + i1(n,2);
    i1(n,3) = b1;
    b2 = b2 + i2(n,2);
    i2(n,3) = b2;
end

%% Probabilitas kemunculan level gray (0:255)
for m = 1 : 256
    c(m,1) = (m-1) / 255;
    c(m,2) = (m-1);
end

%% Pemetaan tingkat warna layer 1
for n = 1 : x
    for m = 1 : 256
        if((i(n,3) < c(m,1)) || (i(n,3)==c(m,1)))
            i(n,4) = c(m,1);
            i(n,5) = m;
            break;
        end
    end
end

%% Pemetaan tingkat warna layer 2
for n = 1 : x
    for m = 1 : 256
        if((i1(n,3) < c(m,1)) || (i1(n,3)==c(m,1)))
            i1(n,4) = c(m,1);
            i1(n,5) = m;
            break;
        end
    end
end

%% Pemetaan tingkat warna layer 3
for n = 1 : x
    for m = 1 : 256
        if((i2(n,3) < c(m,1)) || (i2(n,3)==c(m,1)))
            i2(n,4) = c(m,1);
            i2(n,5) = m;
            break;
        end
    end
end

%% Memasukkan hasil equalisasi layer 1 ke matrix baru
for n = 1 : x1
    for m = 1 : y1
        for o = 1 : 256
            if (im(n,m,1) == c(o,2))
                im2(n,m,1) = i(o,5);
                break;
            end
        end
    end
end

%% Memasukkan hasil equalisasi layer 2 ke matriks baru
for n = 1 : x1
    for m = 1 : y1
        for o = 1 : 256
            if (im(n,m,2) == c(o,2))
                im2(n,m,2) = i1(o,5);
                break;
            end
        end
    end
end

%% Memasukkan hasil equalisasi layer 3 matriks baru
for n = 1 : x1
    for m = 1 : y1
        for o = 1 : 256
            if (im(n,m,3) == c(o,2))
                im2(n,m,3) = i2(o,5);
                break;
            end
        end
    end
end

%% konversi matriks baru menjadi unsigned 8 bit agar dapat ditampilkan menjadi gambar
im2 = uint8(im2);
end
