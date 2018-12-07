function Iedge = DeteksiEdge(im)

%% Deteksi Edge dengan Operator Roberts
Gx = [1 0 ; 0 -1]; % Kernel 1
Gy = [0 1 ; -1 0]; % Kernel 2

    for i=1:3
        Ix = conv2(double(im(:,:,i)), double(Gx), 'same');
        Iy = conv2(double(im(:,:,1)), double(Gy), 'same');
        Iedge(:,:,i) = sqrt(Ix.^2 + Iy.^2);   % Magnitudo Gradien
    end
    
    Iedge = uint8(Iedge);


end