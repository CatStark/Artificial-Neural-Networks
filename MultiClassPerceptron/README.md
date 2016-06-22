#Readme

## Muticlass perceptron

### Multiclass perceptron with backpropagation & Levenber-Marquardt methods.

The network used this funciton for learning: 

```
f(x,y)=cos(x)-3sen(y) with 0≤x≤2π y 0≤y≤2π
```

That functions gives this graph

![alt text](/MultiClassPerceptron/retro1.jpg "Original curve")

####Backpropagation

I created 35 neurons on the hidden layer and trained it with backpropagation. 

```Matlab
net = newff(new_xy,new_z,35,{},'trainrp');
```

And this is the estimated graph

![alt text](/MultiClassPerceptron/retro_est.jpg "Estimated curve")

Now we calculate the noise we'll use. What I did was to compare the estimated curve with the original one and used the difference btw those two as noise ¯\_(ツ)_/¯

![alt text](/MultiClassPerceptron/retro_ruido.jpg "Noise")

Finally we test the network and plot

```Matlab
test_xy=[x(:,1) y(:,1)];
for cont=2:n,
r=[-.1+x(:,cont) -.1+y(:,cont)];
test_xy=[test_xy; r];
end
test_xy= test_xy';
test_x = test_xy(1,:);
test_y = test_xy(2,:);
figure
testY = sim(net,test_xy);
```

![alt text](/MultiClassPerceptron/retro_est_nueva.jpg "Close enough!")

#### Levenberg-Marquardt

For the Levenberg-Marquardt method you train the net with:

```Matlab
net = newff(new_xy,new_z,35,{},'trainlm');
```

The error was this:

![alt text](/MultiClassPerceptron/lm_error.jpg "Error for L-M method")

and the result was:

![alt text](/MultiClassPerceptron/lm_ruido.jpg "Better than with backpropagation")




