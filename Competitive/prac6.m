clear all;
close all;
P = [.78 .8  .79 .83 .85 .4 .45 .42 .43 .39 .42 .9  .94 .91 .95 .98 .6 .63 .59 .61 .58;
     .13 .15 .12 .08 .1  .3 .29 .25 .27 .28 .31 .89 .92 .9  .94  .9 .7 .65 .68 .71 .7]
figure
plot(P(1,:),P(2,:),'+r');

hold on
grid on
%net=newc([0 1;0 1],4,.2);
%net=newc([0 1;0 1],3,.2);
net=newc([0 1;0 1],5,.2);
w=net.IW{1};
plot(w(:,1),w(:,2),'ob');

net.trainParam.epochs=90;
net=train(net,P);
w=net.IW{1};
figure
plot(P(1,:),P(2,:),'+r');
hold on
plot(w(:,1),w(:,2),'ob');
grid on

figure

P_new= [.592 .923 .821 .421;
        .682 .899 .111 .291];
plot(P_new(:,1),P_new(:,2),'ob');
sim(net,P_new)
