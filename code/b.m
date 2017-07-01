function retresult = b(j , n) 
%calculate b(j,n+1)
global h;
global alpha;
retresult = h ^ alpha / alpha;
retresult = retresult * ((n - j + 1) ^ alpha - (n - j) ^ alpha);
end
