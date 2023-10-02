% Two Link manipulator

% Time
t = [0 10];

% initial state vector
U = [0 0 0.1 0.1 0 0];

% calling the ode solver function using ode45 with odefunction statederivatives.m
[t,Y] = ode45(@statederivatives,t,U);