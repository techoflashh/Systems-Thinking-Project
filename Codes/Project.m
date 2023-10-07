% Time Grid
t = [0 30];

% Initial State Vector
X0 = [0 0 0.1 0.1 0 0];

[t,Y] = ode45(@statederivatives,t,X0);

% Plot of q1 and q2 vs Time
figure(1)
plot(t,Y(:,3),'r',t,Y(:,4),'b')
title('q_1 and q_2 vs Time')
xlabel('Time (s)')
ylabel('q_1 and q_2 (rad)')
legend('q_1','q_2')