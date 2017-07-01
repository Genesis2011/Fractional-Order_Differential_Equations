function result = a(j,n) 
%calculate a(j,n+1)
global alpha;
global h;
    if j == n+1
        result = 1;
    elseif j == 0
        result = n ^ (alpha + 1) - (n - alpha) * (n + 1) ^ alpha;
    else
        result = (n - j + 2) ^ (alpha + 1) + (n - j) ^ (alpha + 1) - 2 * (n - j + 1) ^ (alpha + 1);
    end
result = result * h^alpha / (alpha * (alpha + 1));
end