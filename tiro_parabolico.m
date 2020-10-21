set(gcf, 'Position', get(0, 'Screensize')); warning('off','all'); % Pantalla completa
hold on; % Para que no se borren los puntos anteriores
grid on; % Cuadricula de la grafica
plot(-1,-1,'.-y',-2,-2,'MarkerSize',10); legend('Tiro parabolico'); % Solo para generar la leyenda de cada linea
set(0,'DefaultLegendAutoUpdate','off'); % Evita que se generen nuevas leyendas
axis([0 110 0 35]); % Dimensiones fijas de la figura
delete(findall(gcf,'type','text')) % Limpiamos la grafica de textos anteriores

x0=0; 
y0=15;
g=9.81;
V0=rand*30;
angulo=20+(rand*45);
deltat=0.2;
t=0:deltat:10;


Vx= V0*cos(angulo*pi/180);
Vy= V0*sin(angulo*pi/180);

x=Vx*t;
y=Vy*t+0.5*(-g)*(t.^2)+y0;

title(['Simulacion de proyectil en tiro parabolico']); % Titulo de la figura
xlabel('Distancia [m]') % Texto del eje X
ylabel('Altura [m]') % Texto del eje Y
text(80,32,['Altura inicial = ' num2str(y0)]) % Texto de la altura inicial
text(80,31,['Angulo = ' num2str(angulo)]) % Texto del angulo de disparo
text(80,30,['Velocidad inicial = ' num2str(V0)]) % Texto de la velocidad inicial
%delete(t1),delete(t2)
t1=text(0,29,['x = ' num2str(x)]); % Coordenada actual en X
t2=text(0,28,['y = ' num2str(y)]); % Coordenada actual en Y
    
%pause(deltat)    

comet(x,y)

%drawnow

