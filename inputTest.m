function inputNodes = inputTest(numOfInputNodes, I)
    inputNodes = zeros(numOfInputNodes, 1);
    for i = 1: size(I, 1)
        for j = 1: size(I, 2)/2
            if(I(i, j) == 0)
                inputNodes(1, 1) = inputNodes(1, 1) + 1;
            end
        end
    end
    for i = 1: size(I, 1)
        for j = size(I, 2)/2+1: size(I, 2)
            if(I(i, j) == 0)
                inputNodes(2, 1) = inputNodes(2, 1) + 1;
            end
        end
    end
    for i = 1: numOfInputNodes
        inputNodes(i, 1) = inputNodes(i, 1) / (size(I,1) * size(I,2));
    end
    inputNodes(3, 1) = 1;
end