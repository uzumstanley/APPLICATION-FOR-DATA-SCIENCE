% Define the small matrix
small_matrix = [10, 20; 30, 40];

% Define the target size for interpolation
target_size = [4, 4];

% Compute the row and column ratios
row_ratio = (1:target_size(1)) / target_size(1) * (size(small_matrix, 1) - 1) + 1;
col_ratio = (1:target_size(2)) / target_size(2) * (size(small_matrix, 2) - 1) + 1;

% Perform bilinear interpolation
[bigger_col, bigger_row] = meshgrid(col_ratio, row_ratio);
bigger_matrix = interp2(small_matrix, bigger_col, bigger_row, 'linear');

% Display the results
disp("Bilinear Interpolated Matrix:");
disp(bigger_matrix);


% Define the expected bigger matrix
expected_bigger_matrix = [10, 12, 17, 20;
                          15, 17, 22, 25;
                          25, 27, 32, 35;
                          30, 32, 37, 40];

% Check if the computed matrix matches the expected one
if isequal(bigger_matrix, expected_bigger_matrix)
    disp("The computed matrix matches the expected bigger matrix.");
else
    disp("The computed matrix does not match the expected bigger matrix.");
end

