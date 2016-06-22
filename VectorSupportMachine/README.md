#Support Vector Machines

##The goal for this code is to experiment with the classification capacities of a SVM

There are 4 different classes in this example:

1. (0.5, 1.4), (0.7, 1.8), (0.8, 1.6)
2. (1.5, 0.8), (2.0, 1.0)
3. (0.3, 0.5), (0.0, 0.2), (-0.3, 0.8)
4. (-0.5, -1,5), (-1.5, -2.2)

Each group should be classified using different tokens (+, o, x, *)

There are four groups so most likely we'll need two SVM to create the 2 cutting planes, so first thing we need to do is specify the input data and the output expected data for both of the SVM

```Matlab
u = [ 0.5 0.7 0.8 1.5 2.0 0.3 0.0 -0.3 -0.5 -1.5; 1.4 1.8 1.6 0.8 1.0 0.5 0.2 0.8 -1.5 -2.2]

s1 = [ 0 0 0 0 0 1 1 1 1 1]

s2 = [ 0 0 0 1 1 0 0 0 1 1]
```

Now we can create the SVMs that will also crate the cutting planes

```Matlab
svmStruct1 = svmtrain(u,s2,’showplot’,true);
svmStruct1.Bias
svmStruct1.Alpha;

svmStruct2 = svmtrain(u,s1,’showplot’,true);
svmStruct2.Bias
svmStruct2.Alpha;
```

We can plot to see the data we have so far

![alt text](/VectorSupportMachine/fig1.jpg "Classification of the training data")

Now I wanted to test the network using a new vector modifing the input data (u)

```Matlab
new_u=[u(1,1:5)-rand u(1,6:10)+rand;
u(2,1:5)-rand u(2,6:10)+rand];
```

I tested the new points now using "svnclassify"

```Matlab 
ans1=svmclassify(svmStruct1,new_u’,’showplot’,true);
ans2=svmclassify(svmStruct2,new_u’,’showplot’,true);
```

And this is the result

![alt text](/VectorSupportMachine/fig2.jpg "Classification of the modified data")




