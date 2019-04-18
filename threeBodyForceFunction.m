#############################################
#
# Three body ODE
# Die Funktion f(x,t) beschreibt in der Differentialgleichung
# xdot = f (x,t)
# das Dreikoerperproblem. Ort der Masse m1 ist (x_1, x_2) und
# Ort von M ist (x_3, x_4).
#
##############################################

function xdot = threeBodyForceFunction (x, t)
  global g m N;
  idx = [ 1  2  3;  4  5  6;  7  8  9];
  idx = idx';
	N = 3;
  mx = 1;
	my = 1;
  mz = 1;
  idxV = idx + 3*N;

  xdot = zeros (3*N,1);
  for k = idx
	  for l = k'
		  xdot(l) = x(l+3*N);
	  endfor
  endfor

# loop over the components l of velocity k:
  for l = 1:3
	  xdot(3*N+l) = (-my * pot(x, t, l, l+N) -
 		     mz * pot(x,t, l, l+2*N)) * g * dist(x,t)**3;
  endfor
  for l = 1:3
	  xdot(3*N+l+N) = (mx * pot(x, t, l, N+l) -
  	    mz * pot(x,t, l+N, l+2*N)) * g * dist(x,t)**3;
  endfor
  for l = 1:3
	  xdot(3*N+l+2*N) = (mx * pot(x, t, l, l+2*N) +
  	    my * pot(x,t, l+N, l+2*N)) * g * dist(x,t)**3;
  endfor
endfunction
rand

# Die Potentiale koennen mehrfach benutzt werden:
function f1 = pot(x, t, a, b)
  global g;
  f1 = g * (x(a) - x(b)) / dist(x, t)** 3;
endfunction

# Abstand der Massen:
function r = dist(x, t)
  r = sqrt( (x(1)-x(3))**2 + (x(2)-x(4))**2 );
endfunction

