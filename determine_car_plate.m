function updatedStruct = determine_car_plate(BWcrop, location)
    updatedStruct = struct('Area', {}, 'BoundingBox', {});
    
    counter = 1;
    rect = regionprops(BWcrop, 'Area', 'BoundingBox');
    for i = 1: length(rect)
        area = rect(i).Area;
        box = rect(i).BoundingBox;
        ratio = box(3)/box(4);
        if(area > 200 && area < 600 ...
                && ratio > 0.5 && ratio < 4 ...
                && box(1) > 0.15*location(1,3) && box(1) < 0.55*location(1,3) ...
                && box(2) > 0.3*location(2,3) ...
                && box(3) > 5 && box(3) < 50 ...
                && box(4) > 10 && box(4) < 35)     %conditions
            rectangle('Position',...
                [box(1)+location(1,1), box(2)+location(2,1), box(3), box(4)],...
                'EdgeColor', 'r', 'LineWidth', 1.5);    %draw red box if fulfill condition
            updatedStruct(counter).Area = rect(i).Area;
            updatedStruct(counter).BoundingBox = rect(i).BoundingBox;
            counter = counter+1;
        else
            continue;   %if doesnt fulfill condition, skip this round
        end
    end
end