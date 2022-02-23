clc 
clear all 
close all 

fc = 7;
a = 5; 
n = [1,0,0,0,1,0,0,1];
t1 = 0:0.01:length(n);
t2 = 0:7;
t3 = 1:4;
y1p = a*cos(2*pi*fc*t1);
y1n = -a*cos(2*pi*fc*t1);
y2p = a*sin(2*pi*fc*t1);
y2n = -a*sin(2*pi*fc*t1);

%plotting the orginal signal 
subplot(8,1,1);
stairs(t2,n);
title('message signal');
%plotting the odd signal and even signal
even = [1 0 1 0];
odd = [0 0 0 1];
t4 = 0:0.01:length(even);
subplot(8,1,2);
stairs(t3,even);
title('even signal');
subplot(8,1,3);
stairs(t3,odd);
title('odd signal');


        
%plotting the carrier signal 1
subplot(8,1,4);
plot(t1,y1p);
title('carrier signal Y1');




%plotting the carrier signal 2
subplot(8,1,5);
plot(t1,y2p);
title('carrier signal Y1');

%BPSK 1 
for i=1:4
    for j=(i-1)*100:i*100
        if(n(i)==1)
            w(j+1)=y1p(j+1);
        else
            w(j+1)=y1n(j+1);
        end
    end
end

subplot(8,1,6);
plot(t4,w);
title('BPSK 1');


%BPSK 2
for i=1:4
    for j=(i-1)*100:i*100
        if(n(i)==1)
            u(j+1)=y2p(j+1);
        else
            u(j+1)=y2n(j+1);
        end
    end
end
subplot(8,1,7);
plot(t4,u);
title('BPSK 2');
%QPSK 
qpsk = u+w; 
subplot(8,1,8);
plot(t4,qpsk);
title('QPSK');


