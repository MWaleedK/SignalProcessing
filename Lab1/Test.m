t0=(-2:0.01:-1);
t1=(0:0.01:1);
t2=(-1:0.01:0);
t4=(1:0.01:2);
counter=length(t);
unitstep=((t1)>=0);
ramp=(t1.*unitstep);
zeros1=length(zeros(t0));
hold on
plot(t0,zeros1)
plot(t2,ramp,'LineWidth',5,'color',[0,0.2,0.8])
plot(t1,unitstep,'LineWidth',5,'color',[0,0.5,0.6])
plot(t4,zeros1,'LineWidth',5,'color',[0,0.5,0.6])
hold off