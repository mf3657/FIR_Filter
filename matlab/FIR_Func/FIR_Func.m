function y = FIR_Func(xInput, coeffs)

% defining variables and sizes
nx = length(xInput);                % length of input (10000)
ncoeff = length(coeffs);            % length of coefficients array (64)
y = zeros(1, nx);                   % output array
p = 0;                              % buffer index
buffer = zeros(1, ncoeff);          % circular buffer

for n = 1:nx
    % check buffer index and update if necessary
    p = p+1;
    if p > ncoeff
        p = 1;
    end
    % update buffer
    buffer(p) = xInput(n);
    
    % initialize variables for convolution
    acc = 0;
    k = p;                          % set k to where buffer index currently is
    
    % convolution
    for j = 1:ncoeff
       acc = acc + coeffs(j)*buffer(k);  %MAC
       k = k - 1;
       % decrement input signal index and if reaches beginning of buffer start at end
       if k < 1
           k = ncoeff;
       end
    end
    y(n) = acc;
end