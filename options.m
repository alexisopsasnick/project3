
h = figure;
h.Position=[700 400 600 400];
uicontrol('Style','text','Position', [50, 320, 150 50], 'String', 'Choose instrument:');
H=uicontrol('Style','popup','Position',[50,300,150,50],'String','Guitar|Clarinet|Trumpet|Tone|Reverbed Trumpet|Placeholder ');
uicontrol('Style', 'text', 'Position', [250, 320, 200, 50], 'String', 'Choose a background color');
uicontrol('Style', 'pushbutton', 'Position', [250, 300, 75, 50], 'String', 'yellow', 'Backgroundcolor', [1 1 0], 'Callback', 'color = [1 1 0];');
uicontrol('Style', 'pushbutton', 'Position', [325, 300, 75, 50], 'String', 'magenta', 'Backgroundcolor', [1 0 1], 'Callback', 'color = [1 0 1];','Foregroundcolor', [1 1 1]);
uicontrol('Style', 'pushbutton', 'Position', [400, 300, 75, 50], 'String', 'cyan', 'Backgroundcolor', [0 1 1], 'Callback', 'color = [0 1 1];');
uicontrol('Style', 'pushbutton', 'Position', [250, 250, 75, 50], 'String', 'red', 'Backgroundcolor', [1 0 0], 'Callback', 'color = [1 0 0];','Foregroundcolor', [1 1 1]);
uicontrol('Style', 'pushbutton', 'Position', [325, 250, 75, 50], 'String', 'green', 'Backgroundcolor', [0 1 0], 'Callback', 'color = [0 1 0];');
uicontrol('Style', 'pushbutton', 'Position', [400, 250, 75, 50], 'String', 'blue', 'Backgroundcolor', [0 0 1], 'Callback', 'color = [0 0 1];','Foregroundcolor', [1 1 1]);
uicontrol('Style', 'pushbutton', 'Position', [250, 200, 112.5, 50], 'String', 'white', 'Backgroundcolor', [1 1 1], 'Callback', 'color = [1 1 1];');
uicontrol('Style', 'pushbutton', 'Position', [362.5, 200, 112.5, 50], 'String', 'black', 'Backgroundcolor', [0 0 0], 'Callback', 'color = [0 0 0];', 'Foregroundcolor', [1 1 1]);
value = 'Value';
uicontrol('Style', 'pushbutton', 'Position', [200, 100, 50, 50], 'String', 'done', 'Callback', ' I = get(H,value); close; proj3Synthesizer;');

color = [1 1 1];


