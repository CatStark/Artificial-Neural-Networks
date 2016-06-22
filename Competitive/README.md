#Readme

This is a competitive NN. 
I have 4 groups of data and I'm ploting different data with different amount of neurons, I want to see here how different the data looks like with different parameters and what is the best option

The training data is 

``` Matlab 
P = [.78 .8 .79 .83 .85 .94 .91 .95 .98 .6 .13 .15 .12 .08 .1 .92 .
9 .94 .9 .7 .4 .45 .42 .43 .39 .42 .9 .63 .59 .61 .58; .3 .29 .25 .27
.28 .31 .89 .65 .68 .71 .7
```

And this is how the data looks like 

![alt text](/Competitive/fig1.jpg "Testing data")

There are 4 groups so there are 4 neurons so far, all of them initialized in (0.5, 0.5), we train the network and make a graph of the final weights

``` Matlab 
net=train(net,P);
w=net.IW{1};
figure
plot(P(1,:),P(2,:),’+r’);
hold on
plot(w(:,1),w(:,2),’ob’);
grid on
``` 

After the training this is how the weights looks like

![alt text](/Competitive/fig2.jpg "Position of the weights of the neurons")

With 3 neurons looks like this

![alt text](/Competitive/fig3.jpg "3 neurons for 4 gropus of data")

And finally, 5 neurons

![alt text](/Competitive/fig4.jpg "5 neurons for 4 gropus of data")
