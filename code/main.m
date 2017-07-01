global h;
global alpha;
global tau;
global y;
global yp;
global t;

h = 0.05;
alpha  = 0.95;
tau = 0.8;
bound = 56;
t = [0:h:bound];
maxn = size(t,2)
yp = [0:h:bound+h];
y = t;
y(1) = phi(0);

for n = 1: maxn - 1
    yp(n+1) = 0;
    for j = 1 : n 
        yp(n+1) = yp(n+1) + b(j-1, n-1) * f(t(j),y(j),v(j));
    end
    yp(n+1) = yp(n+1)/gamma(alpha) + phi(0);
    
    y(n+1) = 0;
    for j = 1 : n
        y(n+1) = y(n+1) + a(j-1, n-1) * f(t(j) , y(j) , v(j));
    end
    y(n+1) = y(n+1)/gamma(alpha) + h ^ alpha * f(t(n+1) , yp(n+1) , v(n+1))/gamma(alpha+2) + phi(0);
end

V = t;
for n = 1:maxn -1
    V(n) = v(n);
end
plot(V,y)
