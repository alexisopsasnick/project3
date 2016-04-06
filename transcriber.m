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
if(XY(i+q) == 0 || all(XY(i:i+q+100-1) == 0))
X = XY(i:i+q+100-1);
if(all(X == 0))
note = [note;'qrest  '];
else
note = [note; 'quarter'];
end
j=q;
freqs = [freqs; transcribeOneNote(X)];

elseif(XY(i+h) == 0)

X = XY(i:i+h+100-1);
note = [note; 'half   '];

j=h;
freqs = [freqs; transcribeOneNote(X);0];

elseif(XY(i+w) ==0)

X = XY(i:i+w+100-1);

note = [note; 'whole  '];

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

subplot(111), h; axis([0 (length(Z)+1) 0 4]);
hold on;
ha=gca;
uistack(ha,'top')
ha2=axes('position',[0.005, 0.125, 0.1,0.75]);
[x, map]=imread('whole.jpg');
image(x);
colormap(map);
set(ha2,'handlevisibility','off','visible','off');

whole=imread('whole.jpg');
half=imread('half.jpg');
quarter=imread('quarter.jpg');

stepIndex=1;
noteIndex=1;
stepTemp=stepIndex;
noteslength=size(note);
i=1;
while(noteIndex<=noteslength(1))
if (strcmp(note(noteIndex,1),'w'))
for i=[stepIndex:(stepTemp+3)]
if (isinf(Z(i))==0)
image([(i-0.2) (i+0.2)], [(Z(i)+0.2) (Z(i)-0.2)], whole)
end
end
stepIndex=stepTemp+4;
stepTemp=stepIndex;

elseif (strcmp(note(noteIndex,1),'h'))
for i=[stepIndex:(stepTemp+1)]
if (isinf(Z(i))==0)
image([(i-0.18) (i+0.18)], [(Z(i)+.8) (Z(i)-.2)], half);
end
end
stepIndex=stepTemp+2;
stepTemp=stepIndex;

elseif (strcmp(note(noteIndex,1),'q'))
for i=[stepIndex:(stepTemp)]
if (isinf(Z(i))==0)
image([(i-0.15) (i+0.15)], [(Z(i)+.85) (Z(i)-.15)], quarter);
end
end
stepIndex=stepIndex+1;
stepTemp=stepIndex;
end
noteIndex=noteIndex+1;
end

%set(gca,'YGrid','on','YTick',[0:15], 'GridLineStyle', '-')
set(gca,'GridLineStyle', '-','xtick',[],'YGrid', 'on', 'TickLength',[0 0]);