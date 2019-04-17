%read video
v = VideoReader("walk.mp4");
length = v.NumberOfFrames;

%create video writer
output = VideoWriter('ouput');
open(output);

%store previous frame
Pframe = im2double(rgb2gray(read(v,1)));
Pframe2 = rgb2gray(read(v,1));

for Fn = 1:250
    currentFrame = im2double(rgb2gray(read(v,Fn+1)+read(v,Fn+2)+read(v,Fn+3))/3);
    diff = abs(Pframe-currentFrame);
    diff(diff>0.09) = 1;
    writeVideo(output,im2double(diff));
    Pframe = currentFrame;
end

close(output);