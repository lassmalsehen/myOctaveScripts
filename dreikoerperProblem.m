##################################################
# 
# Das Dreikoerperproblem bestehend aus zwei
# Massen mx, my, mz und Gravitationskonstante g
# 
###############################################

clear -all;
# Gravitationskonstante:
global g = 1;
# Massen:
global mx = 10;
global my = 10;
global mz = 10;
global N = 3;

# Anfangbedingungen:
initOrtm1 = [ 1, 0,0];
initOrtm2 = [-1, 0,0];
initOrtm3 = [ 0, 0,0];
initVelm1 = [ 0, 1,0];
initVelm2 = [ 0, 0,0];
initVelm3 = [ 0, 0,1];

# Zeitpunkte, zu denen Loesung gesucht wird. 
# Auf meinem Lenovo U330p bleibt die
# Rechenzeit bei wenigen Sekunden bei 1e5 Schritten.
t = linspace(0, 10, 1e3);

###################################################
# Hilfsfunktionen
###################################################

# Anfangsbed.:
x0 = [initOrtm1, initOrtm2, initOrtm3, ...
	initVelm1, initVelm2,  initVelm3];

# Test:
# threeBodyForceFunction(x0,t)

###################################################
# Loese:
# fcn = {@threeBodyForceFunction, @threeBodyForceFunctionJacobian};
fcn = {@threeBodyForceFunction};
[y, istate, msg] = lsode (fcn, x0, t);

# Ortkurven:
tes = 1:length(t);
x = zeros(tes, 3);
for k = 1:3
  x(tes,k) = y(tes, k);
  ys(tes,k) = y(tes, k+3);
  z(tes,k) = y(tes, k+6);
endfor

m = [mx,my,mz];
R = zeros(length(t), 3);

# Schwerpunktvektor:
for k = 1:3
  R(:,k) = (m(1) * x(:,k) + m(2) * ys(:,k) +
             	m(3) * z(:,k)) / (mx + my + my);
endfor

dreiDFilm (x-R, ys-R, z-R, t, m);

#{

options1 = {"ob", "markerfacecolor", "b"}; 
options2 = ["og", "markerfacecolor", "g"]; 
plot3 (x1, x2, x3, "ob", "markerfacecolor", "b")
hold on;
plot3 (y1, y2, y3, "og", "markerfacecolor", "g")
plot3 (z1, z2, z3, "or", "markerfacecolor", "r")
grid on;
#}

