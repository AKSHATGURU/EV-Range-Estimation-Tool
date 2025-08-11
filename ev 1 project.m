%% EV Driving Range Estimation Tool
clc; clear; close all;

% --- Input Parameters ---
battery_capacity_kWh = 50;       % Battery capacity in kWh
motor_efficiency = 0.90;         % Motor efficiency (0-1)
avg_speed_kmph = 60;             % Average speed in km/h
terrain_factor = 1.1;            % 1.0 = flat, >1 = uphill, <1 = downhill

% --- Base Energy Consumption ---
base_consumption_kWh_per_km = 0.15; % kWh per km for flat road

% --- Adjust for terrain & efficiency ---
adjusted_consumption = base_consumption_kWh_per_km * terrain_factor / motor_efficiency;

% --- Estimated Range ---
estimated_range_km = battery_capacity_kWh / adjusted_consumption;
fprintf('Estimated EV Driving Range: %.2f km\n', estimated_range_km);

% --- Plot Range vs Speed ---
speeds = 30:10:120; % km/h
% Assuming constant consumption for simplicity
ranges = repmat(estimated_range_km, size(speeds));
plot(speeds, ranges, '-o', 'LineWidth', 2, 'MarkerFaceColor', 'b');
xlabel('Average Speed (km/h)');
ylabel('Estimated Range (km)');
title('EV Range vs Speed');
grid on;
