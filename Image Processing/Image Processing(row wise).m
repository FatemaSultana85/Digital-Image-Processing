clear;
%%Read and Resize Images
img1 = imread('inputImg1.jpg');
img2 = imread('inputImg2.jpg');
blank = imread('inputImg3.jpg');


partition = 6;
row_size = 100;
new_size = partition * row_size;
img1 = imresize(img1, [new_size new_size]);
img2 = imresize(img2, [new_size new_size]);
blank = imresize(blank, [new_size new_size]);


%%Display Input Images
figure; imshow(img1);
title('Image1');
figure; imshow(img2);
title('Image2');
figure; imshow(blank);
title('Blank Image');



%%Construct mixed Image by replacing the odd rows with the portion of the first image and even rows with the portion of the second image
final_img = blank;
for i = 2 : 2 : partition
    final_img(row_size * (i - 2) + 1 : row_size * (i-1), :, :) = img1(row_size * (i - 2) + 1 : row_size * (i-1), :, :); % insert img1 in odd rows
    final_img(row_size * (i - 1) + 1 : row_size * i, :, :) = img2(row_size * (i - 1) + 1 : row_size * i, :, :);% insert img2 in even rows
end



figure; imshow(final_img);
title('Final Image');


%%Output Image
imwrite(final_img , 'output.jpg');


