B = {[12 13], [14 15]};
C = {[16 17], [18, 19]};
A = {[2 3], [5 6]; B, C};

[result, index] = isinacell(A,B{1,1})