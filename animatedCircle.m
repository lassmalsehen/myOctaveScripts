filmdauer = 10;
umlaufdauer = 5;
schritte = 100;
schwanz = 30;
p = umlaufdauer / schritte;
t = 0 : 2*pi/schritte : filmdauer;
omega = 2* pi / umlaufdauer;
x = cos( omega * t);
y = sin( omega * t);

figure
axis([-1.5 1.5 -1.5 1.5]) 
hold on

for n = 1:length(t)
  plot(x(n), y(n), 'or', 'markersize', 10, "markerfacecolor", "r");
  plot(x(n) + .5, y(n), '*g', 'markersize', 10);
  if n-schwanz > 0
    plot(x(n-schwanz), y(n-schwanz), 'ow', 'markersize', 10, "markerfacecolor", "w");
    plot(x(n-schwanz) + .5, y(n-schwanz), '*w', 'markersize', 10);
  endif
  
  #  comet(x, y);
  pause(p);
end
