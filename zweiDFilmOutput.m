# Animation:


function zweiDFilmOutput (x1, x2, y1, y2, t, m)
  schwanz = 20;


  
  # Plotgrenzen berechnen:
  bf = 1.05;  # gibt Bildrand
  x_von = min ([x1; y1]) * bf;
  x_bis = max ([x1; y1]) * bf;
  x_rand = .05 * (x_bis - x_von);
  x_von -= x_rand;
  x_bis += x_rand;
  y_von = min ([x2; y2]) * bf;
  y_bis = max ([x2; y2]) * bf;
  y_rand = .05 * (y_bis - y_von);
  y_von -= y_rand;
  y_bis += y_rand;
  
  figure;

  for n = 1:length(t) 

    grid off;
    axis([x_von x_bis y_von y_bis]); 
    hold on;
    plot (x1(n), x2(n), 'or', 'markersize', m(1), "markerfacecolor", "r");
    plot (y1(n), y2(n), 'og', 'markersize', m(2), "markerfacecolor", "g");
    filename = sprintf ("planetenFilm/planeten_%04d.jpg", n);
#    disp(filename);
    print("-djpg", filename);
    clf;
    # Filmdauer bestimmen:
#    pause (min (.1, 5 / length(t)) );
  end

  close;
endfunction
