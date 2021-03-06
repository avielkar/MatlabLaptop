function [M] = trapezoidTrajectory_KK(appHandle)

global debug

if debug
    disp('Entering triangle Trajectory');
end

data = getappdata(appHandle, 'protinfo');
crossvals = getappdata(appHandle, 'CrossVals');
crossvalsGL = getappdata(appHandle, 'CrossValsGL');
activeStair = data.activeStair;
activeRule = data.activeRule;
trial = getappdata(appHandle, 'trialInfo');
cldata = getappdata(appHandle, 'ControlLoopData'); 

cntr = trial(activeStair,activeRule).list(trial(activeStair,activeRule).cntr);

within = data.condvect.withinStair; 
across = data.condvect.acrossStair;
varying = data.condvect.varying;

if ~isempty(varying)
    if cldata.staircase
        cntrVarying = cldata.varyingCurrInd;
    else
        cntrVarying = cntr;
    end
end


freq = 60;



% Pull and assign required variables for a Translation protocol
i = strmatch('ORIGIN',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Origin',{char(varying.name)},'exact');
    ori(1,:) = [crossvals(cntrVarying,i1) crossvals(cntrVarying,i1) crossvals(cntrVarying,i1)];
    ori(2,:) = [crossvalsGL(cntrVarying,i1) crossvalsGL(cntrVarying,i1) crossvalsGL(cntrVarying,i1)];
elseif data.configinfo(i).status == 3  
    tempVect = across.parameters';
    ori(1,:) = tempVect(activeStair,:);
    ori(2,:) = tempVect(activeStair,:);
elseif data.configinfo(i).status == 4  
    tempVect = within.parameters';
    ori(1,:) = tempVect(cntr,:);
    ori(2,:) = tempVect(cntr,:);
else
    ori(1,:) = data.configinfo(i).parameters;
    ori(2,:) = data.configinfo(i).parameters;
end


% % i = strmatch('DISC_PLANE_ELEVATION',{char(data.configinfo.name)},'exact');
% % if data.configinfo(i).status == 2
% %     i1 = strmatch('Reference Plane, Elevation',{char(varying.name)},'exact');
% %     elP(1,1) = crossvals(cntrVarying,i1);
% %     elP(2,1) = crossvalsGL(cntrVarying,i1);
% % elseif data.configinfo(i).status == 3   
% %     elP(1,1) = across.parameters.moog(activeStair);
% %     elP(2,1) = across.parameters.openGL(activeStair);
% % elseif data.configinfo(i).status == 4   
% %     elP(1,1) = within.parameters.moog(cntr);
% %     elP(2,1) = within.parameters.openGL(cntr);
% % else
% %     elP(1,1) = data.configinfo(i).parameters.moog;
% %     elP(2,1) = data.configinfo(i).parameters.openGL;
% % end

elP(1,1) = 0;
elP(2,1) = 0;

% % i = strmatch('DISC_PLANE_AZIMUTH',{char(data.configinfo.name)},'exact');
% % if data.configinfo(i).status == 2
% %     i1 = strmatch('Reference Plane, Azimuth',{char(varying.name)},'exact');
% %     azP(1,1) = crossvals(cntrVarying,i1);
% %     azP(2,1) = crossvalsGL(cntrVarying,i1);
% % elseif data.configinfo(i).status == 3   
% %     azP(1,1) = across.parameters.moog(activeStair);
% %     azP(2,1) = across.parameters.openGL(activeStair);
% % elseif data.configinfo(i).status == 4   
% %     azP(1,1) = within.parameters.moog(cntr);
% %     azP(2,1) = within.parameters.openGL(cntr);
% % else
% %     azP(1,1) = data.configinfo(i).parameters.moog;
% %     azP(2,1) = data.configinfo(i).parameters.openGL;
% % end

azP(1,1) = 0;
azP(2,1) = 0;

% % i = strmatch('DISC_PLANE_TILT',{char(data.configinfo.name)},'exact');
% % if data.configinfo(i).status == 2
% %     i1 = strmatch('Reference Plane, Tilt',{char(varying.name)},'exact');
% %     tiltP(1,1) = crossvals(cntrVarying,i1);
% %     tiltP(2,1) = crossvalsGL(cntrVarying,i1);
% % elseif data.configinfo(i).status == 3   
% %     tiltP(1,1) = across.parameters.moog(activeStair);
% %     tiltP(2,1) = across.parameters.openGL(activeStair);
% % elseif data.configinfo(i).status == 4   
% %     tiltP(1,1) = within.parameters.moog(cntr);
% %     tiltP(2,1) = within.parameters.openGL(cntr);
% % else
% %     tiltP(1,1) = data.configinfo(i).parameters.moog;
% %     tiltP(2,1) = data.configinfo(i).parameters.openGL;
% % end

tiltP(1,1) = 0;
tiltP(2,1) = 0;


% % i = strmatch('DISC_AMPLITUDES',{char(data.configinfo.name)},'exact');
% % if data.configinfo(i).status == 2
% %     i1 = strmatch('Heading Direction',{char(varying.name)},'exact');
% %     amps(1,1) = crossvals(cntrVarying,i1);
% %     amps(2,1) = crossvalsGL(cntrVarying,i1);
% % elseif data.configinfo(i).status == 3   
% %     amps(1,1) = across.parameters.moog(activeStair);
% %     amps(2,1) = across.parameters.openGL(activeStair);
% % elseif data.configinfo(i).status == 4   
% %     amps(1,1) = within.parameters.moog(cntr);
% %     amps(2,1) = within.parameters.openGL(cntr);
% % else
% %     amps(1,1) = data.configinfo(i).parameters.moog;
% %     amps(2,1) = data.configinfo(i).parameters.openGL;
% % end

amps(1,1) = 0;
amps(2,1) = 0;

% % i = strmatch('DIST',{char(data.configinfo.name)},'exact');
% % if data.configinfo(i).status == 2
% %     i1 = strmatch('Distance',{char(varying.name)},'exact');
% %     dist(1,1) = crossvals(cntrVarying,i1);
% %     dist(2,1) = crossvalsGL(cntrVarying,i1);
% % elseif data.configinfo(i).status == 3   
% %     dist(1,1) = across.parameters.moog(activeStair);
% %     dist(2,1) = across.parameters.openGL(activeStair);
% % elseif data.configinfo(i).status == 4   
% %     dist(1,1) = within.parameters.moog(cntr);
% %     dist(2,1) = within.parameters.openGL(cntr);
% % else
% %     dist(1,1) = data.configinfo(i).parameters.moog;
% %     dist(2,1) = data.configinfo(i).parameters.openGL;
% % end


moog_roll(1,1) = 0;
moog_roll(2,1) = 0;

moog_pitch(1,1) = 0;
moog_pitch(2,1) = 0;


i = strmatch('VISTB_VEL',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Vestibula Velocity',{char(varying.name)},'exact');
    vestVel = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    vestVel = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    vestVel = within.parameters(cntr);
else
    vestVel = data.configinfo(i).parameters;
end

display('Vestibular velocity:'); vestVel

i = strmatch('VISUAL_VEL',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Visual Velocity',{char(varying.name)},'exact');
    visVel = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    visVel = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    visVel = within.parameters(cntr);
else
    visVel = data.configinfo(i).parameters;
end

i = strmatch('DURATION',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Duration',{char(varying.name)},'exact');
    dur(1,1) = crossvals(cntrVarying,i1);
    dur(2,1) = crossvalsGL(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    dur(1,1) = across.parameters.moog(activeStair);
    dur(2,1) = across.parameters.openGL(activeStair);
elseif data.configinfo(i).status == 4   
    dur(1,1) = within.parameters.moog(cntr);
    dur(2,1) = within.parameters.openGL(cntr);
else
    dur(1,1) = data.configinfo(i).parameters.moog;
    dur(2,1) = data.configinfo(i).parameters.openGL;
end


i = strmatch('RAMP_TIME 1', {char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Ramp Time 1 %',{char(varying.name)},'exact');
    rt1(1,1) = crossvals(cntrVarying,i1);
    rt1(2,1) = crossvalsGL(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    rt1(1,1) = across.parameters.moog(activeStair);
    rt1(2,1) = across.parameters.openGL(activeStair);
elseif data.configinfo(i).status == 4   
    rt1(1,1) = within.parameters.moog(cntr);
    rt1(2,1) = within.parameters.openGL(cntr);
else
    rt1(1,1) = data.configinfo(i).parameters.moog;
    rt1(2,1) = data.configinfo(i).parameters.openGL;
end


i = strmatch('RAMP_TIME 2',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Ramp Time 2 %',{char(varying.name)},'exact');
    rt2(1,1) = crossvals(cntrVarying,i1);
    rt2(2,1) = crossvalsGL(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    rt2(1,1) = across.parameters.moog(activeStair);
    rt2(2,1) = across.parameters.openGL(activeStair);
elseif data.configinfo(i).status == 4   
    rt2(1,1) = within.parameters.moog(cntr);
    rt2(2,1) = within.parameters.openGL(cntr);
else
    rt2(1,1) = data.configinfo(i).parameters.moog;
    rt2(2,1) = data.configinfo(i).parameters.openGL;
end



i = strmatch('VESTIB_DELAY',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Vestibula Delay Time',{char(varying.name)},'exact');
    delt = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    delt = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    delt = within.parameters(cntr);
else
    delt = data.configinfo(i).parameters;
end

i = strmatch('VESTIB_DURATION',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Vestibula Duration',{char(varying.name)},'exact');
    vesDur = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    vesDur = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    vesDur = within.parameters(cntr);
else
    vesDur = data.configinfo(i).parameters;
end



f = 60;
ord(1) = 1;

dM = GenTrapezoidVel(vesDur, vestVel, rt1(1,1), rt2(1,1), freq);
dGL = GenTrapezoidVel(dur(2,1), visVel, rt1(2,1), rt2(2,1), freq);



amp=amps*pi/180;
az=azP*pi/180;
el=elP*pi/180;
tilt=tiltP*pi/180;

xM = -sin(amp(1,ord(1)))*sin(az(1))*cos(tilt(1)) + cos(amp(1,ord(1)))*...
    (cos(az(1))*cos(el(1))+sin(az(1))*sin(tilt(1))*sin(el(1)));
yM = sin(amp(1,ord(1)))*cos(az(1))*cos(tilt(1)) + cos(amp(1,ord(1)))*...
    (sin(az(1))*cos(el(1))-cos(az(1))*sin(tilt(1))*sin(el(1)));
zM = -sin(amp(1,ord(1)))*sin(tilt(1)) - cos(amp(1,ord(1)))*sin(el(1))*cos(tilt(1));

xGL = -sin(amp(2,ord(1)))*sin(az(2))*cos(tilt(2)) + cos(amp(2,ord(1)))*...
    (cos(az(2))*cos(el(2))+sin(az(2))*sin(tilt(2))*sin(el(2)));
yGL = sin(amp(2,ord(1)))*cos(az(2))*cos(tilt(2)) + cos(amp(2,ord(1)))*...
    (sin(az(2))*cos(el(2))-cos(az(2))*sin(tilt(2))*sin(el(2)));
zGL = -sin(amp(2,ord(1)))*sin(tilt(2)) - cos(amp(2,ord(1)))*sin(el(2))*cos(tilt(2));

%     xM1 = xM;
%     yM1 = yM;
%     zM1 = zM;
%     xGL1 = xGL;
%     yGL1 = yGL;
%     zGL1 = zGL;
%    
   
%     lateralM1 = zeros(length(dGL),1).*yM1;
%     lateralM = lateralM1;
%     lateralGL1 = zeros(length(dGL),1).*yGL1;
%     lateralGL = lateralGL1;

    lateralM(length(dGL),1) = 0;
    lateralGL(length(dGL),1) = 0;
         
%     surgeM1 = dM*xM1;
%     surgeM = surgeM1;
%     surgeGL1 = dGL*xGL1;
%     surgeGL = surgeGL1;

      surgeM = dM*xM;
      surgeGL = dGL*xGL;
    
%     heaveM1 = zeros(length(dGL),1).*zM1;
%     heaveM = heaveM1;
%     heaveGL1 = zeros(length(GL),1).*zGL1;
%      heaveGL = heaveGL1;

heaveM(length(dGL),1) = 0;
heaveGL(length(dGL),1) = 0;
  


    M(1).name = 'LATERAL_DATA';
    M(1).data = lateralM + ori(1,1); %%this has to be done b/c origin is in cm but moogdots needs it in meters -- Tunde
    M(2).name = 'SURGE_DATA';
    M(2).data = [zeros(1,delt*freq) surgeM ones(1, (dur(2,1)-delt-vesDur)*freq)*surgeM(end)] + ori(1,2); %%this has to be done b/c origin is in cm but moogdots needs it in meters -- Tunde
    M(3).name = 'HEAVE_DATA';
    M(3).data = heaveM + ori(1,3); %%this has to be done b/c origin is in cm but moogdots needs it in meters -- Tunde
    M(4).name = 'YAW_DATA';
    M(4).data = 90*ones(length(dGL),1);
    M(5).name = 'PITCH_DATA';
    M(5).data = zeros(length(dGL),1);
    M(6).name = 'ROLL_DATA';
    M(6).data = zeros(length(dGL),1);
    M(7).name = 'GL_LATERAL_DATA';
    M(7).data = lateralGL + ori(2,1);
    M(8).name = 'GL_SURGE_DATA';
    M(8).data = surgeGL + ori(2,2);
    M(9).name = 'GL_HEAVE_DATA';
    M(9).data = heaveGL + ori(2,3);
    M(10).name = 'GL_ROT_ELE';
    M(10).data = 90*ones(length(dGL),1);
    M(11).name = 'GL_ROT_AZ';
    M(11).data = zeros(length(dGL),1);
    M(12).name = 'GL_ROT_DATA';
    M(12).data = zeros(length(dGL),1);

%   figure(100);  plot(M(1).data); hold on; plot(M(2).data,'r'); plot(M(3).data,'g'); legend('Lateral','Surge','Heave');
%   plot(M(7).data,'b','LineWidth',3); plot(M(8).data,'r','LineWidth',3); plot(M(9).data,'g','LineWidth',3);
    
  
%==== Special parameters for tunnel =========
M(13).name = 'TUNNEL_ELEVATION';

i = strmatch('TUNNEL_ELEVATION',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Tunnel Elevation',{char(varying.name)},'exact');
    tmpAng = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    tmpAng = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    tmpAng = within.parameters(cntr);
else
    tmpAng = data.configinfo(i).parameters;
end
% M(13).data = -tmpAng; %commented out by Tunde and added removed neg
M(13).data = tmpAng;
% M(13).data = -tmpAng;


i = strmatch('TUNNEL_ELEVATION_REF',{char(data.configinfo.name)},'exact');
if ~isempty(i)
%     M(13).data = M(13).data - data.configinfo(i).parameters;
    M(13).data = M(13).data + data.configinfo(i).parameters;
end


M(14).name = 'TUNNEL_ROLL';
i = strmatch('TUNNEL_ROLL',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Tunnel Roll',{char(varying.name)},'exact');
    tmpAng = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    tmpAng = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    tmpAng = within.parameters(cntr);
else
    tmpAng = data.configinfo(i).parameters;
end

i = strmatch('TUNNEL_DRAW_MODE',{char(data.configinfo.name)},'exact');
if data.configinfo(i).status == 2
    i1 = strmatch('Tunnel Draw Mode',{char(varying.name)},'exact');
    drawmode = crossvals(cntrVarying,i1);
elseif data.configinfo(i).status == 3   
    drawmode = across.parameters(activeStair);
elseif data.configinfo(i).status == 4   
    drawmode = within.parameters(cntr);
else
    drawmode = data.configinfo(i).parameters;
end

if drawmode == 0 %square tunnel
    M(14).data = -tmpAng;
elseif drawmode == 1 %circular tunnel
    M(14).data = -tmpAng;
elseif drawmode == 2 %Airplane
    M(14).data = -tmpAng;
elseif drawmode == 3 %surface
    M(14).data = -tmpAng;
elseif drawmode == 4 %bar
    M(14).data = -tmpAng + 90;
else
    disp('The TUNNEL_DRAW_MODE needs to have a value')
end
% M(14).data = tmpAng;



i = strmatch('TUNNEL_ROLL_REF',{char(data.configinfo.name)},'exact');
if ~isempty(i)
    M(14).data = M(14).data - data.configinfo(i).parameters;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if debug
    disp('Exiting triangle Trajectory');
end

