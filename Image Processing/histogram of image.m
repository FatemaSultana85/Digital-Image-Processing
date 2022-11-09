I=imread('cameraman.png');


figure();
subplot(2,2,1);
imshow(I);
title('Input image I');


[row,col]=size(I);
histogram=zeros(1,256);
for i=1:row
    for j=1:col
        histogram(I(i,j))=histogram(I(i,j))+1;
    end
end


subplot(2,2,3);
bar(histogram);
title('Histogram of Input image I');



img = I;
I = im2double(I);
A = min(min(I));
B = max(max(I));
D = B - A;
M = 255;
R = I - A;
R = R./D;
R = R*M;
R = R + A;
R = uint8(R);



subplot(2,2,2);
imshow(R);
title('Output image R');



[row1,col1]=size(R);

histogramm=zeros(1,256);
for i=1:row1
    for j=1:col1
        histogramm(R(i,j)+1)=histogramm(R(i,j)+1)+1;
    end
end


subplot(2,2,4);
bar(histogramm);
title('Histogram of Output image R');
imwrite(R , 'output1.jpg');


