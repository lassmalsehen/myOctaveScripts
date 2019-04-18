t = 0:0.1:10*pi; 
r = linspace (0, 1, numel (t)); 
z = linspace (0, 1, numel (t)); 
figure 
axis([-1 1 -1 1 0 1]) 
hold on 
  
for ii=1:length(r) 
  plot3 (r(ii)*sin(t(ii)),  r(ii)*cos(t(ii)), z(ii),'*'); 
#  plot3 ( sin(t(ii)),  cos(t(ii)), z(ii),'*'); 
  pause (.001) 
end