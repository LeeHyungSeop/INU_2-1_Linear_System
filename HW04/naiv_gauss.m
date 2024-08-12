
A=[3 2 1;2 1 1;6 2 4]; 
b=[3;0;6];

n = length(b); x = zeros(n,1);
for k=1:n-1 % forward elimination
    for i=k+1:n
     xmult = A(i,k)/A(k,k);
        for j=k+1:n
         A(i,j) = A(i,j)-xmult*A(k,j);
        end
        b(i) = b(i)-xmult*b(k);
    end
end
A
b
% back substitution

x(n) = b(n)/A(n,n);
for i=n-1:-1:1
    sum = b(i);
        for j=i+1:n
            sum = sum-A(i,j)*x(j);
        end
    x(i) = sum/A(i,i);
end
