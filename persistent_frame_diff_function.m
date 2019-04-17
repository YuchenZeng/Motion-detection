function [output] = persistent_frame_diff_function(v,row,col,length)

output = zeros(row,col,length);
%four array variable for local use
M = zeros(row,col,1,length);
B = zeros(row,col,1,length);
H = zeros(row,col,1,length);
%inital image
I = rgb2gray(read(v,1));

B(:,:,1,1) = I(:,:);

for Fn = 2 : length
    I = rgb2gray(read(v,Fn));
    diff = abs(double(B(:,:,1,Fn-1))-double(I(:,:)));
    diff(diff>50) = 250;
    diff(diff<50) = 0;
    M(:,:,1,Fn) = diff;
    tmp = max(H(:,:,1,Fn-1)-40,0);
    H(:,:,1,Fn) = max(10*M(:,:,1,Fn),tmp);
    %update return output
    output(:,:,Fn) = mat2gray(H(:,:,1,Fn));
    B(:,:,1,Fn) = I;
end

end

