clear; 
clc;


m=500;
d=0;
d_array = zeros(1,m);
q_array = zeros(1,m);
for i=1:m
    [p1 , L1, q, p2, L2] = test19([0 0 0], 1 , 0.2, d);
    d=d+0.0001;
    d_array(1,i)=d;
    q_array(1,i)=q;
end
[x, ind]=max(q_array);

Q=d_array(1,ind)

plot(d_array, q_array)

