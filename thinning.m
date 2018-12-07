function AB7 = thinning(im)

grayscale = rgb2gray(im);
im_biner = not(im2bw(grayscale));

SE1 = [0 0 0;0 1 0;1 1 1];
SE2 = [0 0 0;1 1 0;1 1 0];
SE3 = [1 0 0;1 1 0;1 0 0];
SE4 = [1 1 0;1 1 0;0 0 0];
SE5 = [1 1 1;0 1 0;0 0 0];
SE6 = [0 1 1;0 1 1;0 0 0];
SE7 = [0 0 1;0 0 1;0 1 1];
SE8 = [0 0 0;0 1 1;0 1 1];

A = im_biner;
B1 = SE1;
B2 = SE2;
B3 = SE3;
B4 = SE4;
B5 = SE5;
B6 = SE6;
B7 = SE7;
B8 = SE8;

[p1 q1] = size(A);
AB = ones(p1,q1);



 B1;
 AB = erosi(im,B1);
 AB1 = erosi(im,B2,AB);
 AB2 = erosi(im,B3,AB1);
 AB3 = erosi(im,B4,AB2);
 AB4 = erosi(im,B5,AB3);
 AB5 = erosi(im,B6,AB4);
 AB6 = erosi(im,B7,AB5);
 AB7 = erosi(im,B8,AB6);
 

 end