%% Ch.10 Problem 13: Steady-state vibration of a friction-free spring mass damper system
% * Engineering Analysis Format (EAF)
% 
%the above * create a bullet item
% Emmanuel Rodriguez
% June 12, 2020, @Villa Camino, Oceanside, CA
%
% * For in depth theory see Rao (2004), sec. 3.4 Response of a damped
% system under harmonic force

%%
% *Problem Statement*
%the above statement enclosed in asteriks creates a section heading
%%
% Consider steady-state vibration of a friction-free spring-mass-damper
% system subjected to harmonic applied force.
% 
%
figure;
    imshow('10-13_spring_mass_damper_system.png'); % imshow displays the image
%%
% Determine and plot the temperature distribution T(x,y) in the plate.
% a = 5m , b = 4m
%
%when creating a new section with double percent symbol, make sure to...
%leave a space after the percent
%%
% _*Expected Outputs*_
%
% # 3D plot of the normalized amplitude (z-axis) as a function of the 
% frequency ratio and a function of the damping ratio.
%
%the above _* creates italics
%# creates numbered list
%%
% _*Conversion Factors & Constants*_
%-----------------------------------

%%
% *Knowns / Assumptions (Inputs)*
%%
% _*Knowns*_
r = [0:.01:2]; % frequency ratio, omega/omega_n or frequency/natural frequency
zeta = [0.05:.01:0.5]; % damping ratio, defined as the ratio of the damping
% constant to the critical damping constant, see Rao p.141

%%
% _*Convert Units*_
%

%%
% _*Assumptions*_
%------------------

%%
% *Calculations*
%
% _*Governing Equations*_
%
% * The normalized amplitude of the mass is given by
%
figure;
imshow('10-13_normalized_amplitude.png');

% * also called the amplitude ratio, represents the ratio of the dynamic
% to the static amplitude of motion. See Rao, p.222
%%
%
% _*Calculations*_

% Create an X,Y grid for the domain of the function. 
% Create segments for each dimension, by dividing by 0.25.
%segdiv = .05;
nr = length(r); % returns the number of elements in the vector (nodes)
nzeta = length(zeta); % number of elements in the vector (nodes)
%x = linspace(0,r,nr); % generate linearly spaced vector for x dimension
%y = linspace(0,zeta,nzeta);
[X,Y] = meshgrid(r,zeta); % meshgrid function returns 2D grid coordinates
% (output arguments) based on the coordinates contained in vectors x and y

M = zeros(nzeta, nr);
for i = 1:nzeta % First loop, i, is the index of the grid's row.
    for j = 1:nr % Second loop, j, is the index of the grid's column.
        M(i,j) = 1/(sqrt((1-X(i,j).^2).^2+(2*Y(i,j)*X(i,j)).^2));
    end
end
figure;
surfc(X,Y,M) % surfc creates a surface and contour plot, see Gilat p. 330
c1 = colorbar;
c1.Label.String = 'Amplitude Ratio, M';
%pos = get(c1,'Position'); 
%c1.Label.Position = [pos(1)+1 pos(2)+15];
%c1.Label.Rotation = 0;
title('Steady-State Vibration of Spring-Mass-Damper System', 'fontsize',12);
xlabel('Frequency ratio: r = \omega/\omega_{n}'); ylabel('Damping ratio: \zeta'); zlabel('Amplitude Ratio: M = X/\delta_{st}');

figure;
meshc(X,Y,M) % meshc creates a mesh and contour plot
c2 = colorbar;
c2.Label.String = 'Amplitude Ratio, M';
%pos = get(c2,'Position'); 
%c2.Label.Position = [pos(1)+1 pos(2)+10];
%c2.Label.Rotation = 0;
title('Steady-State Vibration of Spring-Mass-Damper System', 'fontsize',12);
xlabel('Frequency ratio: r = \omega/\omega_{n}'); ylabel('Damping ratio: \zeta'); zlabel('Amplitude Ratio: M = X/\delta_{st}');

figure;
cl = 40; % number of contour levels (for increased resolution)
contour(X,Y,M, cl) % 2-D contour plot
title('Steady-State Vibration of Spring-Mass-Damper System', 'fontsize',12);
xlabel('Frequency ratio: r = \omega/\omega_{n}'); ylabel('Damping ratio: \zeta'); zlabel('Amplitude Ratio: M = X/\delta_{st}');
c3 = colorbar;
%ylabel(cb,'T, \circC','Rotation',90);
c3.Label.String = 'Amplitude Ratio, M';
%pos = get(c3,'Position'); % returns the position of the cb label, with 
% the coordinates of the lower left corner, and the width and height of the
% label. The get function queries graphics object properties.
%c3.Label.Position = [pos(1)+1 pos(2)+10]; % the Label.Position assigns the
% coordinates of the lower left corner of the label plus/minus some offset
% here the 80 is offsetting the label in y, and 1 is offsetting in x.
%c3.Label.Rotation = 0; % Rotate the text
%https://www.mathworks.com/matlabcentral/answers/362971-display-colorbar-label-horizontally-and-specify-its-position?s_tid=mwa_osa_a
%%
% *Discussion and Presentation (Outputs)*
%
str = ['The 3D surface plot shows the amplitude ratio, which is the'...
    ' quantity M, that represents the ratio of the dynamic to the static'...
    ' amplitude of motion. The response of the system due to it being'...
    ' subjected to an external force, can be identified to be one of three'...
    ' types, see Rao. p.222 - 224 for a description.'];
    % '...' known as ellipsis continues the ...
    % current command on the next line.
    % str is a statements creating a string array containing the message
    % 'num2str' is a function that converts numbers to character array
    % ' a single apostrophe is start/termination character
    % \n starts a new line; since the command is appended to the end of...
    % the print out \n places the print after the print out.
    
disp(str) % displays the message in the string array, creating a single...
    % character array.
    % the process of creating a string array is called concatenation

% End
% Publish by entering ...
% 'publish('DEN417_Rodriguez_HW1.m','pdf')' in the command window