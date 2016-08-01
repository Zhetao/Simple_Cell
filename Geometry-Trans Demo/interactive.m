zeta = .5;                           % Damping Ratio
wn = 2;                              % Natural Frequency
sys =  @(a1) Trans(a1,0.005,0.005,0.003,0.009);
f = figure;
ax = axes('Parent',f,'position',[0.13 0.39  0.77 0.54]);
h = stepplot(ax,sys);
setoptions(h,'XLim',[0,10],'YLim',[0,2]);
b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
              'value',a1, 'min',0, 'max',1);
% bgcolor = f.Color;
% bl1 = uicontrol('Parent',f,'Style','text','Position',[50,54,23,23],...
%                 'String','0','BackgroundColor',bgcolor);
% bl2 = uicontrol('Parent',f,'Style','text','Position',[500,54,23,23],...
%                 'String','1','BackgroundColor',bgcolor);
% bl3 = uicontrol('Parent',f,'Style','text','Position',[240,25,100,23],...
%                 'String','Damping Ratio','BackgroundColor',bgcolor);
b.Callback = @(es,ed) updateSystem(h, Trans(es.value,0.005,0.005,0.003,0.009)); 
