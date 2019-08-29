
n = 300;
h1=1;
h2=1;
h3=1;
h4=1;
h5=1;
h6=1;
h7=1;
h8=1;

lambda1 = sin(teta);
lambda2 = cos(teta);
teta = 1.47;

x1(0) = 0.1; %начальные условия для самого отображения
x2(0) = 0.1;
x3(0) = 0.1;
x4(0) = 0.1;
x5(0) = 0.1;
x6(0) = 0.1;
x7(0) = 0.1;
x8(0) = 0.1;

xx1(0) = 0.1; %начальные условия для первой системы уравнений в вариациях
xx2(0) = 0.1;
xx3(0) = 0.1;
xx4(0) = 0.1;
xx5(0) = 0.1;
xx6(0) = 0.1;
xx7(0) = 0.1;
xx8(0) = 0.1;

amin = 0.; amax = 3; 
bmin = 0; bmax = 4; 
shag = 0.1;

s = 1; u = 1; g=1;
for a=amin:shag:amax
A(s)= a; 
u=s;
s = s+1; v = 1; 
for b=bmin:shag:bmax
B(v)= b; 
g=v;
v = v+1;

summa = zeros(2,1);


for j=1:n
x1(j+1)=(lambda1)*x1(j)+(a1*(x1(j)*h1+x2(j)*h2)+a2*(x3(j)*h3+x4(j)*h4)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x1(j)+a4*(x1(j)*x5(j)*x7(j)-x1(j)*x6(j)*x8(j)+x2(j)*x5(j)*x8(j));
x2(j+1)=((lambda1)*x2(j)+(a1*(x1(j)*h1+x2(j)*h2)+a2*(x3(j)*h3+x4(j)*h4)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x2(j)+a4*(x1(j)*x5(j)*x8(j)+x1(j)*x6(j)*x7(j)-x2(j)*x5(j)*x7(j)+x2(j)*x6(j)*x8(j));
x3(j+1)=((lambda1)*x3(j)+(a1*(x3(j)*h3+x4(j)*h4)+a2*(x1(j)^2+x2(j)^2)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x3(j)+a4*(x3(j)*x5(j)*x7(j)+x3(j)*x6(j)*x8(j)-x4(j)*x5(j)*x8(j)+x4(j)*x6(j)*x7(j));

x5(j+1)=((lambda2)*x5(j)+(a5*(x5(j)*h5+x6(j)*h6)+a6*(x7(j)*h7+x8(j)*h8)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x5(j)+a8*(x3(j)^2*h7+2*x7(j)*x3(j)*h3-x4(j)^2*h7-2*x7(j)*x4(j)*h4-2*h3*x4(j)*x8(j)-2*x3(j)*h4*x8(j)-2*x3(j)*x4(j)*h8+h7*x1(j)^2+2*x7(j)*x1(j)*h1-h7*x2(j)^2-2*x7(j)*x2(j)*h2+2*h1*x2(j)*x8(j)+2*x1(j)*h2*x8(j)+2*x1(j)*x2(j)*h8);
x6(j+1)=((lambda2)*x6(j)+(a5*(x5(j)*h5+x6(j)*h6)+a6*(x7(j)*h7+x8(j)*h8)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x6(j)+a8*(h8*x3(j)^2+2*x8(j)*x3(j)*h3-h8*x4(j)^2-2*x8(j)*x4(j)*h4+2*h3*x4(j)*x7(j)+2*x3(j)*h4*x7(j)+2*x3(j)*x4(j)*h7-h8*x1(j)^2-2*x8(j)*x1(j)*h1+h8*x2(j)^2+2*x8(j)*x2(j)*h2+2*h1*x2(j)*x7(j)+2*x1(j)*h2*x7(j)+2*x1(j)*x2(j)*h7);
x7(j+1)=((lambda2)*x7(j)+(a5*(x7(j)*h7+x8(j)*h8)+a6*(x5(j)*h5+x6(j)*h6)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x7(j)+a8*(h5*x3(j)^2+2*x5(j)*x3(j)*h3-h5*x4(j)^2-2*x5(j)*x4(j)*h4+2*h3*x4(j)*x6(j)+2*x3(j)*h4*x6(j)+2*x3(j)*x4(j)*h6+h5*x1(j)^2+2*x5(j)*x1(j)*h1-h5*x2(j)^2-2*x5(j)*x2(j)*h2+2*h1*x2(j)*x6(j)+2*x1(j)*h2*x6(j)+2*x1(j)*x2(j)*h6);
x8(j+1)=((lambda2)*x8(j)+(a5*(x7(j)*h7+x8(j)*h8)+a6*(x5(j)*h5+x6(j)*h6)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x8(j)+a8*(h6*x3(j)^2+2*x6(j)*x3(j)*h3-h6*x4(j)^2-2*x6(j)*x4(j)*h4-2*h3*x4(j)*x5(j)-2*x3(j)*h4*x5(j)-2*x3(j)*x4(j)*h5-h6*x1(j)^2-2*x6(j)*x1(j)*h1+h6*x2(j)^2+2*x6(j)*x2(j)*h2+2*h1*x2(j)*x5(j)+2*x1(j)*h2*x5(j)+2*x1(j)*x2(j)*h5);
 

xx1(j+1)=(lambda1)*x1(j)+(a1*(x1(j)*h1+x2(j)*h2)+a2*(x3(j)*h3+x4(j)*h4)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x1(j)+a4*(x1(j)*x5(j)*x7(j)-x1(j)*x6(j)*x8(j)+x2(j)*x5(j)*x8(j));
xx2(j+1)=((lambda1)*x2(j)+(a1*(x1(j)*h1+x2(j)*h2)+a2*(x3(j)*h3+x4(j)*h4)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x2(j)+a4*(x1(j)*x5(j)*x8(j)+x1(j)*x6(j)*x7(j)-x2(j)*x5(j)*x7(j)+x2(j)*x6(j)*x8(j));
xx3(j+1)=((lambda1)*x3(j)+(a1*(x3(j)*h3+x4(j)*h4)+a2*(x1(j)^2+x2(j)^2)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x3(j)+a4*(x3(j)*x5(j)*x7(j)+x3(j)*x6(j)*x8(j)-x4(j)*x5(j)*x8(j)+x4(j)*x6(j)*x7(j));
xx4(j+1)=((lambda1)*x4(j)+(a1*(x3(j)*h3+x4(j)*h4)+a2*(x1(j)^2+x2(j)^2)+a3*(x5(j)*h5+x6(j)*h6+x7(j)*h7+x8(j)*h8))*x4(j)+a4*(-x3(j)*x5(j)*x8(j)+x3(j)*x6(j)*x7(j)-x4(j)*x5(j)*x7(j)-x4(j)*x6(j)*x8(j));
xx5(j+1)=((lambda2)*x5(j)+(a5*(x5(j)*h5+x6(j)*h6)+a6*(x7(j)*h7+x8(j)*h8)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x5(j)+a8*(x3(j)^2*h7+2*x7(j)*x3(j)*h3-x4(j)^2*h7-2*x7(j)*x4(j)*h4-2*h3*x4(j)*x8(j)-2*x3(j)*h4*x8(j)-2*x3(j)*x4(j)*h8+h7*x1(j)^2+2*x7(j)*x1(j)*h1-h7*x2(j)^2-2*x7(j)*x2(j)*h2+2*h1*x2(j)*x8(j)+2*x1(j)*h2*x8(j)+2*x1(j)*x2(j)*h8);
xx6(j+1)=((lambda2)*x6(j)+(a5*(x5(j)*h5+x6(j)*h6)+a6*(x7(j)*h7+x8(j)*h8)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x6(j)+a8*(h8*x3(j)^2+2*x8(j)*x3(j)*h3-h8*x4(j)^2-2*x8(j)*x4(j)*h4+2*h3*x4(j)*x7(j)+2*x3(j)*h4*x7(j)+2*x3(j)*x4(j)*h7-h8*x1(j)^2-2*x8(j)*x1(j)*h1+h8*x2(j)^2+2*x8(j)*x2(j)*h2+2*h1*x2(j)*x7(j)+2*x1(j)*h2*x7(j)+2*x1(j)*x2(j)*h7);
xx7(j+1)=((lambda2)*x7(j)+(a5*(x7(j)*h7+x8(j)*h8)+a6*(x5(j)*h5+x6(j)*h6)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x7(j)+a8*(h5*x3(j)^2+2*x5(j)*x3(j)*h3-h5*x4(j)^2-2*x5(j)*x4(j)*h4+2*h3*x4(j)*x6(j)+2*x3(j)*h4*x6(j)+2*x3(j)*x4(j)*h6+h5*x1(j)^2+2*x5(j)*x1(j)*h1-h5*x2(j)^2-2*x5(j)*x2(j)*h2+2*h1*x2(j)*x6(j)+2*x1(j)*h2*x6(j)+2*x1(j)*x2(j)*h6);
xx8(j+1)=((lambda2)*x8(j)+(a5*(x7(j)*h7+x8(j)*h8)+a6*(x5(j)*h5+x6(j)*h6)+a7*(x1(j)*h1+x2(j)*h2+x3(j)*h3+x4(j)*h4))*x8(j)+a8*(h6*x3(j)^2+2*x6(j)*x3(j)*h3-h6*x4(j)^2-2*x6(j)*x4(j)*h4-2*h3*x4(j)*x5(j)-2*x3(j)*h4*x5(j)-2*x3(j)*x4(j)*h5-h6*x1(j)^2-2*x6(j)*x1(j)*h1+h6*x2(j)^2+2*x6(j)*x2(j)*h2+2*h1*x2(j)*x5(j)+2*x1(j)*h2*x5(j)+2*x1(j)*x2(j)*h5);
 


k = [ xx(j+1), xx2(j+1), xx3(j+1), xx4(j+1), xx5(j+1), xx6(j+1), xx7(j+1), xx8(j+1)]; %этот вектор создаю для удобства

w = k; 

eps=norm( xx1(0), xx2(0), xx3(0), xx4(0), xx5(0), xx6(0), xx7(0), xx8(0) );
wNorm = norm( w ); 


summa(1) = summa(1) + log( wNorm./eps ); %вычисляем сумму для подсчета показателя Ляпунова


xx1(j+1) = eps.*w(1)/wNorm; %нормируем вектора для следующей итерации
xx2(j+1) = eps.*w(2)/wNorm;
xx3(j+1) = eps.*w(2)/wNorm;
xx4(j+1) = eps.*w(2)/wNorm;
xx5(j+1) = eps.*w(2)/wNorm;
xx6(j+1) = eps.*w(2)/wNorm;
xx7(j+1) = eps.*w(2)/wNorm;
xx8(j+1) = eps.*w(2)/wNorm;

end;

lamda = summa(1)/n; %собственно сам показатель Ляпунова
L(u,g)=[lamda];

end
end

contourf(B,A,L);
colorbar