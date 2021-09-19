function ret=myTry_movingAverage(x_n,num)
    x=[0 x_n 0];
    for counter=1:length(x)-2
        counter=counter+1;
        ret(counter-1)=((x(counter-1)/num)+(x(counter)/num)+(x(counter+1)/num));
    end
end