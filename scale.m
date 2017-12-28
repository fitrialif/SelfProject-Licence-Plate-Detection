function vScale = scale(I, Iset)
    scaleFactors = zeros(2, 1);
    for sample = 1: 2
        if(sample == 1)
            image = I;
        else
            image = Iset;
        end
        whitePix = 0;
        for rowI = 1: size(image, 1)/4
            for colI = 1: size(image, 2)
                if(image(rowI, colI) == 1)
                    whitePix = whitePix+1;
                    if(whitePix == 1)
                        coordinate(1, 1) = rowI;
                    end
                end
            end
        end

        for rowI = size(image, 1)*3/4: size(image, 1)
            blackPix = 0;
            for colI = 1: size(image, 2)
                if(image(rowI, colI) == 0)
                    blackPix = blackPix+1;
                    if(blackPix == size(image, 2))
                        coordinate(2, 1) = rowI;
                    else
                        coordinate(2, 1) = 61;
                    end
                end
            end
        end
        scaleFactors(sample, 1) = abs(coordinate(2, 1) - coordinate(1, 1));
    end
    vScale = scaleFactors(2, 1) / scaleFactors(1, 1);
end

