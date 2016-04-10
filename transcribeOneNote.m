function f = transcribeOneNote(YY, I)
if(all(YY==0))
f = 0;

else

%autocorrelation
% AUTO=real(ifft(abs(fft(YY)).^2)); %COMPUTE AUTOCORRELATION OF EACH COLUMN.
% [Q,I]=max(AUTO(55:120,:)); %FIND MAXIMUM (Q) AND ITS LOCATION (I) OF EACH.
% f= 44100./(I+53)

if(I==3) %for trumpet
%harmonic product spectrum
FYY=abs(fft(YY)); %COMPUTE SPECTRUM OF EACH COLUMN OF YY.
%HPS=FYY(1:800,:).*FYY(1:2:1600,:).*FYY(1:3:2400,:).*FYY(1:4:3200,:).*FYY(1:5:4000,:);
FYY2 = FYY(1:2:length(YY)); FYY3 = FYY(1:3:length(YY)); FYY4 = FYY(1:4:length(YY));
L4 = length(FYY4);
FH = FYY(1:L4).*FYY2(1:L4).*FYY3(1:L4).*FYY4(1:L4);
KMIN = round(length(YY)/44100*370);
KMAX = round(length(YY)/44100*850);
[G, K] = max(FH(KMIN:KMAX));
f = (K+KMIN-2)*44100/length(YY);

else
%fudamental frequency identification
FYY = 2*abs(fft(YY))/length(YY);
KMIN = round(length(YY)/44100*370);
KMAX = round(length(YY)/44100*850);
[G, K] = max(FYY(KMIN:KMAX));
f = (K+KMIN-2)*44100/length(YY);

end
end

end
