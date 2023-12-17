clear all
fs=20;
sincNum = sin(pi*[-fs:1/fs:fs]);
sincDen= (pi*[-fs:1/fs:fs]);
sincDenZero = find(abs(sincDen) < 10^-10);
sincOp =sincNum ./sincDen;
sincOp(sincDenZero) =1;
alpha=0;
cosNum= cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha* [-fs:1/fs:fs]).^2);
cosDenZero =find(abs(cosDen)<10^-10);
cosOp =cosNum ./cosDen;
cosOp(cosDenZero)= pi/4;
gt_alpha0 =sincOp .*cosOp;
GF_alpha0 = fft(gt_alpha0,1024);
alpha=0.5;
cosNum =cos(alpha*pi*[-fs:1/fs:fs]);
cosDen= (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp =cosNum./cosDen;
cosOp(cosDenZero)=pi/4;
gt_alpha5 =sincOp.*cosOp;
GF_alpha5= fft(gt_alpha5,1024);
alpha=1;
cosNum=cos(alpha*pi*[-fs:1/fs:fs]);
cosDen=(1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero= find(abs(cosDen)<10^-10);
cosOp= cosNum./cosDen;
cosOp(cosDenZero)=pi/4;
gt_alpha1=sincOp.*cosOp;
GF_alpha1 = fft(gt_alpha1,1024);

close all
figure
plot( [-fs:1/fs:fs],[gt_alpha0],'b','linewidth',2)
hold on
plot( [-fs:1/fs:fs],[gt_alpha5],'m','linewidth',2)
plot( [-fs:1/fs:fs],[gt_alpha1],'c','linewidth',2)
legend('alpha=0','alpha=0.5','alpha=1');
grid on
xlabel('time,t')
ylabel('amplitude,g(t)')
title('time domain')
figure
plot([-512:511]/1024*fs,abs(fftshift(GF_alpha0)),'b','linewidth',2);
hold on
plot([-512:511]/1024*fs,abs(fftshift(GF_alpha5)),'m','linewidth',2);
plot([-512:511]/1024*fs,abs(fftshift(GF_alpha1)),'c','linewidth',2);
legend('alpha=0','alpha=0.5','alpha=1');
axis([-2 2 0 14])
grid on
xlabel('frequency,f')
ylabel('amplitude, |G(f)|')
title('frequency domain')



