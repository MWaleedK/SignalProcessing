x_n=[1 1 1 1 1];
h_n=[8 4 2 1];
n1=-2:1:2;
n2=0:1:3;
disp(myTry_convolution(x_n,h_n,n1,n2));
disp(conv(x_n,h_n))