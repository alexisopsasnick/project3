%Synthesizer for Engineering 100- Project 3

fig=figure;
fig.Position= [1000 350 1000 620];
fig.Name='Synthesizer';
fig.NumberTitle='off';
fig.ToolBar='none';
fig.MenuBar='none';
fig.Color=color;

instrument = 'Bass Guitar     ';
switch(I)
case 1
instrument = 'Bass Guitar     ';
case 2
instrument = 'Clarinet        ';
case 3
instrument  = 'Trumpet        ';
case 4
instrument = 'Tone            ';
case 5
instrument = 'Reverbed Trumpet';
case 6
instrument = 'Placeholder     ';
otherwise
instrument = '                ';
end

[Y, FS] = audioread('proj3.wav');
load('synth.mat')
LY = length(Y);
Trumpet = Y(LY/2+1:3*LY/4);
XXX=reshape(Trumpet,32768,13);
S = [];
for i = 1:13
X=XXX(:,i);%trumpet playing each note
N=50;D=5;

Z=zeros(32768,1);

for J=0:N;
z = []; z=zeros(32768,1);
z(J*D+1:end) = X(1:32768-J*D);
Z = Z + z;
%Z=Z+X(1+I*D:32768-(N-I)*D); end
end
S = [S; Z];
end
Y = [Y; S];
Y=Y';
Y=[Y O];
X=[];

uicontrol('Style', 'Text', 'Position', [250 550 500 50], 'String', instrument, 'BackgroundColor', color, 'ForegroundColor', [1 1 1], 'FontWeight', 'bold', 'FontSize', 40);
uicontrol('Style','Pushbutton','Position',[050 250 100 50],'String','G','Callback', 'Z=Y((I-1)*13*32768+1:(I-1)*13*32768+32768); X=[X Z];   X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[150 250 100 50],'String','A','Callback', 'Z=Y((I-1)*13*32768+2*32768+1:(I-1)*13*32768+32768*3); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[250 250 100 50],'String','B','Callback', 'Z=Y((I-1)*13*32768+4*32768+1:(I-1)*13*32768+32768*5); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[350 250 100 50],'String','C','Callback', 'Z=Y((I-1)*13*32768+5*32768+1:(I-1)*13*32768+32768*6); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[450 250 100 50],'String','D','Callback', 'Z=Y((I-1)*13*32768+7*32768+1:(I-1)*13*32768+32768*8); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[550 250 100 50],'String','E','Callback', 'Z=Y((I-1)*13*32768+9*32768+1:(I-1)*13*32768+32768*10); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[650 250 100 50],'String','F','Callback', 'Z=Y((I-1)*13*32768+10*32768+1:(I-1)*13*32768+32768*11); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[750 250 100 50],'String','G','Callback', 'Z=Y((I-1)*13*32768+12*32768+1:(I-1)*13*32768+32768*13); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

uicontrol('Style','Pushbutton','Position',[900 250 100 50],'String','Whole rest','Callback', 'Z=zeros(1,32768); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[900 300 100 50],'String','Half rest','Callback', 'Z=zeros(1,16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[900 350 100 50],'String','Quarter rest','Callback', 'Z=zeros(1,8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');


uicontrol('Style','Pushbutton','Position',[050 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+1:(I-1)*13*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[150 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+2*32768+1:(I-1)*13*32768+2*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[250 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+4*32768+1:(I-1)*13*32768+4*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[350 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+5*32768+1:(I-1)*13*32768+5*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[450 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+7*32768+1:(I-1)*13*32768+7*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[550 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+9*32768+1:(I-1)*13*32768+9*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[650 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+10*32768+1:(I-1)*13*32768+10*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[750 300 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+12*32768+1:(I-1)*13*32768+12*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

uicontrol('Style','Pushbutton','Position',[050 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+1:(I-1)*13*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[150 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+2*32768+1:(I-1)*13*32768+2*32768+8192); X = [X Z]; X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[250 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+4*32768+1:(I-1)*13*32768+4*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[350 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+5*32768+1:(I-1)*13*32768+5*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[450 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+7*32768+1:(I-1)*13*32768+7*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[550 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+9*32768+1:(I-1)*13*32768+9*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[650 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+10*32768+1:(I-1)*13*32768+10*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[750 350 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+12*32768+1:(I-1)*13*32768+12*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

uicontrol('Style','Pushbutton','Position',[100 400 100 50],'String','G#/Ab','Callback', 'Z=Y((I-1)*13*32768+32768+1:(I-1)*13*32768+32768*2); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[200 400 100 50],'String','A#/Bb','Callback', 'Z=Y((I-1)*13*32768+3*32768+1:(I-1)*13*32768+32768*4); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[400 400 100 50],'String','C#/Db','Callback', 'Z=Y((I-1)*13*32768+6*32768+1:(I-1)*13*32768+32768*7); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[500 400 100 50],'String','D#/Eb','Callback', 'Z=Y((I-1)*13*32768+8*32768+1:(I-1)*13*32768+32768*9); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[700 400 100 50],'String','F#/Gb','Callback', 'Z=Y((I-1)*13*32768+11*32768+1:(I-1)*13*32768+32768*12); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

uicontrol('Style','Pushbutton','Position',[100 450 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+32768+1:(I-1)*13*32768+32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[200 450 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+3*32768+1:(I-1)*13*32768+3*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[400 450 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+6*32768+1:(I-1)*13*32768+6*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[500 450 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+8*32768+1:(I-1)*13*32768+8*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[700 450 100 50],'String','HALF','Callback', 'Z=Y((I-1)*13*32768+11*32768+1:(I-1)*13*32768+11*32768+16384); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

uicontrol('Style','Pushbutton','Position',[100 500 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+32768+1:(I-1)*13*32768+ 32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[200 500 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+3*32768+1:(I-1)*13*32768+3*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[400 500 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+6*32768+1:(I-1)*13*32768+6*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[500 500 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+8*32768+1:(I-1)*13*32768+8*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');
uicontrol('Style','Pushbutton','Position',[700 500 100 50],'String','QUARTER','Callback', 'Z=Y((I-1)*13*32768+11*32768+1:(I-1)*13*32768+11*32768+8192); X=[X Z];  X(end-99:end)=zeros(1,100); sound(Z,44100);');

filename = 'music.wav';
uicontrol('Style','Pushbutton','Position',[050 150 800 100],'String','END','Callback', 'sound(X, 44100); save synthesizer.mat X; audiowrite(filename, X, FS); close;');
uicontrol('Style','Pushbutton','Position',[050 050 400 100],'String','CLEAR','Callback', 'X=[]');
uicontrol('Style','Pushbutton','Position',[450 050 400 100],'String','BACKSPACE','Callback', 'X(end-length(Z)+1:end)=[];')
