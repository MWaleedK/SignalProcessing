function [audio,Fs]=resamplingFunc_2(inp,target,Audio)
    if inp<target
        audio=resample(Audio,inp,target);
        Fs=inp;
    elseif target<inp
        audio=resample(Audio,target,inp);
        Fs=target;
    else
        audio=Audio;
        Fs=target;
    end
end