function hasil = crop(A,rect)

x = round(rect(1,1));
y = round(rect(1,2));
baris = round(rect(1,4));
kolom = round(rect(1,3));

hasil = zeros(baris,kolom);

 hasil = A(x:x+baris,y:y+kolom,1:3);

end
