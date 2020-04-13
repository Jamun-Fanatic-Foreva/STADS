% Main Function for Sensor Modelling Block
%   Detailed explanation goes here

% Clear all Workspace Variables
% clear all;

% Add everything to path
load('level.mat', 'level');
if (level == 1)
    addpath(genpath('./Inputs/'));
    addpath(genpath('./Preprocessing/'));
    addpath(genpath('./Processing/'));
elseif (level == 0)
    addpath(genpath('./Sensor_Modelling/Inputs/'));
    addpath(genpath('./Sensor_Modelling/Preprocessing/'));
    addpath(genpath('./Sensor_Modelling/Processing/'));
else
    error('Error: level.mat file missing or incorrect path');
end
    
% Run the edit_input_data.m file.
se_edit_input_data;

% Load se_pp from se_variables.mat
load('se_variables.mat', 'se_pp', 'se_debug_run');

% Preprocessing of the HYG Database, if se_pp != 0
if (se_pp == 1)
    se_preprocessing; 
elseif (se_pp == 0)
    disp('Preprocessing: Skipped');
end

% Load the csv file into mat file
se_load_csv;

%'SE Main: Success';


