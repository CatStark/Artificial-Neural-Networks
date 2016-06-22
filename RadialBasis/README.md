#Readme

## NN with pseudoinverse learning algorithm learning from the function

```
f(x,y)=cos(x)-3sen(y) with 0≤x≤2π y 0≤y≤2π
```

This is the graph for that function 

![alt text](/RadialBasis/patrones.jpg "Original curve")

And then I trained it with pseudoinverse

```Matlab
net=newrbe(new_xy,new_z); %pseudoinversa
w=net.IW{1}
bias = net.b
```

Which gives this graph

![alt text](/RadialBasis/funcion_aprox.jpg "Aproximated curve")

We can graph the error:

```Matlab
e_z= Z_est-new_z;
figure
plot(new_xy,e_z,'-r')
grid on
title('Error')
```

![alt text](/RadialBasis/error.jpg "error")

And finally we test it with new data

![alt text](/RadialBasis/aprox_new.jpg "Aprox with new data")
