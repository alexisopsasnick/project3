function f = transcribeOneNote(YY, I)
if(all(YY==0))
f = 0;

else

%autocorrelation
% AUTO=real(ifft(abs(fft(YY)).^2)); %COMPUTE AUTOCORRELATION OF EACH COLUMN.
% [Q,I]=max(AUTO(55:120,:)) %FIND MAXIMUM (Q) AND ITS LOCATION (I) OF EACH.
% f= 44100./(I+53)
if(I==3)
%harmonic product spectrum
FYY=abs(fft(YY)); %COMPUTE SPECTRUM OF EACH COLUMN OF YY.
HPS=FYY(1:800,:).*FYY(1:2:1600,:).*FYY(1:3:2400,:).*FYY(1:4:3200,:).*FYY(1:5:4000,:);
[Q,I]=max(HPS(290:580,:)); %FIND MAXIMUM IN THE RANGE FROM 290 to 580.
f=(I-1+290)*44100/32768;

else
%fudamental frequency identification
FYY=abs(fft(YY)); %COMPUTE SPECTRUM OF EACH COLUMN OF YY.
[Q,I]=max(FYY(290:580,:)); %FIND MAXIMUM IN THE RANGE FROM 290 to 580.
f=(I-1+290)*44100/32768


end

end
end
