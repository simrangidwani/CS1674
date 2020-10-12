%computes the ouput of max-ppooling
function [Output] = my_pool(Input, Pool_Size)
    [inputX, inputY] = size(Input);
    Pool_Size = Pool_Size;

    dimension = floor(inputX/Pool_Size);
    outputMat = zeros(dimension,dimension);
    [outputX, outputY] = size(outputMat);    
    currX = 0;
    
    %loop over input
    for i = 1:Pool_Size:inputX
        currX = currX + 1; 
        currY = 0;
        for j = 1:Pool_Size:inputY
           currY = currY + 1;  
           %loop pooling window
           currMax = 0;
           for x = i:i+Pool_Size-1
              for y = j:j+Pool_Size-1
                  newMax = Input(x,y);
                  currMax = max(currMax, newMax);
              end
           end
           
           outputMat(currX, currY) = currMax;
           
        end
    end
    Output = outputMat;
    %display(Output);
end
