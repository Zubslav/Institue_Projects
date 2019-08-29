%Определение вероятности пересечения полосы нечувствительности ценой опциона методом Монте-Карло

function [P01, P00, P11, P10 ] = probability_montecarlo(N, sigma)
% N=10; %число шагов

d=0.01;
m=10;


S0 =100;
for z=1:m
    
k = 100; %полоса 

d=d+0.001;
d_array(1,m)=d;
B = 0.001 +(k*(1+d)-S0)/N; %коэффициент линейного сноса
C00 = 0;%X_i-1=0, X_i=0
C01 = 0;
C10 = 0;
C11 = 0;
M = 10;
S_array = zeros(M, N+1);% с учетом начального положения
S_array(1,1) = S0;
moments = zeros(M, 1);
S1 = normrnd(0, sigma, M, N); % приращение
for j=1:M
    X1 = 0;%предыдущая позиция позиция
    X = 0;%начальная позиция
    S=S0;
    C=0;%начальное число пересечений
    S_array(j,1)=S;
    for i=1:N
         S = S + B+ S1(j,i);
         S_array(j,i+1) = S;
        if (S >= k*(1+d)) && (X==0)  && (S > 0)
            X1 = 0;
            X = 1;
            C=C+1;
            moments(j,1) = i;            
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
            moments(j,1) = i;
        elseif (S < 0) 
            S = S - S1(i);  
        end
        
    end
    
    if X1 == 0 && X == 0
        C00 = C00 + 1;
    elseif X1==1 && X==0
        C10 = C10 + 1;
    elseif X1==0 && X==1
        C01 = C01 + 1;
    elseif X1==1 && X==1
        C11 = C11 + 1;
    end
       
end

% plot(S_array)

% P1= C01/(C01+C00);
% P2= C10/(C10+C00);
% P3= C00/(C00+C10);
% P4= C11/(C11+C01);
% 
%условная вероятность перехода в состояние 1, если на предпоследнем шаге был 0
P01= C01/M;%(C01+C00);
%условная вероятность перехода в состояние 0, если на предпоследнем шаге был 1
P10= C10/M;%(C10+C11);
%условная вероятность перехода в состояние 0, если на предпоследнем шаге был 0
P00= C00/M;%(C00+C01);
%условная вероятность перехода в состояние 1, если на предпоследнем шаге был 1
P11= C11/M;%(C11+C10);


%disp(P1)
%disp(P4)
%disp(P3)
%disp(P2)


end
        
end


