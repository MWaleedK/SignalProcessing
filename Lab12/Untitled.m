v = VideoReader('Vid.mp4');
D = v.Duration;
Fs=30;
t=0:1/Fs:D-(1/Fs);

x=downsample(v,2);