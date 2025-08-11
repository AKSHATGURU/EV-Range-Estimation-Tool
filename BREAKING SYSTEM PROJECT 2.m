%% Regenerative Braking Simulation - MATLAB
% Author: Akshat Kumar
% Year: 2025
% Description:
% Simulates regenerative braking in a hybrid/electric vehicle and calculates
% recovered energy during deceleration.

clear; clc; close all;

% ------------------------------
% Vehicle Parameters
% ------------------------------
m = 1500;               % mass of vehicle (kg)
v0 = 20;                 % initial speed (m/s) ~ 72 km/h
v_end = 0;               % final speed (m/s)
regen_eff = 0.75;        % regenerative braking efficiency (75%)
wheel_radius = 0.3;      % wheel radius (m)
g = 9.81;                % gravity (m/s^2)

% ------------------------------
% Deceleration Parameters
% ------------------------------
decel = 2;               % constant deceleration (m/s^2)
time = (v0 - v_end) / decel;   % braking time
t = linspace(0, time, 200);    % time vector
v = v0 - decel * t;            % velocity profile

% ------------------------------
% Energy Calculations
% ------------------------------
% Kinetic Energy at each time step
KE = 0.5 * m .* v.^2;

% Total kinetic energy lost during braking
KE_lost = 0.5 * m * (v0^2 - v_end^2);

% Energy recovered through regenerative braking
E_recovered = regen_eff * KE_lost;

fprintf('Total Kinetic Energy Lost: %.2f kJ\n', KE_lost/1000);
fprintf('Energy Recovered: %.2f kJ\n', E_recovered/1000);

% ------------------------------
% Plotting
% ------------------------------
figure;
subplot(2,1,1);
plot(t, v, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Speed (m/s)');
title('Vehicle Deceleration');
grid on;

subplot(2,1,2);
plot(t, KE/1000, 'r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Kinetic Energy (kJ)');
title('Kinetic Energy During Braking');
grid on;

sgtitle('Regenerative Braking Simulation - MATLAB');

