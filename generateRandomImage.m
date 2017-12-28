function targetNodes = generateRandomImage(i, j)
%     path = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\Lab2 images\';
%     pic = randi(10)-1;
%     numOfPic = num2str(randi(100));
%     str = strcat(path, num2str(pic), '\', num2str(pic), ' (', numOfPic, ').bmp');
%     target = zeros(10, 1);
%     target(pic+1, 1) = 1;
%     targetNodes = target;
%     assignin('base', 'imagePath', str);
    path = 'C:\Users\Nelson\Desktop\Machine Vision Practical\Machine Vision Lab 2\Lab2 images\';
    str = strcat(path, num2str(i-1), '\', num2str(i-1), ' (', num2str(j), ').bmp');
    assignin('base', 'imagePath', str);
    target = zeros(10, 1);
    target(i, 1) = 1;
    targetNodes = target;
end