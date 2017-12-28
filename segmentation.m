function location = segmentation(vProjection, crop)
    threshold = 53;
    counter = 1;
    for i = 1: size(vProjection, 2)-1
        if(vProjection(1, i) < threshold && vProjection(1, i+1) > threshold)
            %boundary on right of number
            location(counter, 1) = i+1;
            counter = counter+1;
        elseif(vProjection(1, i) > threshold && vProjection(1, i+1) < threshold)
            %boundary on left of number
            location(counter, 1) = i;
            counter = counter+1;
        end
    end
    
    for i = 1: size(location, 1)-1
        if(i == 1)
            if(location(1,1) > 15)
                coordinates = [1, 1, location(1,1)-1, 59];
                rectangle('Position', coordinates, 'EdgeColor', 'g', 'LineWidth', 1.5);
                newCrop = imcrop(crop, coordinates);
                figure; imshow(newCrop);
                continue;
            else
                coordinates = [location(i,1), 1, location(i+1,1)-location(i,1), 59];
                rectangle('Position', coordinates, 'EdgeColor', 'g', 'LineWidth', 1.5);
                newCrop = imcrop(crop, coordinates);
                figure; imshow(newCrop);
                continue;
            end
        elseif(location(i+1,1)-location(i,1) > 15)
            coordinates = [location(i,1), 1, location(i+1,1)-location(i,1), 59];
            rectangle('Position', coordinates, 'EdgeColor', 'g', 'LineWidth', 1.5);
            newCrop = imcrop(crop, coordinates);
            figure; imshow(newCrop);
            continue;
        end
    end
end