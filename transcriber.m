clear;

fig=gcf;
fig.Position= [250 450 650 200];
fig.Color=[1 1 1];
fig.Name='Transcriber';
fig.ToolBar='none';
fig.MenuBar='none';
fig.NumberTitle='off';

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

Z = round(12*log2(freqs/440)+6)/4;
h=stem(Z);
h.Color='none';
h.MarkerFaceColor='none';
h.MarkerSize=10;

subplot(111), h, axis([0 length(note) 0 4])
hold on;
ha=gca;
uistack(ha,'top')
ha2=axes('position',[0.005, 0.125, 0.1,0.75]);
[x, map]=imread('cleff.png');
image(x)
colormap(map)
set(ha2,'handlevisibility','off','visible','off')

a=1;
img=imread('note1.jpg');
disp(Z)
while a<=length(Z)
    if (isinf(Z(a))==0)
        image([(a-0.1) (a+0.1)], [(Z(a)+1) (Z(a))], img)
    end
    a=a+1;
end
set(gca,'YGrid','on','YTick',[0:15], 'GridLineStyle', '-')
