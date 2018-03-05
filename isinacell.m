function [result, index] = isinacell(A,B)
    if isempty(A) == 1
        result = 0; index = 0;
        return;
    end
    size_of_A = size(A);
    for n = 1:size_of_A(1)
        for m = 1:size_of_A(2)
            if iscell(A{n,m})
                [result1, index1] = isinacell(A{n,m},B);
                if result1 ~= 0
                    result = result1; index = [n m; index1];
                    return;
                end
            end
            if min(size(A{n,m}) == size(B)) && min(min(A{n,m} == B))
                result = 1; index = [n m];
                return;
            end
        end
    end
    result = 0; index = 0;
    return;