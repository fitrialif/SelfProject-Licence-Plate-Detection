function weightChange2 = backPropagation2(numOfInputNodes, numOfHiddenNodes,...
    numOfOutputNodes, inputNodes, hiddenNodes, outputWeight, learningRate, delta_k)

    delta_j = zeros(numOfHiddenNodes, 1);
    weightChange2 = zeros(numOfInputNodes, numOfOutputNodes);
    
    for i = 1: numOfHiddenNodes
        for j = 1: numOfOutputNodes
            delta_j(i, 1) = delta_j(i, 1) + delta_k(j, 1) * outputWeight(i, j);
        end
        delta_j(i, 1) = delta_j(i, 1) * hiddenNodes(i, 1) * (1 - hiddenNodes(i, 1));
    end
    
    assignin('base', 'delta_j', delta_j);   %save delta_j to workspace
    
    for i = 1: numOfInputNodes
        for j = 1: numOfHiddenNodes
            weightChange2(i, j) = learningRate * delta_j(j, 1) * inputNodes(i, 1);
            %find weightChange for ij
        end
    end
end