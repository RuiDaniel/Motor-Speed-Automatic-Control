% Apresentação dos gráficos das respostas medidas e simuladas, para um intervalo
% de [0, 5] s
figure(1)

str = strcat('y');  
gg = plot(ScopeData.time,ScopeData.signals(3).values(:, 2), 'DisplayName', str);
legend('-DynamicLegend');
set(gg,'LineWidth', 1.5);
hold
str = strcat('y_{sim}');  
gg2 = plot(ScopeData.time, ScopeData.signals(3).values(:, 1), 'DisplayName', str);
legend('-DynamicLegend');
set(gg2,'LineWidth', 1.5);

str = strcat('Resposta do sistema a uma entrada sinusoidal para \omega_{entrada} = ', num2str(w), 'rad/s');  
title(str);
xlabel('Tempo(s)');
ylabel('Velocidade angular (rad/s)');
xlim([0 5]);
grid;

% Obtenção das primeiras 6 (ou menos) amplitudes máximas do sinal de saída
max = 0;
max_periods = zeros(6, 1);
l = size(ScopeData.signals(3).values, 1); % Número de amostras
T = 2 * pi / w; % Período
n_periods = floor((l - 1) * 0.001 / T);

% Apenas queremos obter os máximos para os primeiros 6 períodos
if n_periods > 6
    n_periods = 6;
end
aux1 = 1;
for kk = 1 : n_periods
    max = 0;
    aux2 = floor(aux1 + (T / 0.001));
    if aux2 > l
        aux2 = l;
    end
    % Para cada período, vamos analisar apenas as amostras dentro deste período
    for i = aux1 : aux2
        if ScopeData.signals(3).values(i, 2) > max
            max = ScopeData.signals(3).values(i, 2);
        end
    end
    aux1 = aux2;
    if max > 0
        max_periods(kk) = max;
        max
    end
end
    