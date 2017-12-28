function input1 = calculation1(BW, BWset)
    diff = 0;
    counterBWset = 0;
    counterBW = 0;

    for i = 1: size(BWset, 1)
        for j = 1: size(BWset, 2)
            if (BWset(i, j) == 1)
                counterBWset = counterBWset + 1;    %if white pixels on template image
            end
            if (BW(i, j) == 1)
                counterBW = counterBW + 1;      %if white pixels on input image
            end
            diff = diff + (BWset(i, j) - BW(i, j)) ^ 2; %find the differences
        end
    end

    input1 = diff / (counterBW + counterBWset); %return as input
end