%computes the ouput of aplying a filter over an image with given padding
%and stride
function [Output] = my_conv(Image, Filter, Padding, Stride)

    [imX, imY] = size(Image);
    [filterX, filterY] = size(Filter);   
    %formula from slides
    dimension = ((imX+(2*Padding)-filterX)/Stride)+1;
    outputMat = zeros(dimension, dimension);  
    [outputX, outputY] = size(outputMat);
    
    paddedImage = zeros(imX+Padding+Padding, imY+Padding+Padding);
    paddedImage(Padding+1:Padding+imX, Padding+1:Padding+imY) = Image;
    [paddedX, paddedY] = size(paddedImage);
    %display(paddedImage);
   
    %applying filter onto image
    currX = 0;
    %looping over the padded image
    for i = ceil(filterX/2):Stride:paddedX-floor(filterX/2)
       currX = currX + 1;
       currY = 0;
       for j=ceil(filterY/2):Stride:paddedY-floor(filterY/2)
           currY = currY + 1;
           cumTotal = 0;
           currFilterX = 0;
           for x = i - floor(filterX/2):i+floor(filterX/2)
               currFilterX = currFilterX+1;
               currFilterY = 0;
               for y = j - floor(filterY/2):j+floor(filterY/2)
                   currFilterY = currFilterY+1;
                   cumTotal = cumTotal + (paddedImage(x,y)*Filter(currFilterX,currFilterY));          
               end
           end
           
           outputMat(currX,currY) = cumTotal;
     
       end
    end
    
    Output = outputMat;
    %display(Output);

end