%read video
%change path for different video
path = "walk.mp4";
v = VideoReader(path);
length = v.NumberOfFrames;
image = read(v,1);
[row,col,z] = size(image);

%get 4 array from different method
output1 = simple_background_diff_function(v,row,col,length);
output2 = simple_frame_diff_function(v,row,col,length);
output3 = adaptive_background_sub_function(v,row,col,length);
output4 = persistent_frame_diff_function(v,row,col,length);

%combine 4 array into one array
combine = zeros(2*row,2*col,length);
for i = 1:length
    image1 = output1(:,:,i);
    image2 = output2(:,:,i);
    image3 = output3(:,:,i);
    image4 = output4(:,:,i);
    %combine the image
    combine(:,:,i) = [image1 image2;image3 image4];
end

%output video
video = VideoWriter('ouput');
open(video);

for n = 1:length
    writeVideo(video,double(combine(:,:,n)));
end

close(video);
