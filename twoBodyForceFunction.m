#############################################
#
# Two body ODE
# Die Funktion f(x,t) beschreibt in der Differentialgleichung
# xdot = f (x,t)
# das Zweikoerperproblem. Ort der Masse m ist (x_1, x_2) und
# Ort von M ist (x_3, x_4).
#
##############################################

function xdot = twoBodyForceFunction (x, t)
  global g m M;

  xdot = zeros (8,1);
  xdot(1) = x(5);
  xdot(2) = x(6);
  xdot(3) = x(7);
  xdot(4) = x(8);
  xdot(5) = -M * pot(x, t, 1,3);
  xdot(6) = -M * pot(x, t, 2,4);
  xdot(7) = m * pot(x, t, 1,3);
  xdot(8) = m * pot(x, t, 2,4);

endfunction

# Die Potentiale koennen mehrfach benutzt werden:
function f1 = pot(x, t, a, b)
  global g;
  f1 = g * (x(a) - x(b)) / dist(x, t)** 3;
endfunction

# Abstand der Massen:
function r = dist(x, t)
  r = sqrt( (x(1)-x(3))**2 + (x(2)-x(4))**2 );
endfunction
