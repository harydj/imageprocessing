function hasil = Resolusi( b )

baris = length(b(:,1,1));
kolom = length(b(1,:,1));
x = num2str(baris);
y = num2str(kolom);
hasil = strcat(x,' x ',y);

end

