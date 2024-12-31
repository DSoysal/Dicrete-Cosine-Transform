function [compressed_signal] = DCT_IV_compression_example(x, Fs)
    % compression parameters
    N = length(x);                    % signal length
    K_vals = round(linspace(0, N-1, 20)); % 20 equal steps for K values
    D = mydct4mtx(N);                 % get DCT-IV matrix from the previous function
    y = D * x;                        % compute DCT-IV of x
    errors = zeros(1, length(K_vals)); % pre-allocate error array

    
    for i = 1:length(K_vals)
        K = K_vals(i);
        % compression
        y0K = y;
        y0K(K+1:end) = 0;

        % obtaining original signal after compression
        x0K = D' * y0K;

        % error
        errors(i) = sqrt(sum((x - x0K).^2));

        % plot results for one example K
        if i == 5 % time step to cut in compression
            % plot original and compressed signal
            figure;
            subplot(2, 1, 1);
            plot(x, 'b'); hold on;
            plot(x0K, 'r--');
            title(['Original vs. Compressed Signal for K = ', num2str(K)]);
            legend('Original', 'Compressed');

            % plot original and compressed DCT-IV
            subplot(2, 1, 2);
            plot(y, 'b'); hold on;
            plot(y0K, 'r--');
            title(['Original vs. Compressed DCT-IV for K = ', num2str(K)]);
            legend('Original DCT-IV', 'Compressed DCT-IV');

            compressed_signal = x0K;
        end
    end

    % final error plot
    figure;
    plot(K_vals, errors, 'k-o');
    title('Error E(K) vs. K');
    xlabel('K'); ylabel('E(K)');
end
