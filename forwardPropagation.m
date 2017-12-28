function outputNodes = forwardPropagation(numOfInputNodes, numOfHiddenNodes, ...
    numOfOutputNodes, inputNodes, hiddenNodes, outputNodes, inputWeight, outputWeight)
    for i = 1: numOfHiddenNodes-1
        for j = 1: numOfInputNodes
            hiddenNodes(i, 1) = hiddenNodes(i, 1) + inputNodes(j, 1) * inputWeight(j, i);
        end
        hiddenNodes(i, 1) = 1 / (1 + exp(-hiddenNodes(i, 1)));  %activation function
    end
    
    hiddenNodes(numOfHiddenNodes, 1) = 1;  %set as bias input
    assignin('base', 'hiddenNodes', hiddenNodes);

    for i = 1: numOfOutputNodes
        for j = 1: numOfHiddenNodes
            outputNodes(i, 1) = outputNodes(i, 1) + hiddenNodes(j, 1) * outputWeight(j, i);
        end 
        outputNodes(i, 1) = 1 / (1 + exp(-outputNodes(i, 1)));  %activation function
    end
end