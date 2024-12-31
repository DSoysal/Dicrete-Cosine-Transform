close all
clear all
clc

N = 10; % define dimension N
x = randi([0, 9], N, 1);


D = mydct4mtx(N); % compute dct by using mydct4mtx generted matrix D
y_mydct = D * x;

y_builtin = dct(x); % compute by built-in function for comparison

% plots
figure;
plot(y_mydct)
hold on

plot(y_builtin)
hold on

title("DCT representation of a 10 element random gaussian number")
legend("mydct4mtx","built-in function")
xlabel("index")
ylabel("singal value")