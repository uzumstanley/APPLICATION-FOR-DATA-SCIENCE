% Define the given matrix
I = [0 0 1 4 4 5;
     0 1 3 4 3 4;
     1 3 4 2 1 3;
     4 4 3 1 0 0;
     5 4 2 1 0 0;
     5 5 4 3 1 0];

% Compute the entropy of each pixel
entropy_matrix = zeros(size(I));
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        counts = histcounts(I(i, j), 0:max(I(i, j)));
        probabilities = counts / sum(counts);
        entropy_value = -sum(probabilities .* log2(probabilities + eps));
        entropy_matrix(i, j) = entropy_value;
    end
end

% Determine the threshold value
threshold = mean(entropy_matrix(:));

% Apply thresholding
binary_matrix = entropy_matrix > threshold;

% Display the results
disp('Entropy Matrix:');
disp(entropy_matrix);
disp('Threshold:');
disp(threshold);
disp('Binary Matrix:');
disp(binary_matrix);
