% Given original matrix
original_matrix = [10, 20; 30, 40];

% Given expanded matrix
expanded_matrix = [
    10, 12, 17, 20;
    15, 17, 22, 25;
    25, 27, 32, 35;
    30, 32, 37, 40
];

% Get necessary variables
[in_rows, in_cols] = size(original_matrix);
[out_rows, out_cols] = size(expanded_matrix);

% Define grid of coordinates in the expanded image
[cf, rf] = meshgrid(1:out_cols, 1:out_rows);

% Calculate scaling factors
ratio = out_rows / in_rows;

% Convert coordinates to match the original matrix
cf = cf / ratio;
rf = rf / ratio;

% Compute floor indices
c = floor(cf);
r = floor(rf);

% Cap indices to stay within bounds
r(r < 1) = 1;
c(c < 1) = 1;
r(r > in_rows - 1) = in_rows - 1;
c(c > in_cols - 1) = in_cols - 1;

% Calculate delta values
delta_R = rf - r;
delta_C = cf - c;

% Initialize output image
out = zeros(out_rows, out_cols);

% Interpolate each channel
for idx = 1:size(original_matrix, 3)
    chan = double(original_matrix(:, :, idx));
    in1_ind = sub2ind([in_rows, in_cols], r, c);
    in2_ind = sub2ind([in_rows, in_cols], r + 1, c);
    in3_ind = sub2ind([in_rows, in_cols], r, c + 1);
    in4_ind = sub2ind([in_rows, in_cols], r + 1, c + 1);
    
    tmp = chan(in1_ind) .* (1 - delta_R) .* (1 - delta_C) + ...
          chan(in2_ind) .* (delta_R) .* (1 - delta_C) + ...
          chan(in3_ind) .* (1 - delta_R) .* (delta_C) + ...
          chan(in4_ind) .* (delta_R) .* (delta_C);
    
    out(:, :, idx) = cast(tmp, 'like', original_matrix);
end

% Display the result
disp("Bilinear Interpolated Matrix:");
disp(out);