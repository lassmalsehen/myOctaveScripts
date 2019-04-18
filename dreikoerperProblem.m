##################################################
# Das Zweikoerperproblem bestehend aus zwei Massen m, M
# und Gravitationskonstante g,
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
initVelm2 = [ 0,-1,0];
initVelm3 = [ 0, 0,1];

# Zeitpunkte, zu denen Loesung gesucht wird. 
# Auf meinem Lenovo U330p bleibt die
# Rechenzeit bei wenigen Sekunden bei 1e5 Schritten.
t = linspace(0, 10, 1e2);

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
y = lsode (fcn, x0, t);

# Ortkurve mx:
x1 = y(1:length(t), 1);
x2 = y(1:length(t), 2);
x3 = y(1:length(t), 3);
# Ortskurve my: 
y1 = y(1:length(t), 4);
y2 = y(1:length(t), 5);
y3 = y(1:length(t), 6);
# Ortskurve mz: 
z1 = y(1:length(t), 7);
z2 = y(1:length(t), 8);
z3 = y(1:length(t), 9);

# zweiDFilmOutput (x1, x2, y1, y2, t, [m, M]);
dreiDFilm ([x1, x2, x3], [y1, y2, y3], [z1, z2, z3], t, [mx, my, mz]);


#{
options1 = {"ob", "markerfacecolor", "b"}; 
options2 = ["og", "markerfacecolor", "g"]; 
plot3 (x1, x2, x3, "ob", "markerfacecolor", "b")
hold on;
plot3 (y1, y2, y3, "og", "markerfacecolor", "g")
plot3 (z1, z2, z3, "or", "markerfacecolor", "r")
grid on;
#}

