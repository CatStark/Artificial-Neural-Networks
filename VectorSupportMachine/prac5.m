clc
clear all


u = [ 0.5 0.7 0.8 1.5 2.0 0.3 0.0 -0.3 -0.5 -1.5; 1.4 1.8 1.6 0.8 1.0 0.5 0.2 0.8 -1.5 -2.2]

s1 = [ 0 0 0 0 0 1 1 1 1 1]

s2 = [ 0 0 0 1 1 0 0 0 1 1]

figure(1)

svmStruct1 = svmtrain(u,s2,'showplot',true);
disp('Bias :');
svmStruct1.Bias     %Extrae el bias
disp('Vector de Pesos :');
svmStruct1.Alpha    %Extrae el vector de pesos

hold on

svmStruct2 = svmtrain(u,s1,'showplot',true);
disp('Bias :');
svmStruct2.Bias     %Extrae el bías
disp('Vector de Pesos :');
svmStruct2.Alpha    %Extrae el vector de pesos

hold off

pause


new_u=[u(1,1:5)-rand u(1,6:10)+rand;
         u(2,1:5)-rand u(2,6:10)+rand]; 


ans1=svmclassify(svmStruct1,new_u','showplot',true);
ans2=svmclassify(svmStruct2,new_u','showplot',true);



%groups=[ans1;ans2];