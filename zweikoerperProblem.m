##################################################
# Das Zweikoerperproblem bestehend aus zwei Massen m, M
# und Gravitationskonstante g,
###############################################

clear -all;
# Gravitationskonstante:
global g = 1;
# Massen:
global m = 30;
global M = 10;

# Anfangbedingungen:
initOrtm = [-1,0];
initOrtM = [1,0];
initVelm = [0,1];
initVelM = [0,-2];

# Zeitpunkte, zu denen Loesung gesucht wird. 
# Rechenzeit bleibt bei etwa 1 Sekunde bei 1e5 Schritten.
t = linspace(0, 10, 1e3);

###################################################
# Hilfsfunktionen
###################################################

# Anfangsbed.:
x0 = [initOrtm, initOrtM, initVelm, initVelM];

###################################################
# Loese:
fcn = {@twoBodyForceFunction, @twoBodyForceFunctionJacobian};
y = lsode (fcn, x0, t);

# Ortkurve m:
x1 = y(1:length(t), 1);
x2 = y(1:length(t), 2);
# Ortskurve M: 
y1 = y(1:length(t), 3);
y2 = y(1:length(t), 4);

# zweiDFilmOutput (x1, x2, y1, y2, t, [m, M]);
zweiDFilm (x1, x2, y1, y2, t, [m, M]);


#{
options1 = {"ob", "markerfasecolor", "b"}; 
options2 = ["og", "markerfasecolor", "g"]; 
grid on;
plot(x1,x2, "ob")
hold on;
plot(y1,y2, "*g")
#}

