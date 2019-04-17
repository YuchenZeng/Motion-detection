function result = Simple_Background_subtraction(filename)

disp('running Simple Background subtraction')
%read video
v = VideoReader(filename);
length = v.NumberOfFrames;


%store previous frame
Pframe = rgb2gray(read(v,1));
level = graythresh(Pframe);

for Fn = 1:length
    currentFrame = rgb2gray(read(v,Fn));
    diff = abs(Pframe-currentFrame);
    diff(diff<40) = 0;
    diff = im2double(diff);
    diff(diff>0.2) = 1;
    %imshow(diff);
    result(Fn,:,:) = diff;
    %Pframe = currentFrame;
end
