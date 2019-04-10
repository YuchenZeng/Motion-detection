%read video
v = VideoReader("walk.mp4");

%create video writer
output = VideoWriter('ouput');
open(output);

%store previous frame
Pframe = rgb2gray(read(v,1));
level = graythresh(Pframe);

for Fn = 1:250
    currentFrame = rgb2gray(read(v,Fn));
    diff = abs(Pframe-currentFrame);
    %threshold
    diff(diff<40) = 0;
    diff = im2double(diff);
    diff(diff>0.2) = 1;
    imshow(diff);
    writeVideo(output,diff);
    %Pframe = currentFrame;
end

close(output);
