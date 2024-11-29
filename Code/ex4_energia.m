% Apresentação dos gráficos do sinal de atuação medido e simulado
% para um intervalo de [0, 10] s
figure(2)

str = strcat('u');  
gg = plot(ScopeData.time,ScopeData.signals(1).values(:, 2), 'DisplayName', str);
legend('-DynamicLegend');
set(gg,'LineWidth', 1.5);
hold
str = strcat('u_{sim}');  
gg2 = plot(ScopeData.time, ScopeData.signals(1).values(:, 1), 'DisplayName', str);
legend('-DynamicLegend');
set(gg2,'LineWidth', 1.5);
grid;

title('Atuação do sistema com r(t) = u(t - 0,2) - u(t - 1)')
xlabel('Tempo(s)');
ylabel('Atuação do sistema = tensão de entrada (V)');
xlim([0 10]);

% Cálculo da energia de u. Sabemos que para instantes superiores a 10 s a
% atuação é aproximadamente nula. Sendo u(t) = degrau unitário, utilizamos 
% este cálculo com um sinal de referência igual a u(t - 0,2) - u(t - 1)
e_u = trapz(ScopeData.time, ScopeData.signals(1).values(:, 2) .^ 2)
e_usim = trapz(ScopeData.time, ScopeData.signals(1).values(:, 1) .^ 2)