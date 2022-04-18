clc;
close all;
clear all;

f=7; %carrier frequency 
a=2; %amplitude 
n=[1 0 1 1 0 0 0]; %The first 6 bits are used and an extra zero is added at the end to prevent array-size mismatch
t1 = 0:0.01:length(n);
t2 = 0:6;
y=a*sin(2*pi*f*t1);


%plotting the message signal 
subplot(4,1,1);
stairs(t2,n);
title('message signal');
xlabel('time');
ylabel('amplitude');

%plotting the carrier signal 
subplot(4,1,2);
plot(t1,y);
title('carrier signal');
xlabel('time');
ylabel('amplitude');

%modulation 
for i=1:7
    for j=(i-1)*100:i*100
        if(n(i)==1)
            s(j+1)=y(j+1);
        else
            s(j+1)=0;
        end
    end
end

%plotting the modulated signal 
subplot(4,1,3);
plot(t1,s);
title('modulated signal');
xlabel('time');
ylabel('amplitude');


%demodulation 
for i=1:7
    for j=(i-1)*100:i*100
        if(s(j+1)==y(j+1))
            x(j+1)=1;
        else 
            x(j+1)=0;
        end
    end
end

%plotting the demodulated signal 
subplot(4,1,4);
plot(t1,x);
title('ASK demodulated signal');
xlabel('time');
ylabel('amplitude');
