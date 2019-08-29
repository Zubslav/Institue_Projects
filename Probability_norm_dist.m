%Определение вероятности пересечения полосы нечувствительности ценой опциона

function [p1 , L1, q, p2, L2] = Probability_norm_dist(x, calc_full, sigma0,d )

k = 100;
S0 = 100;
N=max(size(x));
E = zeros(1,N); 
B = 0.001 +(k*(1+d)-S0)/N; 

l = zeros(1,N);
u = zeros(1,N);
l_array = zeros(1,N);


for i=1:N 
    if i==1 && x(1,1)==0 && S0<=k %ïåðâûé øàã, èç 0 â 0 
        l(i)= -inf;
        u(i) = (k*(1+d)-S0-i*B)/sigma0; 
         l_array(i) = 0; 
    elseif i==1 && x(1,1)==1 && S0<=k %ïåðâûé øàã, 0 â 1
        l(i) = (k*(1+d)-S0-i*B)/sigma0;
        u(i) = inf;
        l_array(i) = k*(1+d); 
    elseif i==1 && x(1,1)==0 && S0>=k*(1+d)%ïåðâûé øàã, 1 â 0
        l(i)= -inf;
        u(i)= (k-S0-i*B)/sigma0; 
        l_array(i) = -k; 
    elseif i==1 && x(1,1)==1 && S0>=k*(1+d) %ïåðâûé øàã , 1 â 1
        l(i) = (k-S0-i*B)/sigma0;
        u(i) = inf;     
        l_array(i) = 0; 
    elseif x(1,i-1)==0 && x(1,i)==0 % 0 - 0
        l(i)= -inf;
        u(i) = (k*(1+d)-S0-i*B)/sigma0;     
        l_array(i) = 0; 
    elseif x(1,i-1)==0 && x(1,i)==1 % 0 - 1
        l(i) = (k*(1+d)-S0-i*B)/sigma0;
        u(i) = inf;   
         l_array(i) = k*(1+d);
    elseif x(1,i-1)==1 && x(1,i)==1 % 1 - 1   
        l(i) = (k-S0-i*B)/sigma0;
        u(i) = inf;        
        l_array(i) = 0; 
    elseif x(1,i-1)==1 && x(1,i)==0  % 1-0
        l(i)= -inf;
        u(i)= (k-S0-i*B)/sigma0;     
        l_array(i) = -k; 
    end
    
end

cov=zeros(N,N);
for q=1:N
    for j=1:N
        cov(q,j)=sqrt(min(q,j));
    end     
end
% disp(cov)

p1 = mvncdf(l, u, E, cov);
L1 = sum(l_array);

q = L1*p1 ;

if(calc_full == 1 && max(size(x)) > 1)
    p2 = 0;
    L2=0;
    j=max(size(x));
    res = zeros(2^j,j);
    for i=1:2^j
        tmp = i;
        for k=j:-1:1
            if tmp-(2^(k-1))>0
                res(i,k)=1;
                tmp = tmp - (2^(k-1));
            end
        end
        [tp, tp1,tp2, ~ ] = test19 (res(i, :), 0, sigma0,d);
        L2 = L2 + tp1;
        p2 = p2 + tp;
        q= q +tp2;
    end
elseif(calc_full == 0)
    p2=0;
else
    p2 = p1;
end



end

