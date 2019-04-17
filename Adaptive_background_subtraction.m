%read video
v = VideoReader("walk.mp4");
length = v.NumberOfFrames;

%create video writer
output = VideoWriter('ouput');
open(output);

image = read(v,1);
[row,col,z] = size(image);

B = zeros(row,col,1,length);
I = rgb2gray(read(v,1));
B(:,:,1,1) = I(:,:);

for Fn = 2:length
    I = rgb2gray(read(v,Fn));
    diff = abs(double(B(:,:,1,Fn-1))-double(I(:,:)));
    diff(diff>30) = 250;
    diff(diff<30) = 0;
    writeVideo(output,mat2gray(diff));
    B(:,:,1,Fn) = 0.2*double(I) + 0.8*double(B(:,:,1,Fn-1));
end

close(output);