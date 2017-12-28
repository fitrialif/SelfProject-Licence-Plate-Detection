clear;
clc;

refImagePath = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\video frames\frame352.jpg';
referenceImage = imread(refImagePath);
BWRef = rgb2gray(referenceImage);

threshold = 0.18;
%%
% save frames
% v = VideoReader('video.asf');

% for i = 1: v.NumberofFrames
%     filename = strcat('frame', num2str(i), '.jpg');
%     img = read(v, i);
%     imwrite(img, filename);
% end

%%
% edit frame rate
% v = VideoReader('video.asf');
% writer = VideoWriter('video(1)');
% writer.FrameRate = 5;     %change frame rate
% open(writer);
% 
% for i = 1: v.NumberofFrames
%     img = read(v, i);
%     writeVideo(writer, img);
% end
% 
% close(writer);

%%
% play edited video
v = VideoReader('video(1).avi');
for i = 1: v.NumberofFrames
    inputImage = read(v, i);
    BWInput = rgb2gray(inputImage);
    imshow(BWInput); hold on;
    
    location = determine_car_location(BWRef, BWInput);
    
    BWcrop = imcrop(BWInput,...
        [location(1, 1) location(2, 1) location(1, 3) location(2, 3)]);
    
    BWcrop = imbinarize(BWcrop, threshold);
    updatedStruct = determine_car_plate(BWcrop, location);
    
end

%%
% myvi-70
% waja-651
% imageNum = 19;     %1-781
% inputImagePath = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\video frames\frame';
% inputImage = imread(strcat(inputImagePath, num2str(imageNum), '.jpg'));
% BWInput = rgb2gray(inputImage);
% 
% figure; imshow(inputImage); hold on;
% 
% location = determine_car_location(BWRef, BWInput);
% 
% BWcrop = imcrop(BWInput,...
%     [location(1, 1) location(2, 1) location(1, 3) location(2, 3)]);
% 
% BWcrop = imbinarize(BWcrop, 0.18);
% updatedStruct = determine_car_plate(BWcrop, location);
% figure; imshow(BWcrop);