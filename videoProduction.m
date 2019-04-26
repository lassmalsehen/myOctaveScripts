# Open the AVI file
m = avifile("test.avi")

# Generate and add frames
for i = 1:100
  I = zeros(100,100);
  I(i,:) = i;
  I(:,i) = 200-i;
  addframe(m, I/255)
  printf(".")
endfor
printf("\n")

# Close the file
clear m