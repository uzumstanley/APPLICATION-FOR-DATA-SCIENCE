% Load the given image (replace with actual image data)
image = [0, 1, 4, 4, 5;
         0, 1, 3, 4, 0;
         1, 3, 4, 0, 0;
         0, 1, 3, 4, 2;
         1, 3, 4, 3, 1;
         0, 0, 5, 4, 0;
         0, 0, 5, 4, 3;
         1, 0, 0, 0, 0;
         5, 5, 4, 3, 1;
         0, 0, 0, 0, 0];

% Calculate the histogram
hist = zeros(256, 1);
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        pixel_value = image(i, j) + 1;
        hist(pixel_value) = hist(pixel_value) + 1;
    end
end

% Calculate the cumulative distribution function (CDF)
cdf = zeros(256, 1);
cdf(1) = hist(1);
for i = 2:256
    cdf(i) = cdf(i - 1) + hist(i);
end

% Normalize the CDF
cdf_normalized = cdf / max(cdf);

% Calculate the transformation function
T = round(255 * cdf_normalized);

% Apply the transformation to the image
equalized_image = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        equalized_image(i, j) = T(image(i, j) + 1);
    end
end

% Display the original and equalized images
figure;
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

subplot(1, 2, 2);
imshow(equalized_image, []);
title('Equalized Image');
%% 

% Load the given image (replace with actual image data)
image = imread('gray.jpg');

% Calculate the histogram
hist = zeros(256, 1);
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        pixel_value = image(i, j) + 1;
        hist(pixel_value) = hist(pixel_value) + 1;
    end
end

% Calculate the cumulative distribution function (CDF)
cdf = zeros(256, 1);
cdf(1) = hist(1);
for i = 2:256
    cdf(i) = cdf(i - 1) + hist(i);
end

% Normalize the CDF
cdf_normalized = cdf / max(cdf);

% Calculate the transformation function
T = round(255 * cdf_normalized);

% Apply the transformation to the image
equalized_image = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        equalized_image(i, j) = T(image(i, j) + 1);
    end
end

% Display the original and equalized images
figure;
subplot(1, 2, 1);
imshow(image, []);
title('Original Image');

subplot(1, 2, 2);
imshow(equalized_image, []);
title('Equalized Image');

%% 

% Read the image
img = imread('gray.jpg');

% Convert the image to grayscale if it is not
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Get the dimensions of the image
[rows, columns] = size(img);

% Initialize the histogram array
histogram = zeros(256, 1);

% Calculate the histogram
for i = 1:rows
    for j = 1:columns
        pixel_value = img(i, j) + 1; % Add 1 to avoid indexing issues
        histogram(pixel_value) = histogram(pixel_value) + 1;
    end
end

% Calculate the cumulative distribution function (CDF)
cdf = zeros(256, 1);
cdf(1) = histogram(1);
for i = 2:256
    cdf(i) = cdf(i - 1) + histogram(i);
end

% Normalize the CDF
cdf_normalized = cdf / max(cdf);

% Perform histogram equalization
equalized_img = zeros(rows, columns);
for i = 1:rows
    for j = 1:columns
        pixel_value = img(i, j) + 1;
        equalized_img(i, j) = cdf_normalized(pixel_value);
    end
end

% Display the equalized image
imshow(equalized_img);







