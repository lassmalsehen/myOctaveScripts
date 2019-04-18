# Animation:


function zweiDFilm (x1, x2, y1, y2, t, m)
  schwanz = 20;

  figure;
  grid off;
  
  # Plotgrenzen berechnen:
  bf = 0.1;  # gibt bf% Bildrand
  x_von = min ([x1; y1]);
  x_bis = max ([x1; y1]);
  x_rand = bf * (x_bis - x_von);
  x_von -= x_rand;
  x_bis += x_rand;
  y_von = min ([x2; y2]);
  y_bis = max ([x2; y2]);
  y_rand = bf * (y_bis - y_von);
  y_von -= y_rand;
  y_bis += y_rand;
  axis([x_von x_bis y_von y_bis]); 
  hold on;
  grid on;

  for n = 1:length(t) 
    plot (x1(n), x2(n), 'or', 'markersize', m(1), "markerfacecolor", "r");
    plot (y1(n), y2(n), 'og', 'markersize', m(2), "markerfacecolor", "g");
    if n-schwanz > 0
      plot (x1(n-schwanz), x2(n-schwanz), ...
           'ow', 'markersize', m(1), "markerfacecolor", "w");
      plot (y1(n-schwanz), y2(n-schwanz), ...
           'ow', 'markersize', m(2), "markerfacecolor", "w");
    endif
#   Filmdauer bestimmen:
    pause (min (.1, 5 / length(t)) );
  end

  close;
endfunction
