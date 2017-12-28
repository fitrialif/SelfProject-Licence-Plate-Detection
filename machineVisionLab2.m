clearvars -except inputWeight outputWeight I image;
clc;

tic;
learningRate = 0.5;
numOfInputNodes = 27;    %change by user
numOfHiddenNodes = 19;   %change by user
numOfOutputNodes = 10;   %change by user

inputNodes(numOfInputNodes, 1) = 1;   %set as input bias
hiddenNodes = zeros(numOfHiddenNodes, 1);
outputNodes = zeros(numOfOutputNodes, 1);
success = 0;
pic = 10;
fail = zeros(1);
location = 1;

for epochs = 1: 1
    %%
    for sequence = pic: pic     %from 1-10
        for num = 1: 1        %how many photos there
            targetNodes = generateRandomImage(sequence, num);
            
            %Input for feature one to ten
            for i = 1: 10
                str = strcat(num2str(i-1), '.PNG.');
                Iset = imread(str);  %enter image name here (template)
                Iset = imresize(Iset, [60, 40]);
                Iset = im2bw(Iset);
                BWset = bwmorph(Iset, 'skel', Inf);
                BWset = bwmorph(BWset, 'spur', 5);
                
                I = image;
                I = imresize(I, [size(Iset, 1), size(Iset, 2)]);
                I = medfilt2(I, [5 5]);
                BW = bwmorph(I, 'skel', Inf);
                BW = bwmorph(BW, 'spur', 5);
                inputNodes(i, 1) = calculation1(BW, BWset);
            end
            
            %%
            %Input for feature 11 to 26
            input2 = gridAnalysis(BW);
            for i = 11: numOfInputNodes-1
                inputNodes(i, 1) = input2(i-10, 1);
            end
            
            %%
            %Find the final value for each output nodes using forward propagation
            outputNodes = forwardPropagation(numOfInputNodes, numOfHiddenNodes, ...
                numOfOutputNodes, inputNodes, hiddenNodes, outputNodes, inputWeight, outputWeight);
            
            %%
            %Find the weight change for kj layer
%             weightChange1 = backPropagation1(numOfHiddenNodes, numOfOutputNodes,...
%                 hiddenNodes, outputNodes, targetNodes, learningRate);
%             
%             %%
%             %Find the weight change for ji layer
%             weightChange2 = backPropagation2(numOfInputNodes, numOfHiddenNodes,...
%                 numOfOutputNodes, inputNodes, hiddenNodes, outputWeight, learningRate, delta_k);
%             
%             outputWeight = outputWeight + weightChange1;
%             inputWeight = inputWeight + weightChange2;
            
%%
%validate the accuracy of result
            count = 0;
            updated = zeros(10, 1);
            
            for i = 1: 10
                if(outputNodes(i, 1) > 0.8)
                    updated(i, 1) = 1;
                end
                count = count + updated(i, 1);
            end
            
            if(isequal(targetNodes, updated) == 1)
                success = success + 1;
            else
                fail(location, 1) = num;    %determine which number failed to produce correct result
                location = location + 1;
            end
        end
    end
end
toc