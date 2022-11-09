clear;
%%Read and Resize Images
img1 = imread('inputImg1.jpg');
img2 = imread('inputImg2.jpg');
blank = imread('inputImg3.jpg');

row = 6;
row_size = 200;
new_size = row * row_size;
img1 = imresize(img1, [new_size new_size]);
img2 = imresize(img2, [new_size new_size]);
blank = imresize(blank, [new_size new_size]);

%%Display input Images
figure; imshow(img1);
figure; imshow(img2);
figure; imshow(blank);

%%Construct Mixed Image
final_img = blank;
for i = 2 : 2 : col
    final_img(row_size * (i - 2) + 1 : row_size * (i-1), :, :) = img1( row_size * (i - 2) + 1 : row_size * (i-1),:, :); % insert img1 in odd rows
    final_img(row_size * (i - 1) + 1 : row_size * i, :, :) = img2(row_size * (i - 1) + 1 : row_size * i, :, :);% insert img2 in even rows
end


figure; imshow(final_img);

%%New Image
imwrite(final_img , 'output.jpg');


