clear;
[XY, FS] = audioread('music.wav');
w = 32668;
h = 16284;
q = 8092;
note = [];
i = 1;
freqs = [];
while(i <= length(XY))
    j=0;
    if(XY(i+q) == 0)
        note = [note; 'quarter'];
        X = XY(i:i+q+100-1);
        j=q;
        freqs = [freqs; transcribeOneNote(X)];    
    elseif(XY(i+h) == 0)
        note = [note; 'half   '];
        X = XY(i:i+h+100-1);
        j=h;
        freqs = [freqs; transcribeOneNote(X);0];    

    elseif(XY(i+w) ==0)
        note = [note; 'whole  '];
        X = XY(i:i+w+100-1);
        j=w;
        freqs = [freqs; transcribeOneNote(X); 0; 0; 0];    

    end 
  

i = i +100+j;
end

Z = 12*log2(freqs/440)+6;
stem(Z)
