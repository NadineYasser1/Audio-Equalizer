

%Taking the file name from the user and reading the file is correct
filename = input('Please enter the file name (add .wav) ','s');
[y,fs]=audioread(filename);                  %reading the audio file
fsOut=fs;                                    %output sample rate
%Taking the gain of each band from the user  g1=input('Please enter the gain of the first band in db ');
g2=input('Please enter the gain of the second band in db ');
g3=input('Please enter the gain of the third band in db ');
g4=input('Please enter the gain of the fourth band in db ');
g5=input('Please enter the gain of the fifth band in db ');
g6=input('Please enter the gain of the sixth band in db ');
g7=input('Please enter the gain of the seventh band in db ');
g8=input('Please enter the gain of the eighth band in db ');
g9=input('Please enter the gain of the ninth band in db ');

%Choosing the type of the filter
type=input('Please choose the type of the filter 1.IIR 2.FIR [1/2] ');

%Taking the output sample rate from the user if it required 
c = input('Do you want to change the output sample rate [Y/N] ','s');
if(c=='Y' || c=='y')
    fsOut=input('Please enter the output sample rate ');
end

switch type                                     %switch for choosing between IIR and FIR
    case 1
    %Filter IIR with order N=15
    N=15;                                       %filter order 15

    %IIR filter 1 (0-170Hz)
    [z1,p1,k1]=butter(N,2*170/fs);              %pole, zero, and gain specs of filter
    [num1,den1]=zp2tf(z1,p1,k1);                %numerator and denominator of H(s)
    [hd1,wd1]=freqz(num1,den1);                 %determine the frequency response
    mag1=abs(hd1);                              %compute magnitude response of digital filter
    phase1=angle(hd1)*180/pi;                   %compute the phase response
    figure(1);                                  %figure 1 to plot gain, phase, impulse and step response
    subplot(5,1,1);
    plot(wd1/pi,mag1);grid;                      %plot magnitude response
    title('Magnitude of filter 1');
    subplot(5,1,2);
    plot(wd1/pi,phase1);grid;                    %plot the phase response
    title('phase of filter 1');
    sys1 = tf(num1,den1);                        %print the transfer function
    subplot(5,1,3);
    step(sys1);                                  %plot the step response
    subplot(5,1,4);
    impulse(sys1);                               %plot the impulse response
    y1=filter(num1,den1,y);                      %filtered output of filter 1
    subplot(5,1,5);
    zplane(z1,p1);                               %zeros and poles plot of 1st filter
    title('zplane of filter 1');

    %IIR filter 2 (170Hz-310Hz)
    [z2,p2,k2]=butter(N,[2*170/fs,2*310/fs]);    %pole, zero, and gain specs of filter
    [num2,den2]=zp2tf(z2,p2,k2);                 %numerator and denominator of H(s)
    [hd2,wd2]=freqz(num2,den2);                  %determine the frequency response
    mag2=abs(hd2);                               %compute magnitude response of digital filter
    phase2=angle(hd2)*180/pi;                    %compute the phase response
    figure(2);
    subplot(5,1,1);
    plot(wd2/pi,mag2);grid;                      %plot magnitude response
    title('Magnitude of filter 2');
    subplot(5,1,2);
    plot(wd2/pi,phase2);grid;                    %plot the phase response
    title('phase of filter 2');
    sys2 = tf(num2,den2);                        %print the transfer function
    subplot(5,1,3);
    step(sys2);                                  %plot the step response
    subplot(5,1,4);
    impulse(sys2);                               %plot the impulse response
    y2=filter(num2,den2,y);                      %filtered output of filter 2
    subplot(5,1,5);
    zplane(z2,p2);                               %zeros and poles plot of 2nd filter
    title('zplane of filter 2');

    %IIR filter 3 (310Hz-600Hz)
    [z3,p3,k3]=butter(N,[2*310/fs,2*600/fs]);    %pole, zero, and gain specs of filter
    [num3,den3]=zp2tf(z3,p3,k3);                 %numerator and denominator of H(s)
    [hd3,wd3]=freqz(num3,den3);                  %determine the frequency response
    mag3=abs(hd3);                               %compute magnitude response of digital filter
    phase3=angle(hd3)*180/pi;                    %compute the phase response
    figure(3);
    subplot(5,1,1);
    plot(wd3/pi,mag3);grid;                      %plot magnitude response
    title('Magnitude of filter 3');
    subplot(5,1,2);
    plot(wd3/pi,phase3);grid;                    %plot the phase response
    title('phase of filter 3');
    sys3 = tf(num3,den3);                        %print the transfer function
    subplot(5,1,3);
    step(sys3);                                  %plot the step response
    subplot(5,1,4);
    impulse(sys3);                               %plot the impulse response
    y3=filter(num3,den3,y);                      %filtered output of filter 3
    subplot(5,1,5);
    zplane(z3,p3);                               %zeros and poles plot of 3rd filter
    title('zplane of filter 3');
    

    %IIR filter 4 (600Hz-1000Hz)
    [z4,p4,k4]=butter(N,[2*600/fs,2*1000/fs]);    %pole, zero, and gain specs of filter
    [num4,den4]=zp2tf(z4,p4,k4);                  %numerator and denominator of H(s)
    [hd4,wd4]=freqz(num4,den4);                   %determine the frequency response
    mag4=abs(hd4);                                %compute magnitude response of digital filter
    phase4=angle(hd4)*180/pi;                     %compute the phase response
    figure(4);
    subplot(5,1,1);
    plot(wd4/pi,mag4);grid;                       %plot magnitude response
    title('Magnitude of filter 4');
    subplot(5,1,2);
    plot(wd4/pi,phase4);grid;                     %plot the phase response
    title('phase of filter 4');
    sys4 = tf(num4,den4);                         %print the transfer function
    subplot(5,1,3);
    step(sys4);                                   %plot the step response
    subplot(5,1,4); 
    impulse(sys4);                                %plot the impulse response
    y4=filter(num4,den4,y);                       %filtered output of filter 4
    subplot(5,1,5);
    zplane(z4,p4);                                %zeros and poles plot of 4th filter
    title('zplane of filter 4');
    
    %IIR filter 5 (1-3 KHz)
    [z5,p5,k5]=butter(N,[2*1000/fs,2*3000/fs]);   %pole, zero, and gain specs of filter
    [num5,den5]=zp2tf(z5,p5,k5);                  %numerator and denominator of H(s)
    [hd5,wd5]=freqz(num5,den5);                   %determine the frequency response
    mag5=abs(hd5);                                %compute magnitude response of digital filter
    phase5=angle(hd5)*180/pi;                     %compute the phase response
    figure(5);
    subplot(5,1,1);
    plot(wd5/pi,mag5);grid;                       %plot magnitude response
    title('Magnitude of filter 5');
    subplot(5,1,2);
    plot(wd5/pi,phase5);grid;                     %plot the phase response
    title('phase of filter 5');
    sys5 = tf(num5,den5);                         %print the transfer function
    subplot(5,1,3);
    step(sys5);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys5);                                %plot the impulse response
    y5=filter(num5,den5,y);                       %filtered output of filter 5
    subplot(5,1,5);
    zplane(z5,p5);                                %zeros and poles plot of 5th filter
    title('zplane of filter 5');
    
    %IIR filter 6 (3-6 KHz)
    [z6,p6,k6]=butter(N,[2*3000/fs,2*6000/fs]);   %pole, zero, and gain specs of filter
    [num6,den6]=zp2tf(z6,p6,k6);                  %numerator and denominator of H(s)
    [hd6,wd6]=freqz(num6,den6);                   %determine the frequency response
    mag6=abs(hd6);                                %compute magnitude response of digital filter
    phase6=angle(hd6)*180/pi;                     %compute the phase response
    figure(6);
    subplot(5,1,1);
    plot(wd6/pi,mag6);grid;                       %plot magnitude response
    title('Magnitude of filter 6');
    subplot(5,1,2);
    plot(wd6/pi,phase6);grid;                     %plot the phase response
    title('phase of filter 6');
    sys6 = tf(num6,den6);                         %print the transfer function
    subplot(5,1,3);
    step(sys6);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys6);                                %plot the impulse response
    y6=filter(num6,den6,y);                       %filtered output of filter 6
    subplot(5,1,5);
    zplane(z6,p6);                                %zeros and poles plot of 6th filter
    title('zplane of filter 6');
    
    %IIR filter 7 (6-12 KHz)
    [z7,p7,k7]=butter(N,[2*6000/fs,2*12000/fs]);  %pole, zero, and gain specs of filter
    [num7,den7]=zp2tf(z7,p7,k7);                  %numerator and denominator of H(s)
    [hd7,wd7]=freqz(num7,den7);                   %determine the frequency response
    mag7=abs(hd7);                                %compute magnitude response of digital filter
    phase7=angle(hd7)*180/pi;                     %compute the phase response
    figure(7);
    subplot(5,1,1);
    plot(wd7/pi,mag7);grid;                       %plot magnitude response
    title('Magnitude of filter 7');
    subplot(5,1,2); 
    plot(wd7/pi,phase7);grid;                     %plot the phase response
    title('phase of filter 7');
    sys7 = tf(num7,den7);                         %print the transfer function
    subplot(5,1,3);
    step(sys7);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys7);                                %plot the impulse response  
    y7=filter(num7,den7,y);                       %filtered output of filter 7
    subplot(5,1,5); 
    zplane(z7,p7);                                %zeros and poles plot of 7th filter
    title('zplane of filter 7');
    
    %IIR filter 8 (12-14 KHz)
    [z8,p8,k8]=butter(N,[2*12000/fs,2*14000/fs]); %pole, zero, and gain specs of filter
    [num8,den8]=zp2tf(z8,p8,k8);                  %numerator and denominator of H(s)
    [hd8,wd8]=freqz(num8,den8);                   %determine the frequency response
    mag8=abs(hd8);                                %compute magnitude response of digital filter
    phase8=angle(hd8)*180/pi;                     %compute the phase response
    figure(8);
    subplot(5,1,1);
    plot(wd8/pi,mag8);grid;                       %plot magnitude response
    title('Magnitude of filter 8');
    subplot(5,1,2);
    plot(wd8/pi,phase8);grid;                     %plot the phase response
    title('phase of filter 8');
    sys8 = tf(num8,den8);                         %print the transfer function
    subplot(5,1,3);
    step(sys8);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys8);                                %plot the impulse response
    y8=filter(num8,den8,y);                       %filtered output of filter 8
    subplot(5,1,5);
    zplane(z8,p8);                                %zeros and poles plot of 8th filter
    title('zplane of filter 8');
    
    %IIR filter 9 (14-16 KHz)
    [z9,p9,k9]=butter(N,[2*14000/fs,2*16000/fs]); %pole, zero, and gain specs of filter
    [num9,den9]=zp2tf(z9,p9,k9);                  %numerator and denominator of H(s)
    [hd9,wd9]=freqz(num9,den9);                   %determine the frequency response
    mag9=abs(hd9);                                %compute magnitude response of digital filter
    phase9=angle(hd9)*180/pi;                     %compute the phase response
    figure(9);
    subplot(5,1,1);
    plot(wd9/pi,mag9);grid;                       %plot magnitude response
    title('Magnitude of filter 9');
    subplot(5,1,2);
    plot(wd9/pi,phase9);grid;                     %plot the phase response
    title('phase of filter 9');
    sys9 = tf(num9,den9);                         %print the transfer function
    subplot(5,1,3);
    step(sys9);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys9);                                %plot the impulse response
    y9=filter(num9,den9,y);                       %filtered output of filter 9
    subplot(5,1,5);
    zplane(z9,p9);                                %zeros and poles plot of 9th filter
    title('zplane of filter 9');

    figure(10);                                   %figure 10 to plot the input and output signal in frequency and time domain
    subplot(2,2,1);                               
    plot(y);                                      %plot input signal in time domain
    title('Input signal in time domain');
    Fvec=linspace(-fs/2,fs/2,length(y));
    Yf=fftshift(fft(y));
    subplot(2,2,2);
    plot(Fvec,Yf);                                %plot input signal in frequency domain
    title('Input signal in frequency domain');
    
    y1n=y1*10^(g1/20);                            %changing the gain from db to w
    y2n=y2*10^(g2/20);                            %changing the gain from db to w
    y3n=y3*10^(g3/20);                            %changing the gain from db to w
    y4n=y4*10^(g4/20);                            %changing the gain from db to w
    y5n=y5*10^(g5/20);                            %changing the gain from db to w
    y6n=y6*10^(g6/20);                            %changing the gain from db to w
    y7n=y7*10^(g7/20);                            %changing the gain from db to w
    y8n=y8*10^(g8/20);                            %changing the gain from db to w
    y9n=y9*10^(g9/20);                            %changing the gain from db to w
    
    yOutput=y1n+y2n+y3n+y4n+y5n+y6n+y7n+y8n+y9n;  %adding all the the outputs of each signal together after adding gain
    subplot(2,2,3);
    plot(yOutput);                                %plot the composite output signal in time domain   
    title('Output singal in time domain');               
    yf=fftshift(fft(yOutput));                    %transfering output from time to frequency domain
    subplot(2,2,4);
    fvec=linspace(-fs/2,fs/2,length(yf));         
    stem(fvec,yf);                                %plot the composite output signal in frequency domain (magnitude)
    title('Output singal in frequency domain');
    sound(yOutput,fsOut);                         %hearing the output signal
    
    
    case 2
    %Filter FIR with order n=50
    N=50;                                         %filter order 50
    fn=fs/2;                                      %Nyquist frequency                     

    %FIR filter 1 (0-170Hz)
    b1=fir1(N,170/fn);                            %low pass filter coefficients
    [hd1,wd1]=freqz(b1,1);                        %determine the frequency response
    mag1=abs(hd1);                                %compute magnitude response of digital filter
    phase1=angle(hd1)*180/pi;                     %compute the phase response
    figure(1);                                    %figure 1 to plot gain, phase, impulse and step response
    subplot(5,1,1);
    plot(wd1/pi,mag1);grid;                       %plot magnitude response  
    title('Magnitude of filter 1');
    subplot(5,1,2);
    plot(wd1/pi,phase1);grid;                     %plot the phase response
    title('phase of filter 1');
    sys1 = tf(b1,ones(1,length(b1)));             %print the transfer function
    subplot(5,1,3);
    step(sys1);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys1);                                %plot the impulse response
    y1=filter(b1,1,y);                            %filtered output of filter 1
    subplot(5,1,5);
    zplane(b1,1);                                 %zeros and poles plot of 1st filter
    title('zplane of filter 1');
    
    %FIR filter 2 (170Hz-310Hz)
    b2=fir1(N,[170/fn,310/fn]);                   %band pass filter coefficients 
    [hd2,wd2]=freqz(b2,1);                        %determine the frequency response
    mag2=abs(hd2);                                %compute magnitude response of digital filter
    phase2=angle(hd2)*180/pi;                     %compute the phase response
    figure(2);
    subplot(5,1,1);
    plot(wd2/pi,mag2);grid;                       %plot magnitude response
    title('Magnitude of filter 2');
    subplot(5,1,2);
    plot(wd2/pi,phase2);grid;                     %plot the phase response
    title('phase of filter 2');
    sys2 = tf(b2,ones(1,length(b2)));             %print the transfer function
    subplot(5,1,3);
    step(sys2);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys2);                                %plot the impulse response
    y2=filter(b2,1,y);                            %filtered output of filter 2
    subplot(5,1,5);
    zplane(b2,1);                                 %zeros and poles plot of 2nd filter
    title('zplane of filter 2');
    
    %FIR filter 3 (310Hz-600Hz)
    b3=fir1(N,[310/fn,600/fn]);                   %band pass filter coefficients 
    [hd3,wd3]=freqz(b3,1);                        %determine the frequency response
    mag3=abs(hd3);                                %compute magnitude response of digital filter
    phase3=angle(hd3)*180/pi;                     %compute the phase response
    figure(3);
    subplot(5,1,1);
    plot(wd3/pi,mag3);grid;                       %plot magnitude response
    title('Magnitude of filter 3');
    subplot(5,1,2);
    plot(wd3/pi,phase3);grid;                     %plot the phase response
    title('phase of filter 3');
    sys3 = tf(b3,ones(1,length(b3)));             %print the transfer function
    subplot(5,1,3);
    step(sys3);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys3);                                %plot the impulse response
    y3=filter(b3,1,y);                            %filtered output of filter 3
    subplot(5,1,5);
    zplane(b3,1);                                 %zeros and poles plot of 3rd filter
    title('zplane of filter 3');
    
    %FIR filter 4 (600Hz-1000Hz)
    b4=fir1(N,[600/fn,1000/fn]);                  %band pass filter coefficients   
    [hd4,wd4]=freqz(b4,1);                        %determine the frequency response
    mag4=abs(hd4);                                %compute magnitude response of digital filter
    phase4=angle(hd4)*180/pi;                     %compute the phase response
    figure(4)
    subplot(5,1,1);
    plot(wd4/pi,mag4);grid;                       %plot magnitude response
    title('Magnitude of filter 4');
    subplot(5,1,2);
    plot(wd4/pi,phase4);grid;                     %plot the phase response
    title('phase of filter 4');
    sys4 = tf(b4,ones(1,length(b4)));             %print the transfer function
    subplot(5,1,3);
    step(sys4);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys4);                                %plot the impulse response
    y4=filter(b4,1,y);                            %filtered output of filter 4
    subplot(5,1,5);
    zplane(b4,1);                                 %zeros and poles plot of 4th filter
    title('zplane of filter 4');
    
    %FIR filter 5 (1-3 KHz)
    b5=fir1(N,[1000/fn,3000/fn]);                 %band pass filter coefficients  
    [hd5,wd5]=freqz(b5,1);                        %determine the frequency response
    mag5=abs(hd5);                                %compute magnitude response of digital filter
    phase5=angle(hd5)*180/pi;                     %compute the phase response
    figure(5);
    subplot(5,1,1);
    plot(wd5/pi,mag5);grid;                       %plot magnitude response
    title('Magnitude of filter 5');
    subplot(5,1,2);
    plot(wd5/pi,phase5);grid;                     %plot the phase response
    title('phase of filter 5');
    sys5 = tf(b5,ones(1,length(b5)));             %print the transfer function
    subplot(5,1,3);
    step(sys5);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys5);                                %plot the impulse response
    y5=filter(b5,1,y);                            %filtered output of filter 5
    subplot(5,1,5);
    zplane(b5,1);                                 %zeros and poles plot of 5th filter
    title('zplane of filter 5');
    
    %FIR filter 6 (3-6 KHz)
    b6=fir1(N,[3000/fn,6000/fn]);                 %band pass filter coefficients 
    [hd6,wd6]=freqz(b6,1);                        %determine the frequency response
    mag6=abs(hd6);                                %compute magnitude response of digital filter
    phase6=angle(hd6)*180/pi;                     %compute the phase response
    figure(6);
    subplot(5,1,1);
    plot(wd6/pi,mag6);grid;                       %plot magnitude response
    title('Magnitude of filter 6');
    subplot(5,1,2);
    plot(wd6/pi,phase6);grid;                     %plot the phase response
    title('phase of filter 6');
    sys6 = tf(b6,ones(1,length(b6)));             %print the transfer function
    subplot(5,1,3);
    step(sys6);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys6);                                %plot the impulse response
    y6=filter(b6,1,y);                            %filtered output of filter 6
    subplot(5,1,5);
    zplane(b6,1);                                 %zeros and poles plot of 6th filter
    title('zplane of filter 6');
    
    %FIR filter 7 (6-12 KHz)
    b7=fir1(N,[6000/fn,12000/fn]);                %band pass filter coefficients  
    [hd7,wd7]=freqz(b7,1);                        %determine the frequency response
    mag7=abs(hd7);                                %compute magnitude response of digital filter
    phase7=angle(hd7)*180/pi;                     %compute the phase response
    figure(7);
    subplot(5,1,1);
    plot(wd7/pi,mag7);grid;                       %plot magnitude response
    title('Magnitude of filter 7');
    subplot(5,1,2);
    plot(wd7/pi,phase7);grid;                     %plot the phase response
    title('phase of filter 7');
    sys7 = tf(b7,ones(1,length(b7)));             %print the transfer function
    subplot(5,1,3);
    step(sys7);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys7);                                %plot the impulse response
    y7=filter(b7,1,y);                            %filtered output of filter 7
    subplot(5,1,5);
    zplane(b7,1);                                 %zeros and poles plot of 7th filter
    title('zplane of filter 7');
    
    %FIR filter 8 (12-14 KHz)
    b8=fir1(N,[12000/fn,14000/fn]);               %band pass filter coefficients   
    [hd8,wd8]=freqz(b8,1);                        %determine the frequency response
    mag8=abs(hd8);                                %compute magnitude response of digital filter
    phase8=angle(hd8)*180/pi;                     %compute the phase response
    figure(8);
    subplot(5,1,1);
    plot(wd8/pi,mag8);grid;                       %plot magnitude response
    title('Magnitude of filter 8');
    subplot(5,1,2);
    plot(wd8/pi,phase8);grid;                     %plot the phase response
    title('phase of filter 8');
    sys8 = tf(b8,ones(1,length(b8)));             %print the transfer function
    subplot(5,1,3);
    step(sys8);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys8);                                %plot the impulse response
    y8=filter(b8,1,y);                            %filtered output of filter 8
    subplot(5,1,5);
    zplane(b8,1);                                 %zeros and poles plot of 8th filter
    title('zplane of filter 8');
    
    %FIR filter 9 (14-16 KHz)
    b9=fir1(N,[14000/fn,16000/fn]);               %band pass filter coefficients   
    [hd9,wd9]=freqz(b9,1);                        %determine the frequency response
    mag9=abs(hd9);                                %compute magnitude response of digital filter
    phase9=angle(hd9)*180/pi;                     %compute the phase response
    figure(9);
    subplot(5,1,1);
    plot(wd9/pi,mag9);grid;                       %plot magnitude response
    title('Magnitude of filter 9');
    subplot(5,1,2);
    plot(wd9/pi,phase9);grid;                     %plot the phase response
    title('phase of filter 9');
    sys9 = tf(b9,ones(1,length(b9)));             %print the transfer function
    subplot(5,1,3);
    step(sys9);                                   %plot the step response
    subplot(5,1,4);
    impulse(sys9);                                %plot the impulse response
    y9=filter(b9,1,y);                            %filtered output of filter 9
    subplot(5,1,5);
    zplane(b9,1);                                 %zeros and poles plot of 9th filter
    title('zplane of filter 9');

    figure(10);                                   %figure 10 to plot the input and output signal in frequency and time domain
    subplot(2,2,1);                               
    plot(y);                                      %plot input signal in time domain
    title('Input signal in time domain'); 
    Yf=fftshift(fft(y));                          %converte input from time to frequency domain
    Fvec=linspace(-fs/2,fs/2,length(Yf));
    subplot(2,2,2);
    stem(Fvec,Yf);                                %plot the input signal in frequency domain (magnitude)
    title('Input signal in frequency domain');
    
    y1n=y1*10^(g1/20);                            %changing the gain from db to w
    y2n=y2*10^(g2/20);                            %changing the gain from db to w
    y3n=y3*10^(g3/20);                            %changing the gain from db to w
    y4n=y4*10^(g4/20);                            %changing the gain from db to w
    y5n=y5*10^(g5/20);                            %changing the gain from db to w
    y6n=y6*10^(g6/20);                            %changing the gain from db to w
    y7n=y7*10^(g7/20);                            %changing the gain from db to w
    y8n=y8*10^(g8/20);                            %changing the gain from db to w
    y9n=y9*10^(g9/20);                            %changing the gain from db to w
    
    yOutput=y1n+y2n+y3n+y4n+y5n+y6n+y7n+y8n+y9n;  %adding all the the outputs of each filter together after adding gain
    subplot(2,2,3);
    plot(yOutput);                                %plot the composite output signal in time domain
    title('Output singal in time domain');
    yf=fftshift(fft(yOutput));                    %transfering output from time to frequency domain
    subplot(2,2,4);
    fvec=linspace(-fs/2,fs/2,length(yf));
    stem(fvefile_example_WAV_1MG.wavc,yf);                                %plot the composite output signal in frequency domain (magnitude)
    title('Output singal in frequency domain');
    sound(yOutput,fsOut);                         %hearing the output signal
    
     otherwise
        disp('Invalid answer')
end

 