function location = determine_car_location(BWRef, BWInput)
    location = zeros(2, 3);
    threshold = 78;
    vertical = zeros(size(BWRef, 1), 1);
    horizontal = zeros(1, size(BWRef, 2));
    difference = abs(BWRef - BWInput);
    
    %%
    %vertical projection
    for i = 1: size(difference, 1)
        for j = 1: size(difference, 2)
            if(difference(i, j) ~= 0)
                vertical(i, 1) = vertical(i, 1) + 1;
            end
        end
    end
    
    %%
    %horizontal projection
    for i = 1: size(difference, 2)
        for j = 1: size(difference, 1)
            if(difference(j, i) ~= 0)
                horizontal(1, i) = horizontal(1, i) + 1;
            end
        end
    end
    
    %%
    %horizontal coordinates
    values = zeros(2, 3);
    for i = 1: size(horizontal, 2)-1
        if(horizontal(1, i) < threshold && horizontal(1, i+1) >= threshold)
            values(1, 1) = i;
        elseif(horizontal(1, i) >= threshold && horizontal(1, i+1) < threshold)
            values(1, 2) = i+1;
            values(1, 3) = values(1, 2) - values(1, 1) - 1;
            if(values(1, 3) > values(2, 3))
                for j = 1: 3
                    values(2, j) = values(1, j);
                end
            end
        else
            continue;
        end
    end
    
    for i = 1: 3
        location(1, i) = values(2, i);
    end
    
    %%
    %vertical coordinates
    values = zeros(2, 3);
    for i = 1: size(vertical, 1)-1
        if(vertical(i, 1) < threshold && vertical(i+1, 1) >= threshold)
            values(1, 1) = i;
        elseif(vertical(i, 1) >= threshold && vertical(i+1, 1) < threshold)
            values(1, 2) = i+1;
            values(1, 3) = values(1, 2) - values(1, 1) - 1;
            if(values(1, 3) > values(2, 3))
                for j = 1: 3
                    values(2, j) = values(1, j);
                end
            end
        else
            continue;
        end
    end
    
    for i = 1: 3
        location(2, i) = values(2, i);
    end
end