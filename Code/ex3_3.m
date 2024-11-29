% Tendo em vista a obtenção de k0, calculou-se
% a média aritmética das últimas 100 amostras medidas
% para o sinal de saída medido
sum = 0;		
l = size(ScopeData.signals(3).values, 1);
count = 0;		
for i = l - 99 : l		
	sum = sum + ScopeData.signals(3).values(i, 2);	
	count = count + 1;	
end		
k0 = sum / 100		

% Tendo em vista a obtenção de a, calculou-se o instante em que a 
% resposta medida atinge pelo menos 63,212% da sua amplitude final
% Assim, este instante (tau) é a constante de tempo do sistema de 1ª ordem,
% sendo a = 1 / tau
tau = 0;	
for i = 1 : l		
	if ScopeData.signals(3).values(i, 2) >= 0.63212 * k0	
		tau = ScopeData.time(i) - 1
		break
	end	
end		
a = 1 / tau		

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

title('Resposta do sistema a um degrau de amplitude 1 V com transição em 1 s')
xlabel('Tempo(s)');
ylabel('Velocidade angular (rad/s)');
xlim([0 5]);
ylim([-0.05 1.55]);
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5])
grid;