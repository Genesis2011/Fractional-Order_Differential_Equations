function result = v(n)
global h;
global y;
global yp;
global tau;
    if tau >= (n - 1) * h
        result = phi((n - 1)*h - tau);
    else
        m = floor(tau / h);
        delta = m - tau / h; 
        if m > 1
            result = delta * y(n-m+2) + (1-delta) * y(n-m+1);
        else
            result = delta * yp(n+1) + (1-delta) * y(n);
        end
    end
end