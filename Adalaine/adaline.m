%Susana G.
% CUCEI Universidad de Guadalajara 2012
%Adaline with Ikeda


close all;
clear all;
clc
%t=0:.1:30
%I=sin(t)
% 
I=ikeda(100); %Ikeda map
I=I';
maxlr = maxlinlr(I,'bias');
d=[0 1 2 4 5 6 7 8 9];
net = newlin((minmax(I)),1,d,maxlr);
net.adaptParam.passes=100;
[net,y,e,pf] = adapt(net,con2seq(I),con2seq(I));

%We need to convert the output as "adapt()" was used
z1=seq2con(y);
sal=z1{1};
error=I-sal;

% figure (1)
% hold on
% plot(I,'b');
% plot(error,'r')
% plot(sal,'g')
% title('Señales')

figure (1)
subplot(2,1,1); plot(I,'b')
title('System Reference')
subplot(2,1,2); plot(sal,'r')
title('System Predicted Output')

figure(2)
hold on
plot(error,'b')
title('Error')
hold off
