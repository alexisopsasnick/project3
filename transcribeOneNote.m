function f = transcribeOneNote(YY)
if(all(YY==0))
f = 0;

else
AUTO=real(ifft(abs(fft(YY)).^2)); %COMPUTE AUTOCORRELATION OF EACH COLUMN.
[Q,I]=max(AUTO(55:120,:)); %FIND MAXIMUM (Q) AND ITS LOCATION (I) OF EACH.
f= 44100./(I+53);
end
end
