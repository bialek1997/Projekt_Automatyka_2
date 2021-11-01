M = 1.5; %Masa platformy
m = 0.5; %Masa wahadła
L = 0.25; %Długość od mocowania wahadła do środka ciężkości
g = 9.80665; %Przyśpieszenie ziemskie

A = [0, 0, 1, 0;
    0, 0, 0, 1;
    0, -(m*g/M), 0, 0;
    0, ((M+m)/M*L)*g, 0, 0];

B = [0;
    0;
    ((0.00105*(M+m))/M);
    -((0.00105*(M+m))/M*L)];

C = [1, 1, 1, 1];

D = 0;

%Test na obserwowanie
ob = obsv(A,C);
rank(ob);

%Test na sterowanie
ct = ctrb(A,B);
rank(ct);

Q = diag([1000, 100, 0, 0]);
R = 1;
K = lqr(A,B,Q,R);
