% Time
t = [0 30];

% initial state vector
U = [0 0 0.1 0.1 0 0];

[t,Y] = ode45(@statederivatives,t,U);

% plot q1 and q2 vs time
figure(1)
plot(t,Y(:,3),'r',t,Y(:,4),'b')
title('q1 and q2 vs Time')
xlabel('Time (s)')
ylabel('q1 and q2 (rad)')
legend('q1','q2')
