# Animation:


function dreiDFilm (x, y, z, t, m)
  schwanz = 10;

  figure;
  
  # Plotgrenzen berechnen:
  bf = 0.1;  # gibt bf% Bildrand
  komp = [x(:,1); y(:,1); z(:,1)];
  x_von = min (komp);
  x_bis = max (komp);
  x_rand = bf * (x_bis - x_von);
  x_von -= x_rand;
  x_bis += x_rand;
  komp = [x(:,2); y(:,2); z(:,2)];
  y_von = min (komp);
  y_bis = max (komp);
  y_rand = bf * (y_bis - y_von);
  y_von -= y_rand;
  y_bis += y_rand;
  komp = [x(:,3); y(:,3); z(:,3)];
  z_von = min (komp);
  z_bis = max (komp);
  z_rand = bf * (z_bis - z_von);
  z_von -= z_rand
  z_bis += z_rand

  for n = 1:length(t) 
    axis([x_von x_bis y_von y_bis, z_von, z_bis]);
    hold on;
    plot3 (x(:,1)(n), x(:,2)(n), x(:,3)(n), 'or', 'markersize', m(1), "markerfacecolor", "r");
    plot3 (y(:,1)(n), y(:,2)(n), y(:,3)(n), 'og', 'markersize', m(2), "markerfacecolor", "g");
    plot3 (z(:,1)(n), z(:,2)(n), z(:,3)(n), 'ob', 'markersize', m(2), "markerfacecolor", "b");
    grid on;
    if n-schwanz > 0
      plot3 (x(:,1)(n-schwanz), x(:,2)(n-schwanz), x(:,3)(n-schwanz), ...
           'ow', 'markersize', m(1), "markerfacecolor", "w");
      plot3 (y(:,1)(n-schwanz), y(:,2)(n-schwanz), y(:,3)(n-schwanz), ...
           'ow', 'markersize', m(2), "markerfacecolor", "w");
      plot3 (z(:,1)(n-schwanz), z(:,2)(n-schwanz), z(:,3)(n-schwanz), ...
           'ow', 'markersize', m(3), "markerfacecolor", "w");
    endif
#{
#}
#   Filmdauer bestimmen:
    pause (min (.1, 5 / length(t)) );
#    clf;
  end

#  close;
endfunction
