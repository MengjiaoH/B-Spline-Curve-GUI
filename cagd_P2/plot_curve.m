function plot_curve(hObject, handles)
%Summary of this function goes here
%   Detailed explanation goes here

hold all;

n = size(handles.curvedata,1);
s = handles.curvedata(n);

C = s.curveP;
cc = s.color;
m = size(C,1);

if m == 2
    axes(handles.curve);
    c = plot(C(1,:), C(2,:), 'Color', cc, 'Linewidth', 1.5);
    uistack(c, 'down',500);

    s = setfield(s,'plotcurve',c);
    % save the updated curve data
    handles.curvedata(n) = s;


    % set
    k = s.degree;
    cpoint = s.controlP;
    num = size(cpoint,1);

    % The max possible degree is num - 1
    a = 1:(num - 1);
    set(handles.changedegree, 'String', a);
    set(handles.degree, 'String', k);

else
    % if it is three dimension 
    % just plot
    axes(handles.curve);
    plot3(C(1,:),C(2,:),C(3,:));
end


guidata(hObject, handles);
end

