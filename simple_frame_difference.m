%read video
v = VideoReader("walk.mp4");

%create video writer
output = VideoWriter('ouput');
open(output);

%store previous frame
Pframe = im2double(rgb2gray(read(v,1)));
level = graythresh(Pframe);

for Fn = 1:250
    currentFrame = im2double(rgb2gray(read(v,Fn+1)+read(v,Fn+2)+read(v,Fn+3))/3);
    %currentFrame = rgb2gray(read(v,Fn)+read(v,Fn-1));
    diff = abs(Pframe-currentFrame);
    %diff(diff<10) = 0;
    %diff = im2double(diff);
    diff(diff>0.09) = 1;
    %imshow(diff);
    writeVideo(output,im2double(diff));
    Pframe = currentFrame;
end

close(output);