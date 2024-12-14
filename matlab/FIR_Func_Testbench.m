close all
clear


Fs = 10000; %Fs = 10kHz
Ts = 1/Fs;
Ns = 10000; % CHECK

t = [ 0: Ts: Ts * ( Ns-1 ) ];

x1 = sin(2*pi*500*t); % X1 = 2kHz
x2 = sin(2*pi*750*t); % X2 = 3kHz ( To be removed )

x = x1 + x2; % Input Signal
xInput = fi(x, 1, 16, 8);

csvwrite('FIR_Inputs.csv', xInput)

coeffs = fir1(63, ( 560 / (Fs/2) ));

outputs = FIR_Func(xInput, coeffs);
outputs = half(outputs);

csvwrite('FIR_Outputs.csv', outputs)

figure;
    freqz(coeffs)

figure;
    subplot(2,1,1)
    plot(t, xInput, 'color', 'red')
    ylabel("Input Signal")
    xlabel("Time (seconds)")
    xlim([0 0.02])
    
    subplot(2,1,2)
    plot(t, outputs, 'color', 'blue')
    ylabel("Filtered Signal")
    xlabel("Time (seconds)")
    xlim([0 0.02])