%read video
v = VideoReader("walk.mp4");

%create video writer
output = VideoWriter('ouput');
open(output);

%store previous frame
Pframe = rgb2gray(read(v,1));

for Fn = 1:250
    hold on;
    currentFrame = rgb2gray(read(v,Fn));
    writeVideo(output,currentFrame-Pframe);
    Pframe = currentFrame;
end

close(output);
