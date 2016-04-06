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
note = [note;'rest   '];
else
note = [note; 'quarter'];
end
j=q;
freqs = [freqs; transcribeOneNote(X)];

elseif(XY(i+h) == 0)

X = XY(i:i+h+100-1);
note = [note; 'half   '];

j=h;
freqs = [freqs; transcribeOneNote(X)]; %;0];

elseif(XY(i+w) ==0)

X = XY(i:i+w+100-1);

note = [note; 'whole  '];

j=w;
freqs = [freqs; transcribeOneNote(X)]; %; 0; 0; 0];

end


i = i +100+j;
end

Z = (12*log2(freqs/440)+6)/4;
h=stem(Z);
h.Color='none';
h.MarkerFaceColor='none';
h.MarkerSize=10;

subplot(111), h, axis([0 (length(Z)+1) 0 4]);
hold on;
ha=gca;
uistack(ha,'top')
ha2=axes('position',[0.005, 0.125, 0.1, 0.8]);
[x, map]=imread('cleff.jpg');
image(x);
colormap(map);
set(ha2,'handlevisibility','off','visible','off');

whole=imread('whole.jpg');
half=imread('half.jpg');
quarter=imread('quarter.jpg');
rest=imread('quarterrest.jpg');

stepIndex=1;
noteIndex=1;
stepTemp=stepIndex;
noteslength=size(note);
disp(Z)
while(noteIndex<=noteslength(1))
    if (strcmp(note(noteIndex,1),'w'))
                image([(noteIndex-0.2) (noteIndex+0.2)], [(Z(noteIndex)+0.2) (Z(noteIndex)-0.2)], whole)
    elseif (strcmp(note(noteIndex,1),'h'))

                image([(noteIndex-0.18) (noteIndex+0.18)], [(Z(noteIndex)+.8) (Z(noteIndex)-.2)], half);

    elseif (strcmp(note(noteIndex,1),'q'))
                image([(noteIndex-0.15) (noteIndex+0.15)], [(Z(noteIndex)+.85) (Z(noteIndex)-.15)], quarter);
    elseif (strcmp(note(noteIndex,1),'r'))
                image([(noteIndex-0.15) (noteIndex+0.15)], [(2.5) (1.5)], rest);
    end
    noteIndex=noteIndex+1;
end

%set(gca,'YGrid','on','YTick',[0:15], 'GridLineStyle', '-')
set(gca,'GridLineStyle', '-','xtick',[],'YGrid', 'on', 'TickLength',[0 0]);
