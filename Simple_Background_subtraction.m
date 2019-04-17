%read video
v = VideoReader("walk.mp4");
length = v.NumberOfFrames;

%create video writer
output = VideoWriter('ouput');
open(output);

%store previous frame
Pframe = rgb2gray(read(v,1));
level = graythresh(Pframe);

for Fn = 1:length
    currentFrame = rgb2gray(read(v,Fn));
    %currentFrame = rgb2gray(read(v,Fn)+read(v,Fn-1));
    diff = abs(Pframe-currentFrame);
    diff(diff<40) = 0;
    diff = im2double(diff);
    diff(diff>0.2) = 1;
    %imshow(diff);
    writeVideo(output,diff);
    %Pframe = currentFrame;
end

close(output);