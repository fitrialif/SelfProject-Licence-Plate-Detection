function weightChange1 = backPropagation1(numOfHiddenNodes, numOfOutputNodes,...
    hiddenNodes, outputNodes, targetNodes, learningRate)

    delta_k = zeros(numOfOutputNodes, 1);
    weightChange1 = zeros(numOfHiddenNodes, numOfOutputNodes);
    
    for i = 1: numOfOutputNodes
        delta_k(i, 1) = (targetNodes(i , 1) - outputNodes(i, 1)) * outputNodes(i, 1)...
             * (1 - outputNodes(i, 1)); %find delta_k
    end
    
    assignin('base', 'delta_k', delta_k);

    for i = 1: numOfHiddenNodes
        for j = 1: numOfOutputNodes
            weightChange1(i, j) = learningRate * delta_k(j, 1) * hiddenNodes(i, 1);
            %find weightChange for jk
        end
    end
end