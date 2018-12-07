function im2 = spesifikasi(ba,bb,im)
[x,y] = size(im(:,:,1));

equali = equalisasi(im);

a = imhist(equali(:,:,1));
a1 = imhist(equali(:,:,2));
a2 = imhist(equali(:,:,3));


hispec = randi([bb,ba],256,1);

%% menghitung probability kemunculan (histogram spec)
for n = 1 : length(hispec)
    hispec(n,2) = hispec(n,1)/sum(hispec(:,1));
end

for n = 1 : length(a)
    a(n,2) = a(n,1)/sum(a(:,1));
    a1(n,2) = a1(n,1)/sum(a1(:,1));
    a2(n,2) = a2(n,1)/sum(a2(:,1));
end

%% Fungsi Transformasi histogram spec
b = 0;
for n = 1 : length(hispec)
    b = b + hispec(n,2);
    hispec(n,3) = b;
    hispec(n,4) = n-1;
end

%% Pemetaan tingkat warna layer 1
for n = 1 : 256
    for m= 1:256
        if (le(a(n,2),hispec(m,3)));
            a(n,3) = hispec(m,1);
            a(n,4) = m;
            break;
        end
    end
end
for n = 1 : 256
    for m= 1:256
        if (le(a1(n,2),hispec(m,3)));
            a1(n,3) = hispec(m,1);
            a1(n,4) = m;
            break;
        end
    end
end
for n = 1 : 256
    for m= 1:256
        if (le(a2(n,2),hispec(m,3)));
            a2(n,3) = hispec(m,1);
            a2(n,4) = m;
            break;
        end
    end
end

%% Memasukkan hasil equalisasi layer 1 ke matrix baru
for n = 1 : x
    for m = 1 : y
        for o = 1 : 256
            if (im(n,m,1) == hispec(o,4))
                im2(n,m,1) = hispec(o,1);
                break;
            end
        end
    end
end
for n = 1 : x
    for m = 1 : y
        for o = 1 : 256
            if (im(n,m,1) == hispec(o,4))
                im2(n,m,2) = hispec(o,1);
                break;
            end
        end
    end
end
for n = 1 : x
    for m = 1 : y
        for o = 1 : 256
            if (im(n,m,1) == hispec(o,4))
                im2(n,m,3) = hispec(o,1);
                break;
            end
        end
    end
end

im2 = uint8(im2);

imshow(im2);
end



