clear all,clc,close all
I = imread('new_image.jpeg');
gray=im2double(I);
[N M]=size(gray);
SNR0 = 0;
SNR10 = 10;
SNR20 = 20;
SNR30 = 30;
qmax=1;
qmin=0;

PS=sum(sum(gray.^2))/(M*N);

%0 db Gurultulu Fotograf
sigma0 = PS./(10^(0.1*SNR0));
W0 = sqrt(sigma0).*randn(N,M);
A0= plus(gray,W0);

%10 db Gurultulu Fotograf
sigma10 = PS./(10^(0.1*SNR10));
W10 = sqrt(sigma10).*randn(N,M);
A10= plus(gray,W10);

%20 db Gurultulu Fotograf
sigma20 = PS./(10^(0.1*SNR20));
W20 = sqrt(sigma20).*randn(N,M);
A20= plus(gray,W20);

%30 db Gurultulu Fotograf
sigma30 = PS./(10^(0.1*SNR30));
W30 = sqrt(sigma30).*randn(N,M);
A30= plus(gray,W30);

% Suzgecler icin matrisler

ags1 = [1 1 1;1 1 1;1 1 1]/9;
ags2 = [1 1 1;1 2 1;1 1 1]*(1/10);
ags3 = [1 2 1;2 4 2;1 2 1]*(1/16);
ags11 = ones(7,7)/9;
ags31 = [   1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 2 1 1 1;
            1 1 2 4 2 1 1;
            1 1 1 2 1 1 1;
            1 1 1 1 1 1 1;
            1 1 1 1 1 1 1;]*(1/16);

%Figur 1: 

B(1:N+2,1:M+2)=zeros;
[Nb Mb]=size(B);
B(2:Nb-1,2:Mb-1)=A0;
[nmr nmc] = size (ags1);
nyr = Nb-nmr+1;
nyc = Mb-nmc+1;
y_fig1_a=zeros(nyr,nyc);

for yr=1:nyr
    for yc=1:nyc
        sum=0;
        for mr=1:nmr
            for mc=1:nmc
                sum = sum +B(yr-mr+nmr,yc-mc+nmc).*ags1(mr,mc);
            end
        end
        y_fig1_a(yr,yc)=sum;
    end
end

y_fig1_b = conv2(A0,ags2,'same');
y_fig1_c = conv2(A0,ags3,'same');

y_fig1_amax=max(max(y_fig1_a));
y_fig1_amin=min(min(y_fig1_a));
beta_y_fig1_a=round(qmax-qmin)./(y_fig1_amax-y_fig1_amin);
q_fig1_a = (beta_y_fig1_a*(y_fig1_a-y_fig1_amin));

y_fig1_bmax=max(max(y_fig1_b));
y_fig1_bmin=min(min(y_fig1_b));
beta_y_fig1_b=round(qmax-qmin)./(y_fig1_bmax-y_fig1_bmin);
q_fig1_b = (beta_y_fig1_b*(y_fig1_b-y_fig1_bmin));

y_fig1_cmax=max(max(y_fig1_c));
y_fig1_cmin=min(min(y_fig1_c));
beta_y_fig1_c=round(qmax-qmin)./(y_fig1_cmax-y_fig1_cmin);
q_fig1_c = (beta_y_fig1_c*(y_fig1_c-y_fig1_cmin));

%Figur 2:

y_fig2_a = conv2(A10,ags1,'same');
y_fig2_b = conv2(A10,ags2,'same');
y_fig2_c = conv2(A10,ags3,'same');

y_fig2_amax=max(max(y_fig2_a));
y_fig2_amin=min(min(y_fig2_a));
beta_y_fig2_a=round(qmax-qmin)./(y_fig2_amax-y_fig2_amin);
q_fig2_a = (beta_y_fig2_a*(y_fig2_a-y_fig2_amin));

y_fig2_bmax=max(max(y_fig2_b));
y_fig2_bmin=min(min(y_fig2_b));
beta_y_fig2_b=round(qmax-qmin)./(y_fig2_bmax-y_fig2_bmin);
q_fig2_b = (beta_y_fig2_b*(y_fig2_b-y_fig2_bmin));

y_fig2_cmax=max(max(y_fig2_c));
y_fig2_cmin=min(min(y_fig2_c));
beta_y_fig2_c=round(qmax-qmin)./(y_fig2_cmax-y_fig2_cmin);
q_fig2_c = (beta_y_fig2_c*(y_fig2_c-y_fig2_cmin));

%Figur 3:

y_fig3_a = conv2(A30,ags1,'same');
y_fig3_b = conv2(A30,ags2,'same');
y_fig3_c = conv2(A30,ags3,'same');

y_fig3_amax=max(max(y_fig3_a));
y_fig3_amin=min(min(y_fig3_a));
beta_y_fig3_a=round(qmax-qmin)./(y_fig3_amax-y_fig3_amin);
q_fig3_a = (beta_y_fig3_a*(y_fig3_a-y_fig3_amin));

y_fig3_bmax=max(max(y_fig3_b));
y_fig3_bmin=min(min(y_fig3_b));
beta_y_fig3_b=round(qmax-qmin)./(y_fig3_bmax-y_fig3_bmin);
q_fig3_b = (beta_y_fig3_b*(y_fig3_b-y_fig3_bmin));

y_fig3_cmax=max(max(y_fig3_c));
y_fig3_cmin=min(min(y_fig3_c));
beta_y_fig3_c=round(qmax-qmin)./(y_fig3_cmax-y_fig3_cmin);
q_fig3_c = (beta_y_fig3_c*(y_fig3_c-y_fig3_cmin));

%Figur 4:

y_fig4_a = conv2(A0,ags1,'same');
y_fig4_b = conv2(A0,ags11,'same');

y_fig4_amax=max(max(y_fig4_a));
y_fig4_amin=min(min(y_fig4_a));
beta_y_fig4_a=round(qmax-qmin)./(y_fig4_amax-y_fig4_amin);
q_fig4_a = (beta_y_fig4_a*(y_fig4_a-y_fig4_amin));

y_fig4_bmax=max(max(y_fig4_b));
y_fig4_bmin=min(min(y_fig4_b));
beta_y_fig4_b=round(qmax-qmin)./(y_fig4_bmax-y_fig4_bmin);
q_fig4_b = (beta_y_fig4_b*(y_fig4_b-y_fig4_bmin));

%Figur 5:

y_fig5_a = conv2(A20,ags1,'same');
y_fig5_b = conv2(A20,ags11,'same');

y_fig5_amax=max(max(y_fig5_a));
y_fig5_amin=min(min(y_fig5_a));
beta_y_fig5_a=round(qmax-qmin)./(y_fig5_amax-y_fig5_amin);
q_fig5_a = (beta_y_fig5_a*(y_fig5_a-y_fig5_amin));

y_fig5_bmax=max(max(y_fig5_b));
y_fig5_bmin=min(min(y_fig5_b));
beta_y_fig5_b=round(qmax-qmin)./(y_fig5_bmax-y_fig5_bmin);
q_fig5_b = (beta_y_fig5_b*(y_fig5_b-y_fig5_bmin));


%Figur 6:

y_fig6_a = conv2(A0,ags3,'same');
y_fig6_b = conv2(A0,ags31,'same');

y_fig6_amax=max(max(y_fig6_a));
y_fig6_amin=min(min(y_fig6_a));
beta_y_fig6_a=round(qmax-qmin)./(y_fig6_amax-y_fig6_amin);
q_fig6_a = (beta_y_fig6_a*(y_fig6_a-y_fig6_amin));

y_fig6_bmax=max(max(y_fig6_b));
y_fig6_bmin=min(min(y_fig6_b));
beta_y_fig6_b=round(qmax-qmin)./(y_fig6_bmax-y_fig6_bmin);
q_fig6_b = (beta_y_fig6_b*(y_fig6_b-y_fig6_bmin));

%Figur 7:

y_fig7_a = conv2(A20,ags3,'same');
y_fig7_b = conv2(A20,ags31,'same');

y_fig7_amax=max(max(y_fig7_a));
y_fig7_amin=min(min(y_fig7_a));
beta_y_fig7_a=round(qmax-qmin)./(y_fig7_amax-y_fig7_amin);
q_fig7_a = (beta_y_fig7_a*(y_fig7_a-y_fig7_amin));

y_fig7_bmax=max(max(y_fig7_b));
y_fig7_bmin=min(min(y_fig7_b));
beta_y_fig7_b=round(qmax-qmin)./(y_fig7_bmax-y_fig7_bmin);
q_fig7_b = (beta_y_fig7_b*(y_fig7_b-y_fig7_bmin));

% Görüntüleme komutları
figure %1
subplot(2,2,1),imshow(A0);title('SNR=0db Gurultu Eklenmis Orjinal Resim');
subplot(2,2,2),imshow(q_fig1_a);title('AGS 1');
subplot(2,2,3),imshow(q_fig1_b);title('AGS 2');
subplot(2,2,4),imshow(q_fig1_c);title('AGS 3');

figure %2
subplot(2,2,1),imshow(A10);title('SNR=10db Gurultu Eklenmis Orjinal Resim');
subplot(2,2,2),imshow(q_fig2_a);title('AGS 1');
subplot(2,2,3),imshow(q_fig2_b);title('AGS 2');
subplot(2,2,4),imshow(q_fig2_c);title('AGS 3');

figure %3
subplot(2,2,1),imshow(A30);title('SNR=30db Gurultu Eklenmis Orjinal Resim');
subplot(2,2,2),imshow(q_fig3_a);title('AGS 1');
subplot(2,2,3),imshow(q_fig3_b);title('AGS 2');
subplot(2,2,4),imshow(q_fig3_c);title('AGS 3');

figure %4
subplot(1,3,1),imshow(A0);title('SNR=0 db Gurultu Eklenmis Orjinal Resim');
subplot(1,3,2),imshow(q_fig4_a);title('AGS 1 3x3 Boyut');
subplot(1,3,3),imshow(q_fig4_b);title('AGS 1 7x7 Boyut');

figure %5
subplot(1,3,1),imshow(A20);title('SNR=20db Gurultu Eklenmis Orjinal Resim');
subplot(1,3,2),imshow(q_fig5_a);title('AGS 1 3x3 Boyutta');
subplot(1,3,3),imshow(q_fig5_b);title('AGS 1 7x7 Boyutta');

figure %6
subplot(1,3,1),imshow(A0);title('SNR=0db Gurultu Eklenmis Orjinal Resim');
subplot(1,3,2),imshow(q_fig6_a);title('AGS 3 3x3 Boyut');
subplot(1,3,3),imshow(q_fig6_b);title('AGS 3 7x7 Boyut');

figure %7
subplot(1,3,1),imshow(A20);title('SNR=20db Gurultu Eklenmis Orjinal Resim');
subplot(1,3,2),imshow(q_fig7_a);title('AGS 3 3x3 Boyut');
subplot(1,3,3),imshow(q_fig7_b);title('AGS 3 7x7 Boyut');

figure
imshow(I);title('Griye Cevrilen Orjinal Resim');

