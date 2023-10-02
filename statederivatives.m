function [t,U] = statederivatives(t,X)
        % Parameters
        m1 = 10;
        m2 = 5;
        l1 = 0.2;
        l2 = 0.1;
        g = 9.81;
        
        % Matrix Definitions
        M11 = m1*l1^2 + m2*(l1^2 + l2^2 + 2*l1*l2*cos(X(4)));
        M12 = m2*(l2^2 + l1*l2*cos(X(4)));
        M21 = m2*(l2^2 + l1*l2*cos(X(4)));
        M22 = m2*l2^2;
        
        C11 = -m2*l1*l2*sin(X(4))*X(6);
        C12 = -m2*l1*l2*sin(X(4))*(X(5) + X(6));
        C21 = m2*l1*l2*sin(X(4))*X(6);
        C22 = 0;
        
        G1 = (m1*l1 + m2*l1)*g*cos(X(3)) + m2*l2*g*cos(X(3) + X(4));
        G2 = m2*l2*g*cos(X(3) + X(4));
        
        % M, C, G matrices
        M = [M11 M12; M21 M22];
        C = [C11 C12; C21 C22];
        G = [G1; G2];
        
        % Desired Trajectory
        theta1d = 0;
        theta2d = 0;

        % Gain Parameters
        Kp1 = 30;
        Kd1 = 15;
        Ki1 = 20;
        Kp2 = 30;
        Kd2 = 20;
        Ki2 = 20;

        % Derivative Matrix
        U = zeros(1,6);
        U(1) = theta1d - X(3);
        U(2) = theta2d - X(4);
        U(3) = X(5);
        U(4) = X(6);
        U(5:6) = -inv(M)*(C*X(5:6)+G)+[Kp1*(U(1))-Kd1*X(5)+Ki1*X(1); Kp2*(U(2))-Kd2*X(6)+Ki2*X(2)];
end