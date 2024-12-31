close all
clear all
clc

% % Generate Gaussian signal
% N = 16000; % length
% x = randn(N, 1); % signal
% Fs = 8000; % Sampling frequency 
% 
% x_compressed = DCT_IV_compression_example(x, Fs);

% % sine waves
% N = 16000;
% n = 0:N-1;
% 
% % loop for summing sine waves
% x = 0;
% for i = 0:4
%     x = x + (1/2^i) * sin(2 * pi * 2^i / 64 * n);
% end    
% x = x(:); % convert to column vector 
% Fs = 8000;
% 
% x_compressed = DCT_IV_compression_example(x, Fs);

% record audio
audioDuration = 2; % in seconds
[x, Fs] = recorder(audioDuration); % record

x_compressed = DCT_IV_compression_example(x, Fs);

soundsc(x, Fs);  % play the original signal
pause(3.0);
soundsc(x_compressed, Fs);  % play the compressed signal




