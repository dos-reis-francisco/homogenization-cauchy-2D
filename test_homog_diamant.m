%% test_homog_diamant.m
% see https://doi.org/10.1016/j.commatsci.2011.07.014
% for detailed explanations
% DRF débuté le 2021 02 02
% test of homogenization for lattice diamant chiral
% after calculations :
% MS4 contain compliance tensor in vectorial form [S11, S22, S66, S26, S16, S12]
% ME1 contain mechanical moduli : [K, Ex, Ey, nuyx, nuxy, muxy,etaxxy,
% etayxy, etaxyx, etaxyy]
% MatVo : rigidity matrix in Voigt notation
% rho contain relative density 

%% entry parameters 
L1=10*sqrt(2) ; L2=10*sqrt(2) ; %length of truss directors \overrightarrow{Y_{1}} and \overrightarrow{Y_{2}}
Y1=[1 0];% definition of truss directors
Y2=[0 1];
nbeams= 6;% number of beams
nnodes= 5;% number of nodes
nodes=[2.5*sqrt(2) 2.5*sqrt(2); 
    5*sqrt(2) 5*sqrt(2);
    0,0;
    0,5*sqrt(2);
    5*sqrt(2) 0] ;% matrix size (nnodes x 2) of position x,y of each node
Ob=[3,1,1,1,5,2] ;% matrix size (1 x nbeams) of index of node origin
Eb=[1,2,4,5,4,3] ;% matrix size (1 x nbeams) index of End node
delta1=[0,0,0,1,0,0] ;% matrix size (1 x nbeams) translation of end node following \overrightarrow{Y_{1}}
delta2=[0,0,0,0,0,1] ;% matrix size (1 x nbeams) translation of end node following \overrightarrow{Y_{2}}
Tb=0.5*ones(1,6) ;% matrix size (1 x nbeams) of width 
Elast=200000*ones(1,6) ; % matrix size (1 x nbeams)Value of elastic modulus
 
[ME1,MS4,MATVo,rho]=homogenization(Tb,L1,L2,Y1,Y2,nbeams,nnodes,nodes,Ob,Eb,delta1,delta2, Elast);

