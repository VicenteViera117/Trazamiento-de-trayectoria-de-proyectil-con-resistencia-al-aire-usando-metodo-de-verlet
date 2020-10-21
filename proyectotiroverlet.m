clear all
clc
%-------------------parametros iniciales-----------------
ts=.01;
g = 9.81;
y0=50;
x0=0;
t=0:.1:8.4;
vi= 50;
ang=60;
angr=deg2rad(ang);
vix=vi*cos(angr);
viy=vi*sin(angr);
densidadDelAire=1.2;
coeficienteDeArrastre=0.011;
prock=100; %densidad de la piedra
masa=1;
volumen=masa/prock;
radio=(3*volumen/(4*pi))^(1/3);
area=pi*radio^2;
b=0.5*densidadDelAire*coeficienteDeArrastre*area;
%-----------------graficamos el volcan-------------------------------------
figure('Name','Volcán')
ciclocos = -pi*20:pi/100:pi*20;
volcan= y0.*cos(ciclocos/20);
plot(ciclocos,volcan),xlabel('Distancia'),...
ylabel('Altura'),title('Simulación de una piedra expulsada de un volcán')
hold on

%---------------operaciones para determinar valores de x-------------------

%s prima de x en al primera posicion
spta=-abs(vix)/vix*b/masa*vix^2;
%posicion xn-1
xa=x0-vix*ts-(spta*ts^2);

%calculamos y añadimos los valores de x al arreglo de valores en x
x=zeros(1,1000);
x(1)=xa;
x(2)=x0;
%velocidad
vx=zeros(1,1000);
vx(1)=vix;
for i=3:1000
    x(i)=(2.*x(i-1)-x(i-2))-(((x(i-1)-x(i-2))./ts).^2)*(b/masa).*ts^2;
    vx(i-1)=(x(i)-x(i-1))/ts;
end

x(1)=x0;

%---------------operaciones para determinar valores de y-------------------

sptay =  -g - abs(viy)/viy* b/masa * viy^2;
ya = y0 - viy .* ts - sptay .* ts.^2;

% calculamos y añadimos los valores de y
y=zeros(1,1000);
y(1)=ya;
y(2)=y0;
%velocidad
vy=zeros(1,1000);
vy(1)=viy;

for i=3:1000
        y(i)=(2.*y(i-1)-y(i-2))-(((y(i-1)-y(i-2))./ts).^2)*(b/masa)*(ts^2)-(g*ts^2);
        vy(i-1)=(y(i)-y(i-1))/ts;
end

y(1)=y0;
[Valor_Maximo_de_Y,indicey] = max(y)
Tiempo_Altura_Max = (indicey * ts) -1

yv2=abs(y);
[Distancia_En_La_Que_Impacta_Con_El_Suelo, indiceyv2] = min(yv2)
Tiempo_Para_Impactar = (indiceyv2 * ts) - 1
comet(x,y)