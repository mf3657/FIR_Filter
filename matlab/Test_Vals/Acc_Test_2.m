% Set the seed for reproducibility
rng(42);

% Set the fixed-point properties
wordLength = 16;
fractionLength = 8; % Adjust for decimal precision

% Set the number of taps (coefficients)
taps = 64;

% Generate 3 random 16-bit integer values for data_in and coeff (simulating 3 taps)
data_in_int = randi([-128*256, 128*256-1], 1, taps); % Random integer values scaled by 256
coeff_int = randi([-256, 256-1], 1, taps); % Random integer values scaled by 256
coeff_int_raw = coeff_int/256;

% Preallocate cell arrays for binary strings
bin_data_in = strings(taps, 1);
bin_coeff = strings(taps, 1);

% Convert data_in to 8.8 fixed-point binary format with underscore
for i = 1:taps
    % Convert integer to binary (16 bits)
    bin_value = dec2bin(data_in_int(i), 16);
    
    % Extract the integer and fractional parts and insert the underscore
    integer_part = bin_value(1:8);  % First 8 bits
    fractional_part = bin_value(9:end);  % Last 8 bits
    
    % Concatenate with underscore in between
    bin_data_in(i) = strcat(integer_part, '_', fractional_part);
    
    % Convert coefficient to binary (16 bits)
    bin_value_coeff = dec2bin(coeff_int(i), 16);
    
    % Extract the integer and fractional parts and insert the underscore
    integer_part_coeff = bin_value_coeff(1:8);  % First 8 bits
    fractional_part_coeff = bin_value_coeff(9:end);  % Last 8 bits
    
    % Concatenate with underscore in between
    bin_coeff(i) = strcat(integer_part_coeff, '_', fractional_part_coeff);
end

% Open text files for writing the data
fileID_data_in = fopen('data.txt', 'w');
fileID_coeff = fopen('coeff.txt', 'w');
fileID_output = fopen('output.txt', 'w');

% Write the binary data to the text files, one value per line
for i = 1:taps
    % Write data_in to 'data.txt'
    fprintf(fileID_data_in, '%s\n', bin_data_in(i));
    
    % Write coeff to 'coeff.txt'
    fprintf(fileID_coeff, '%s\n', bin_coeff(i));
end

% Initialize the accumulator (with wider bit length to prevent overflow)
accumulator = 0;

% Perform the multiply-accumulate (MAC) operation using the binary inputs
for i = 1:taps
    % Multiply the fixed-point values (scaled by 256)
    product = data_in_int(i) * coeff_int_raw(i);
    
    % Accumulate the result
    accumulator = accumulator + product;
end

% Convert the accumulator to binary with 16.16 fixed-point format
bin_accumulator = dec2bin(accumulator, 32); % 32-bit binary representation

% Write the accumulator result to 'output.txt'
fprintf(fileID_output, '%s\n', bin_accumulator);

% Close the files after writing
fclose(fileID_data_in);
fclose(fileID_coeff);
fclose(fileID_output);

% Display results
disp('Data In:');
disp(data_in_int);
disp('Coefficients:');
disp(coeff_int);
disp('MAC Result:');
disp(accumulator);
