
% comments can be made with % at the beginning of a line
%{
This is how a block of code can be commented
%}
3*5
m = 3*5
m = m + 1
y = m/2
% commands without a semicolon(;) at the end will be printed to command
% prompt
% commands with a semicolot at the end will not be displayed (it will still
% be executed)
k = 8-2;

% we can use the %% command to break up code into sections. Sections can be
% run by themselves.

%% 

% when active in the command prompt, can use the up arrow to recall previous
% commands executed in the command prompt (doesnt work with commands
% executed from script)

% recall a variable
y


% variables in matlab must start with a letter and contain only letters,
% numbers and underscores _. Variables are also case sensitive.
% bracketing for order of operations

% variables can be saved from workspave to a MAT-file (.mat) using the save
% command. If variables are specified, only those variables will be saved.
% If no variables are specified, then the workspace (all) is saved to the
% file.

my_pi = 3.1415
save datafile

% can use the clear function to remove all variables from the workspace
clear

% can load variables from a .mat file with load command. We can specify
% only certain variables to load. If no variables are selected, matlab will
% load all variables saved in the file
load datafile.mat

%%

% can use the clc command to clear the command window. (only visual, all
% variables are still kept)
clc

% built-in constants like pi are already in matlab
pi

% other built-in functions like abs() to take absolute value and eig() to
% calculate eigenvalues. () are used to pass inputs to a function
abs(-2)
sin(21)

% imaginary numbers are built-in constants in MATLAB
z = sqrt(-9)

% by default only 3 decimal points are shown in the command window. This
% can be changed by commands "format long" and "format short"
format long
pi

format short % this is the default
pi 

% we will now interact with live scripts

