%% test_homog_hexa.m
% see https://doi.org/10.1016/j.commatsci.2011.07.014
% for detailed explanations
% DRF started 2021 02 02
% call of homogenization for hexagon (honeycomb) lattice
% after calculations :
% MS4 contain compliance tensor in vectorial form [S11, S22, S66, S26, S16, S12]
% ME1 contain mechanical moduli : [K, Ex, Ey, nuyx, nuxy, muxy,etaxxy,
% etayxy, etaxyx, etaxyy]
% MatVo : rigidity matrix in Voigt notation
% rho contain relative density 

%% entry parameters 
L1=sqrt(3) ; L2=sqrt(3) ; %length of truss directors \overrightarrow{Y_{1}} and \overrightarrow{Y_{2}}
Y1=[1 0];% definition of truss directors
Y2=[1/2 sqrt(3)/2];
nbeams= 3;% number of beams
nnodes= 2;% number of nodes
nodes=[0 0; sqrt(3)/2 1/2] ;% matrix size (nnodes x 2) of position x,y of each node

Ob=[1 2 2] ;% matrix size (1 x nbeams) of index of node origin
Eb=[2 1 1] ;% matrix size (1 x nbeams) index of End node
delta1=[0 1 0] ;% matrix size (1 x nbeams) translation of end node following \overrightarrow{Y_{1}}
delta2=[0 0 1] ;% matrix size (1 x nbeams) translation of end node following \overrightarrow{Y_{2}}
Tb=[0.1 0.1 0.1] ;% matrix size (1 x nbeams) of width 
Elast=[200000 200000 200000] ; % matrix size (1 x nbeams)Value of elastic modulus

[ME1,MS4,MATVo,rho]=homogenization(Tb,L1,L2,Y1,Y2,nbeams,nnodes,nodes,Ob,Eb,delta1,delta2, Elast);

% Affichage des variables
variables = {'ME1', ME1; 'MS4', MS4; 'MATVo', MATVo; 'rho', rho};
for i = 1:size(variables, 1)
    fprintf('%s : %s\n', variables{i, 1}, mat2str(variables{i, 2}));
end
