function D = mydct4mtx(N)
    D = zeros(N, N); %initialize the matrix D according to the input value
    constant = sqrt(2 / N); 

    %loop over each element to compute the matrix entries
    for k = 0:N-1
        for n = 0:N-1
            D(k+1, n+1) = constant * cos(pi / (4 * N) * (2 * n + 1) * (2 * k + 1));
        end
    end
end
