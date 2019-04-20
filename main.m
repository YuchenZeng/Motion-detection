%%
%Our Algorithm consist of 4 different subtraction method.
%1. Simple Background Subtraction <Simple_Background_Sub.m>
%2. Simple Frame Difference <simple_frame_difference.m>
%3. Adaptive Background Subtraction <Adaptive_BG_sub.m>
%4. Persistent Frame Differencing <persistent_frame_diff.m>
%each method is implemented as a function. The input for the function is
%the video file name, and it will return a 3d matrix consisting frame number and image data. If you want to change videos to be processed, change
%the array vid_names.

clc;clear;
%%
vid_names = ["ArenaA.mp4","ArenaN.mp4","ArenaW.mp4","getin.mp4","getout.mp4","movecam.mp4","trees.mp4","walk.mp4"];

for vid = 1:8
    %generate names
    vid_name = char(vid_names(vid));
    output_vid_name = char(strcat('output_',vid_name));
    
    %load the video
    v = VideoReader(vid_name);
    length = v.NumberOfFrames;
    %create video writer
    vid_output = VideoWriter(output_vid_name);
    open(vid_output);
    
    %do the calculations
    img_Simple_Background_subtraction = Simple_Background_subtraction(vid_name);
    img_Simple_frame_difference = Simple_frame_difference(vid_name);
    img_Adaptive_background_subtraction = Adaptive_background_subtraction(vid_name);
    img_Persistent_frame_difference = Persistent_frame_difference(vid_name);
    
    %save the video
    for i = 1:length
        %img1 is result of simple background subtraction
        %extract frame number = i
        img1 = img_Simple_Background_subtraction(i,:,:);
        img1 = squeeze(img1);
        %img2 is result of Simple frame difference
        %extract frame number = i
        img2 = img_Simple_frame_difference(i,:,:);
        img2 = squeeze(img2);
        %img3 is result of Adaptive_background_subtraction
        %extract frame number = i
        img3 = img_Adaptive_background_subtraction(i,:,:);
        img3 = squeeze(img3);
        %img4 is result of Persistent_frame_difference
        %extract frame number = i
        img4 = img_Persistent_frame_difference(i,:,:);
        img4 = squeeze(img4);
        %combine 4 images into one 2x2
        result = [img1 img2; img3 img4];
        %save it
        writeVideo(vid_output,result);
    end
    close(vid_output);
end
    