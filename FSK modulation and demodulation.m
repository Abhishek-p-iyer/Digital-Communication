clc;
close all;
clear all;

f1=7;%carrier frequency f1
f2=4;%carrier frequency f2
a=5; %amplitude 
n=[1 0 1 1 0 ]; %The first 4 bits are used and an extra zero is added at the end to prevent array-size mismatch
t1 = 0:0.01:length(n);
t2 = 0:4;
y1=a*sin(2*pi*f1*t1);
y2=a*sin(2*pi*f2*t1);



%plotting the message signal 
subplot(5,1,1);
stairs(t2,n);
title('message signal');
xlabel('time');
ylabel('amplitude');

%plotting the carrier signal y1
subplot(5,1,2);
plot(t1,y1);
title('carrier signal Y1');
xlabel('time');
ylabel('amplitude');


%plotting the carrier signal y2
subplot(5,1,3);
plot(t1,y2);
title('carrier signal Y2');
xlabel('time');
ylabel('amplitude');


%modulation 
for i=1:5
    for j=(i-1)*100:i*100
        if(n(i)==1)
            z(j+1)=y1(j+1);
        else
            z(j+1)=y2(j+1);
        end
    end
end

%plotting the modulated signal 
subplot(5,1,4);
plot(t1,z);
title('modulated signal');
xlabel('time');
ylabel('amplitude');


%demodulation 
for i=1:5
    for j=(i-1)*100:i*100
        if(z(j+1)==y1(j+1))
            x(j+1)=1;
        else 
            x(j+1)=0;
        end
    end
end

%plotting the demodulated signal 
subplot(5,1,5);
plot(t1,x);
title('FSK demodulated signal');
xlabel('time');
ylabel('amplitude');
