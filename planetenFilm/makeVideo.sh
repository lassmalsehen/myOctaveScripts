ffmpeg -framerate 25 -i image-%45d.jpg -c:v libx264 -profile:v high -crf 20
-pix_fmt yuv420p output.mp4
