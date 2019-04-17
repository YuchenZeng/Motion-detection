%read video
v = VideoReader("getin.mp4");

%create video writer
output = VideoWriter('ouput');
output2 = VideoWriter('output2');
open(output);
open(output2);

%store previous frame
Pframe = rgb2gray(read(v,1));
I = rgb2gray(read(v,1));

for Fn = 16:500
    currentFrame = rgb2gray(read(v,Fn));
    delay = rgb2gray(read(v,Fn-15));
    %currentFrame = rgb2gray(read(v,Fn)+read(v,Fn-1));
    diff = abs(delay-Pframe);
    %diff(diff<25) = 0;
    %diff = im2double(diff);
    %diff(diff>0.15) = 0.9;
    %imshow(diff);
    writeVideo(output,Pframe);
    writeVideo(output2,diff);
    Pframe = 0.6*currentFrame+0.4*read(v,Fn-3);
end

close(output);
close(output2);