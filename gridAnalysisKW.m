%Designed by Ho Kar Wye

numOfImages = 349;      %set by user

for photo = 1: numOfImages;
    numofones(photo,1) = 0;
    clearvars -except numofones photo;
    image = strcat('1 (', num2str(photo), ').bmp');
    I=imread(image);

    I = imresize(I,[60, 40]);
    I = im2bw(I);
    row = 1;
    col = 1;
    numOfGridRow = 4;   %change by user
    numOfGridCol = 4;   %change by user
    counter = zeros(numOfGridRow, numOfGridCol);
    
    
    %%
    %Grid Analysis codes
    for gridRow = 1: numOfGridRow       %4 column grids
        for gridCol = 1: numOfGridCol   %4 row grids
            for i = row: row+14     %15 rows per grid
                for j = col: col+9      %10 columns per grid
                    if(I(i, j) == 1)    %check to see whether meets condition
                        counter(gridRow, gridCol) = counter(gridRow, gridCol)+1;
                    end
                end
            end
            if(col+9 < 40)  %if not yet reach end of grid, continue increment
                col = col+10;
            else            %refresh column number when grid analysis has been finished
                col = 1;
            end
        end
        row = row+15;       %updates new row number after one grid is completed
    end

    for i = 1 : size(counter,1)
        for j = 1 : size(counter,2)
            if (counter(i,j)>40)
                numofones(photo, 1) = numofones(photo, 1) + 1;
            end
        end
    end
end

%%
a = counter(1,1)/150
b = counter(2,1)/150
c = counter(3,1)/150
d = counter(4,1)/150
e = counter(1,2)/150
f = counter(2,2)/150
g = counter(3,2)/150
h = counter(4,2)/150
i = counter(1,3)/150
j = counter(2,3)/150
k = counter(3,3)/150
l = counter(4,3)/150
m = counter(1,4)/150
n = counter(2,4)/150
o = counter(3,4)/150
p = counter(4,4)/150

numofGridRow2 = 16;
numofGridCol2 = 1;
counter1 = zeros(numofGridRow2,numofGridCol2);

counter1(1,numofGridCol2)= a
counter1(2,numofGridCol2)= b
counter1(3,numofGridCol2)= c
counter1(4,numofGridCol2)= d
counter1(5,numofGridCol2)= e
counter1(6,numofGridCol2)= f
counter1(7,numofGridCol2)= g
counter1(8,numofGridCol2)= h
counter1(9,numofGridCol2)= i
counter1(10,numofGridCol2)= j
counter1(11,numofGridCol2)= k
counter1(12,numofGridCol2)= l
counter1(13,numofGridCol2)= m
counter1(14,numofGridCol2)= n
counter1(15,numofGridCol2)= o
counter1(16,numofGridCol2)= p