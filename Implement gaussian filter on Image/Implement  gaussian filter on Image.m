I = imread('input.jpg');
[row,col,depth] = size(I);
if depth ~= 1 
    I = rgb2gray(I);
end
I = imnoise(I,'Gaussian',0.04,0.003);
old_img = I;
I = double(I);

[row,col,depth] = size(I);


kernel_Size = 5;
start_X_Y = -2;


% for 5*5 matrix  
gaussian_X = zeros(kernel_Size,kernel_Size);
gaussian_Y = zeros(kernel_Size,kernel_Size);
start = start_X_Y;
for i = 1:kernel_Size
    gaussian_X(1:kernel_Size,i:i) = start;
    start = start + 1 ;
end
start = start_X_Y;
for i = 1:kernel_Size
    gaussian_Y(i:i,1:kernel_Size) = start;
    start = start + 1 ;
end

gaussian_X
gaussian_Y

prompt = 'Enter the sigma value : ';
sigma = input(prompt);

ker = gaussianFilter(gaussian_X,gaussian_Y,sigma);

new_img = zeros(row+2,col+2);
new_img(2:row+1,2:col+1) = I(1:row,1:col);

[new_img_row,new_img_col] = size(new_img);

outputImage = zeros(row,col);

for i = 1:new_img_row - (kernel_Size-1)
    for j = 1:new_img_col- (kernel_Size-1)
       new_img(i:i + (kernel_Size-1) ,j:j +(kernel_Size-1));
       data =  new_img(i:i + (kernel_Size-1) ,j:j + (kernel_Size-1)).*ker ;
       data = sum( data(:) );
       outputImage(i,j) = data;
    end
end

outputImage = uint8(outputImage);

subplot(1,2,1),imshow(old_img),title("Input Image");
subplot(1,2,2),imshow(outputImage),title("Output Image (with a sigma value of 5)");
imwrite(outputImage , 'Output Image (with a sigma value of 5).jpg');


function kernel = gaussianFilter(gaussian_X, gaussian_Y, sigma)
    kernel = -(power(gaussian_X,2) + power(gaussian_Y,2)) / (2*power(sigma,2));
    kernel = exp(kernel);
    kernel = (1.0 / (2 * pi * power(sigma,2))) * kernel
end