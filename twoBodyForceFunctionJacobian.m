#############################################
#
# Jacobian for Two body ODE
# Jacobi-Matrix zur twoBodyForceFunction.
# Ort der Masse m ist (x_1, x_2) und
# Ort von M ist (x_3, x_4).
#
##############################################

function Jf = twoBodyForceFunctionJacobian (x, t)
  global m M g;
  
  z = zeros(4,4);
  idty = eye(4);
  # Vertausche die beiden Orte der Massen:
  u = [x(2); x(1); x(4); x(3); x(5:8)];
  K = [alpha(x, t), beta(x, t);
       beta(x, t),  alpha(u, t)];
  jhilf = [-M*K,  M*K;
            m*K, -m*K];
  
  Jf = [z, idty;
        jhilf, z];
endfunction

function a = alpha (x, t)
  global g;
  a = g * (x(2) - x(4))**2 - 2 * (x(1) - x(3)) / dist (x, t)** 5;
 endfunction 

function b = beta (x, t)
  global g;
  b = -3 * g * (x(1) - x(3)) * (x(2) - x(4)) / dist (x, t)** 5;
endfunction 

function ga = gamma (x, t)
  y = [x(2), x(1), x(4), x(3), x(5:8)];
  ga = alpha(y,t);
endfunction
 
# Abstand der Massen:
function r = dist(x, t)
  r = sqrt( (x(1)-x(3))**2 + (x(2)-x(4))**2 );
endfunction