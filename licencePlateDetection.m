clear;
clc;
% v = VideoReader('video.asf');

% for i = 1: v.NumberofFrames
%     filename = strcat('frame', num2str(i), '.jpg');
%     img = read(v, i);
%     imwrite(img, filename);
% end
% take an image as reference
% subtract input iamge with reference image to locate car location

refImagePath = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\video frames\frame352.jpg';
referenceImage = imread(refImagePath);
BWRef = rgb2gray(referenceImage);

inputImagePath = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\video frames\frame600.jpg';
inputImage = imread(inputImagePath);
BWInput = rgb2gray(inputImage);

location = determine_car_location(BWRef, BWInput);

figure; imshow(inputImage); hold on;

rectangle('Position',...
    [location(1, 1) location(2, 1) location(1, 3) location(2, 3)],...
    'EdgeColor', 'r', 'LineWidth', 1.5);