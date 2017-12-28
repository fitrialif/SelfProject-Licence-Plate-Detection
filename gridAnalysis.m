%Designed by Ho Kar Wye
function input2 = gridAnalysis(BW)
    row = 1;
    col = 1;
    input2 = zeros(16, 1);
    numOfGridRow = 4;   %change by user
    numOfGridCol = 4;   %change by user
    counter = zeros(numOfGridRow, numOfGridCol);
    
    %Grid Analysis codes
    for gridRow = 1: numOfGridRow       %4 column grids
        for gridCol = 1: numOfGridCol   %4 row grids
            for i = row: row+14     %15 rows per grid
                for j = col: col+9      %10 columns per grid
                    if(BW(i, j) == 1)    %check to see whether meets condition
                        counter(gridRow, gridCol) = counter(gridRow, gridCol)+1;
                    end
                end
            end
            if(col+9 < 40)  %if not yet reach end of grid, continue increment
                col = col+10;
            else            %refresh column number when grid analysis has been finished
                col = 1;
            end
            counter(gridRow, gridCol) = counter(gridRow, gridCol) / 150;
        end
        row = row+15;       %updates new row number after one grid is completed
    end
    
    k = 1;
    for i = 1: 4
        for j = 1: 4
            input2(k, 1) = counter(j, i);
            k = k+1;
        end
    end
end