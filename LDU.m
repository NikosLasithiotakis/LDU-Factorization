% input: an orthogonal matrix A (NxN)
% output: matrixes L, D, U and P (all must be of size NxN)

function [L,D,U,P] = LDU(A)
    [rA, cA] = size(A);
    if rA ~= cA
        output = "Bad Input!"
        L = [];
        D = [];
        U = [];
        P = [];
    else
        L = zeros(rA, cA);
        D = zeros(rA, cA);
        U = zeros(rA, cA);
        P = zeros(rA, cA);
        for i = 1 : rA
            for j = 1 : cA
                if (i == j) 
                    P(i,j) = 1;
                end
            end
        end
        U = A;
        for i = 1 : (cA - 1) 
            for j = i + 1 : cA 
                if (U(i,i) ~= 0)
                    l = U(j,i) / U(i,i);
                    L(j,i) = l;
                    U(j,:) = U(j,:) - l * U(i,:);
                else
                    temp = U(i,:);
                    U(i,:) = U(i + 1, :);
                    U(i + 1,:) = temp;
                    temp = P(i,:);
                    P(i,:) = P(i + 1, :);
                    P(i + 1,:) = temp;
                    temp = L(i,:);
                    L(i,:) = L(i + 1, :);
                    L(i + 1,:) = temp;
                end
            end
        end
        for i = 1 : rA
            for j = 1 : cA
                if (i == j) 
                    L(i,j) = 1;
                end
            end
        end
        for i = 1 : rA
            if (U(i,i) ~= 0)
                D(i,i) = U(i,i);
                U(i, :) = U(i, :) / U(i,i);
            end
        end
    end
    L
    D
    U
    P
end