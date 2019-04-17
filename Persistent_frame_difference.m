function result = Persistent_frame_difference(filename)

disp('running Persistent frame difference')
%read video
v = VideoReader(filename);
length = v.NumberOfFrames;


image = read(v,1);
[row,col,z] = size(image);

M = zeros(row,col,1,length);
B = zeros(row,col,1,length);
H = zeros(row,col,1,length);
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
    result(Fn,:,:) = mat2gray(H(:,:,1,Fn));
    %writeVideo(output,mat2gray(H(:,:,1,Fn)));
    B(:,:,1,Fn) = I;
end




