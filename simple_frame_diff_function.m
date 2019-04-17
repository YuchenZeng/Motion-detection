function [output] = simple_frame_diff_function(v,row,col,length)

output = zeros(row,col,length);
%store previous frame
Pframe = im2double(rgb2gray(read(v,1)));

for Fn = 1:length-3
    currentFrame = im2double(rgb2gray(read(v,Fn+1)+read(v,Fn+2)+read(v,Fn+3))/3);
    diff = abs(Pframe-currentFrame);
    %threshold
    diff(diff>0.09) = 1;
    output(:,:,Fn) = diff(:,:);
    Pframe = currentFrame;
end

end

