z=[1,1,-1,-1];
p=[0.3575+0.5889i,0.3575-0.5889i,0.7686+0.3338i,0.7686-0.3338i];
k=0.0976;

sos=zp2sos(z,p,k);

b1=sos(1,1:3);
b2=sos(2,1:3);
a1=sos(1,4:6);
a2=sos(2,4:6);

b=conv(b1,b2);
a=conv(a1,a2);
[r0,p0,k0]=residuez(b,a);

% 1. (15%) Find the inverse z-transform of (2). Please state the ROC.
% r0, p0, k0

% 2. (20%) Find and plot the locations of poles and zeros.
zplane(b,a);

% 3. (15%) Evaluate and plot the magnitude and phase response.
[f0,w0] = freqz(b,a);

figure;
plot(w0/pi, 20*log(abs(f0)));
figure;
plot(w0/pi, 360*angle(f0)/(2*pi));

% 4. (15%) Find a representation of this transfer function 
% as a cascade of two second-order sections with real coefficients.

[f1,w1] = freqz(b1,a1);
[f2,w2] = freqz(b2,a2);

% 5. (20%) Evaluate and plot the magnitude response of each section in 4.

figure;
plot(w1/pi,20*log(abs(f1)));
figure;
plot(w2/pi,20*log(abs(f2)));

% 6. (15%) Determine the impulse response of the system 
% by obtaining the output for an input x[n] = £_[n] 
% and compare it with the result of 1.

h(1:100) = 0;
h(1) = k;
for i=0:99,
    for j=1:4,
        h(i+1) = h(i+1) + r0(j) * power(p0(j),i);
    end
end

d(1:100) = 0;
d(1) = 1;
hx=filter(b,a,d);

figure;
plot(abs(h));
figure;
plot(abs(hx));