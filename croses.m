clear, clc 
sigma=0.9;
S=100;
k=100;
N=100;
d=0.005;
X=0;
C=0;
B = 0.001 +(k*(1+d)-S)/N;
M=10;
C_array=zeros(M,1);
Fi=zeros(N,1);
S_array=zeros(N, 1);
S_array(1,1) = S;
S1 = normrnd(0, sigma, N, 1); % приращение
    for i=1:N
         
        sigma=0.2;
%         sqrt(i)*
         S = S + B+ S1(i);
         S_array(i+1,1) = S;         
          if (S >= k*(1+d)) && (X==0)  && (S > 0)
            X1 = 0;
            X = 1;
            C=C+1;  
            Fi(i)=i;
        elseif (S >= k) && (X==1) && (S > 0) 
            X1 = 1;
            X = 1;
        elseif (S < k*(1+d)) && (X==0) && (S > 0)
            X1 = 0;
            X = 0;
        elseif (S < k) && (X==1) && (S > 0)     
            X1 = 1;
            X = 0;
            C=C+1;
            Fi(i)=i;
        elseif (S < 0) 
            S = S - S1(i);  
          end  
    C_array(i,1)=C;
    end
C1=sum(C_array);
C2=C1/M;
plot(S_array)
hold on
b=100; 
x=1:0.01:N; 
n=length(x); 
y(1:n)=b; 
plot(x,y, 'k'); 
hold on
b1=101; 
x1=0:0.01:N; 
n1=length(x1); 
y1(1:n1)=b1; 
plot(x1,y1, 'k');
hold off

B=Fi(Fi>0);
if C==0
disp('No croses')
else 
    disp(['Crosses  =  ', num2str(C) ])
end
 


    