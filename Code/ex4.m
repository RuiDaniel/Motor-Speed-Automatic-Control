% Utilizando o workspace obtido no laboratório

% Apresentação dos gráficos das respostas medidas e simuladas, para um intervalo
% de [0, 10] s
figure(1)

str = strcat('y');  
gg = plot(ScopeData.time,ScopeData.signals(2).values(:, 2), 'DisplayName', str);
legend('-DynamicLegend');
set(gg,'LineWidth', 1.5);
hold
str = strcat('y_{sim}');  
gg2 = plot(ScopeData.time, ScopeData.signals(2).values(:, 1), 'DisplayName', str);
legend('-DynamicLegend');
set(gg2,'LineWidth', 1.5);
grid;

title('Resposta do sistema a um degrau de amplitude 1 V com transição em 0,2 s')
xlabel('Tempo(s)');
ylabel('Velocidade angular (rad/s)');
xlim([0 10]);

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

title('Atuação do sistema com referência igual ao degrau de amplitude 1 V com transição em 0,2 s')
xlabel('Tempo(s)');
ylabel('Atuação do sistema = tensão de entrada (V)');
xlim([0 10]);
