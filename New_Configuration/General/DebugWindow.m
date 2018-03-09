function DebugWindow

if isempty(findobj('Name','Debug Window'))
    set(0,'Units','centimeters')
    pos = get(0,'ScreenSize');

    debugfig = figure('Units','centimeters',...
        'Position',[pos(3)-6.1 2 6 4],...
        'Color',[0.831 0.816 0.784],...
        'Name','Debug Window',...
        'NumberTitle','off',...
        'MenuBar','none');

    uicontrol(debugfig,'Units','centimeters',...
        'Style','pushbutton',...
        'Position',[1 2.5 1.5 0.5],...
        'String','Left',...
        'Callback',{@leftButton_callback});
    uicontrol(debugfig,'Units','centimeters',...
        'Style','pushbutton',...
        'Position',[3.5 2.5 1.5 0.5],...
        'String','Right',...
        'Callback',{@rightButton_callback});
    uicontrol(debugfig,'Units','centimeters',...
        'Style','pushbutton',...
        'Position',[2.25 1 1.5 0.5],...
        'String','Start',...
        'Callback',{@startButton_callback});
end

function leftButton_callback(hObject, eventdata)
global in 
in = 'd';

function rightButton_callback(hObject, eventdata)
global in 
in = 'f';

function startButton_callback(hObject, eventdata)
global in 
in = 's';