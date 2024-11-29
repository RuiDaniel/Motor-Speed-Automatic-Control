figure(1)

% Resultados experimentais obtidos
Modulo_dB = [1.85, 1.78, 1.71, 1.50, 1.35, 1.28, 1.28, 0.83, 0.03, -1.03, -2.28, -7.13, -12.19];
w = [1.151, 2.695, 5.031, 7.055, 10.83, 14.41, 17.41, 25.39, 38.04, 54.04, 94.76, 125, 250];

% Geração gráfico do diagrama de Bode de magnitude
str = strcat('Diagrama de Bode');  
gg = semilogx(w, Modulo_dB, 'DisplayName' , str);
legend('-DynamicLegend');
set(gg,'LineWidth', 1.5);
hold
title('Diagrama de Magnitude de Bode obtido experimentalmente');
xlabel('\omega_{entrada} (rad/s)');
ylabel('|G(j\omega_{entrada})|_{dB}');
xlim([0 200]);
ylim([-12.19 2.2]);
grid;

% Explicação detalhada para o uso de 1.85 dB no relatório 
str = 'Assíntota de Baixa Frequência';
gg = yline(1.85, 'DisplayName' , str);
set(gg,'LineWidth', 1.5);
hold on

% Tendência logarítmica obtida, detalhes no relatório
str = 'Assíntota de Alta Frequência';
s = @(x) -9.654 * log(x) + 40.752;
numPoints = 1000;
xvec = linspace(0, 200, numPoints);
yvec = feval(s, xvec);
gg = plot(xvec, yvec, 'DisplayName' , str);
set(gg,'LineWidth', 1.5);
hold




