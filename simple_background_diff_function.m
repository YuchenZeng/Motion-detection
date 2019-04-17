function [output] = simple_background_diff_function(v,row,col,length)

output = zeros(row,col,length);

%store previous frame
Pframe = rgb2gray(read(v,1));

for Fn = 1:length
    currentFrame = rgb2gray(read(v,Fn));
    %simple subtraction
    diff = abs(Pframe-currentFrame);
    %threshold
    diff(diff<40) = 0;
    diff = im2double(diff);
    diff(diff>0.2) = 1;
    %update to return output
    output(:,:,Fn) = diff(:,:);
end

end

