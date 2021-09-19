function [ret]=myTry_convolution(x_n,h_n,n1,n2)
    H_n=[h_n(end:-1:1) zeros(1,length(h_n)+length(x_n)-2)]; %[1 1 1 1 1 0 0 0 0 0 0 0]
    X_n=[zeros(1,length(h_n)-1) x_n zeros(1,length(h_n)-1)];%[0 0 0 0 8 4 2 1 0 0 0 0]
    
    
    startPt=n1(1) + n2(1);
    endPt=n1(length(n1)) + n2(length(n2));
    num=1;
    for counter=startPt:endPt
        ret(num)=sum(X_n.*H_n);
        disp(ret(num))
        H_n=circshift(H_n,1);
        num=num+1;
    end
end