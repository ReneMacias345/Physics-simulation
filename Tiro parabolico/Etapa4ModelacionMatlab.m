%DATOS INICIALES
%Aqui dentro de los datos iniciales vienen las variables en las que se
%inicializa el codigo como por ejemplo variables constantes, variables con
%procedimientos y variables con inputs para que el usuario llene valores
%asi como tambien mensajes al usuario :)
g= 9.8;
disp("La velocidad inicial de un proyectil volcanico varia entre un rando de 70 a 200 m/s")
v0=input("Velocidad inical: ");
disp("El angulo con el cual un proyectil volcanico sale disparado varia entre un rango de 35 a 75 grados")
angulo=input("Angulo: ");
v0x=v0*cosd(angulo);
v0y=v0*sind(angulo);
x0=0;
y0=2800;
m=15000;
diametro=1.25;
constante=0.25;
c=(diametro^2)*constante;
%Vectores de tiempo, posicion, rapidez
dt=0.01;
t0=0;
tf=32;
t=t0:dt:tf;
np=length(t);
y=zeros(1,np);
vy=zeros(1,np);

x=zeros(1,np);
vx=zeros(1,np);

%ASIGNAMOS VALOR INICIAL
y(1)=y0;
vx(1)=v0x;
x(1)=x0;
vy(1)=v0y;

%EULER
%Este for lo que hace es recorrer la funcion de eueler par asi poder
%generar la linea corrrespondiente a los datos que se ingresan

for j = 1: np-1
    vx(j+1)=vx(j)+dt*(-(c/m)*vx(j)*(vx(j)^2+vy(j)^2)^(0.5));
    x(j+1)=x(j)+dt*vx(j+1);
    vy(j+1)=vy(j)+dt*(-(c/m)*vy(j)*((vx(j)^2+vy(j)^2)^(0.5))-g);
    y(j+1)=y(j)+dt*vy(j+1);


end
%GRAFICA
%Aqui simplemente se pinta la grafica con la funcion colores y
%caracteristicas 
figure()
plot(x,y)
yline(0)
hold on
plot(x0+v0x*t,y0+v0y*t-0.5*g*t.*t,"r--")

ejex=[-200 -30 30 200];
ejey=[0 2799 2799 0];
patch(ejex,ejey,'green')



