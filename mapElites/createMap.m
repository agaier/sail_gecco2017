function [map, edges] = createMap(varargin)
%createMap - Defines map struct and feature space cell divisions
%
% Syntax:  [map, edges] = createMap(featureResolution, genomeLength)
%          [map, edges] = createMap(p.mapE)
%
% Inputs:
%    featureResolution - [1XN] - Number of cells in N dimensions
%
% Outputs:
%    map  - struct with [M(1) X M(2)...X M(N)] matrices for fitness, etc
%       edges               - {1XN} cell of partitions for each dimension
%       fitness, drag, etc  - [M(1) X M(2) X M(N)] matrices of scalars
%       genes               - [M(1) X M(2) X M(N)] cell matrices for genome
%                           - alternatively matrices of real values genomes
%
% Example: 
%    map = createMap([10 5], 3); % 10 X 5 map of genomes with 3 parameters
%   
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: defaultParamSet

% Author: Adam Gaier
% Bonn-Rhein-Sieg University of Applied Sciences (HBRS)
% email: adam.gaier@h-brs.de
% Jun 2016; Last revision: 27-Jan-2017

%------------- BEGIN CODE --------------
if nargin == 1
    featureResolution   = varargin{1}.featureRes;
    genomeLength        = varargin{1}.genomeLength ;
else
    featureResolution   = varargin{1};
    genomeLength        = varargin{2} ;
end

for i=1:length(featureResolution)
    edges{i} = linspace(0,1,featureResolution(i)+1); %#ok<AGROW>
end
map.edges = edges;

blankMap     = NaN(featureResolution,'double');
map.fitness  = blankMap;
map.dragMean = blankMap; 
map.dragS2   = blankMap;
map.liftMean = blankMap; 
map.liftS2   = blankMap; 
map.genes    = repmat(blankMap,[1 1 genomeLength]); %#ok<REPMAT>
    
% map.genes    = cell(featureResolution); % If genome is not static vector



%------------- END OF CODE --------------