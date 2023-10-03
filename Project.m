% Two Link manipulator

% Time
t = [0 30];

% initial state vector
U = [0 0 0.1 0.1 0 0];

% calling the ode solver function using ode45 with odefunction statederivatives.m
[t,Y] = ode45(@statederivatives,t,U);

% plot theta1 and theta2 vs time
figure(1)
plot(t,Y(:,3),'r',t,Y(:,4),'b')
title('Theta1 and Theta2 vs Time')
xlabel('Time (s)')
ylabel('Theta (rad)')
legend('Theta1','Theta2')
