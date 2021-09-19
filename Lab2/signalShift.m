function [ret]=signalShift(sig,value)
    siz=length(sig);
    ret=zeros(1,siz+value);
        if value>0
            disp(length(ret(value+2:end)))
            disp(length(sig(1:end)))
            ret(value+3:end)=sig(1:end-value);
        else
            ret(1:end+value)=sig(-value+1:end);
        end
end