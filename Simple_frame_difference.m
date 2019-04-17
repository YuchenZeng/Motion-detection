function result = Simple_frame_difference(filename)

disp('running Simple frame difference')
%read video
v = VideoReader(filename);
length = v.NumberOfFrames;


%store previous frame
Pframe = im2double(rgb2gray(read(v,1)));

for Fn = 1:length
    currentFrame = im2double(rgb2gray(read(v,min(Fn,Fn+1))+read(v,min(Fn,Fn+2))+read(v,min(Fn,Fn+3)))/3);
    diff = abs(Pframe-currentFrame);
    diff(diff>0.09) = 1;
    diff = im2double(diff);
    result(Fn,:,:) = diff;
    Pframe = currentFrame;
end

