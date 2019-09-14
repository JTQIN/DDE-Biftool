%% Rose-Hindmarsh
%
% @author Maikel Bosschaert, maikel.bosschaert -at- uhasselt.be
% @Id $Id$
%
%% clean workspace and add DDE-BifTool scripts to search path
%clear;      % clear variables
%close all;	% close figures

ddebiftoolpath='../../';
addpath(strcat(ddebiftoolpath,'ddebiftool'),...
    strcat(ddebiftoolpath,'ddebiftool_extra_psol'),...
    strcat(ddebiftoolpath,'ddebiftool_extra_nmfm'),...
    strcat(ddebiftoolpath,'ddebiftool_utilities'));
format compact
format short g
%% load parameter names and indices
s=load('RH_symdefs.mat','parnames','ind');
parnames=s.parnames;
ind=s.ind;
%% r.h.s
rhsxvec=@(x,y,z,xt,Iapp,S,a,b,c,d,chi,r)[...
    y-a.*x.^3+b.*xt.^2-c.*z+Iapp;...
    c-d.*x.^2-y;...
    r.*(S.*(x-chi)-z)];
fnumxvec=set_funcs('sys_rhs',...
    @(x,p)rhsxvec(x(1,1,:),x(2,1,:),x(3,1,:),x(1,2,:),p(ind.Iapp),p(ind.S),...
    p(ind.a),p(ind.b),p(ind.c),p(ind.d),p(ind.chi),p(ind.r)),...
    'sys_tau',@()ind.tau,'x_vectorized',true);
drhsxvec={@(x,y,z,xt,Iapp,S,a,b,c,d,chi,r,dx,dy,dz,dxt,dIapp,dS,da,db,dc,dd,dchi,dr)[...
    %y-a.*x.^3+b.*xt.^2-c.*z+Iapp;...
    dy-3*a.*x.^2.*dx-da.*x.^3+2*b.*xt.*dxt+db.*xt.^2-c.*dz-dc.*z+dIapp;...
    %c-d.*x.^2-y;...
    dc-2*d.*x.*dx-dd.*x.^2-dy;...
    %r.*(S.*(x-chi)-z)]
    dr.*(S.*(x-chi))+r.*(dS.*(x-chi))+r.*(S.*(dx-dchi))-dz]};
fdnumxvec=set_funcs('sys_rhs',...
    @(x,p)rhsxvec(x(1,1,:),x(2,1,:),x(3,1,:),x(1,2,:),p(ind.Iapp),p(ind.S),...
    p(ind.a),p(ind.b),p(ind.c),p(ind.d),p(ind.chi),p(ind.r)),...
    'sys_tau',@()ind.tau,...
    'sys_dirderi',{@(x,p,dx,dp)drhsxvec(x(1,1,:),x(2,1,:),x(3,1,:),x(1,2,:),...
    p(ind.Iapp),p(ind.S),p(ind.a),p(ind.b),p(ind.c),p(ind.d),p(ind.chi),p(ind.r),...
    dx(1,1,:),dx(2,1,:),dx(3,1,:),dx(1,2,:),dp(ind.Iapp),dp(ind.S),...
    dp(ind.a),dp(ind.b),dp(ind.c),dp(ind.d),dp(ind.chi),dp(ind.r))},...
    'x_vectorized',true);
rhsxpvec=@(x,p)rhsxvec(x(1,1,:),x(2,1,:),x(3,1,:),x(1,2,:),...
    p(1,ind.Iapp,:),p(1,ind.S,:),p(1,ind.a,:),p(1,ind.b,:),p(1,ind.c,:),p(1,ind.d,:),...
    p(1,ind.chi,:),p(1,ind.r,:));
fnumxpvec=set_funcs('sys_rhs',rhsxpvec, 'sys_tau',@()ind.tau,...
    'x_vectorized',true,'p_vectorized',true);
drhsxpvec={@(x,p,dx,dp)drhsxvec(x(1,1,:),x(2,1,:),x(3,1,:),x(1,2,:),...
    p(1,ind.Iapp,:),p(1,ind.S,:),p(1,ind.a,:),p(1,ind.b,:),p(1,ind.c,:),...
    p(1,ind.d,:),p(1,ind.chi,:),p(1,ind.r,:),...
    dx(1,1,:),dx(2,1,:),dx(3,1,:),dx(1,2,:),dp(1,ind.Iapp,:),dp(1,ind.S,:),...
    dp(1,ind.a,:),dp(1,ind.b,:),dp(1,ind.c,:),dp(1,ind.d,:),dp(1,ind.chi,:),dp(1,ind.r,:))};
fdnumxpvec=set_funcs('sys_rhs',rhsxpvec, 'sys_tau',@()ind.tau,...
    'sys_dirderi',drhsxpvec,'x_vectorized',true,'p_vectorized',true);
rhs_simple=@(x,y,z,xt,Iapp,S,a,b,c,d,chi,r)[...
    y-a*x^3+b*xt^2-c*z+Iapp;...
    c-d*x^2-y;...
    r*(S*(x-chi)-z)];
fsimple=set_funcs('sys_rhs',@(x,p)rhs_simple(x(1,1),x(2,1),x(3,1),x(1,2),...
    p(ind.Iapp),p(ind.S),p(ind.a),p(ind.b),p(ind.c),p(ind.d),p(ind.chi),p(ind.r)),...
    'sys_tau',@()ind.tau);
fsymbolic=set_symfuncs(@sym_RH,'sys_tau',@()ind.tau);
fchoice={fsymbolic,fsimple,fnumxvec,fdnumxvec,fnumxpvec,fdnumxpvec};
funcs=fchoice{indfuncs};
%% initialize parameters and solution
a=1;
b=3;
c=1;
d=5;
chi=-1.6;
r=1.4; %-0.001;
tau=1;
xstar=1;
S=-8; %-0.5;
Iapp=0; %#ok<NASGU>
ini_xeq=[xstar; c-d*xstar^2; S*(xstar-chi)];
inipar=cellfun(@(x)evalin('caller',x),parnames);
residual=funcs.sys_rhs([ini_xeq,ini_xeq],inipar);
Iapp=-residual(1);
inipar=cellfun(@(x)evalin('caller',x),parnames);
residual=funcs.sys_rhs([ini_xeq,ini_xeq],inipar);
%% continue in one parameter
brpars={'newheuristics_tests',0,...
    'max_step',[ind.Iapp .1;ind.S 0.01; 0,0.2]};
[stst,suc]=SetupStst(funcs,'x',ini_xeq,'parameter',inipar,...
    'contpar',ind.Iapp,brpars{:},'step',-1e-4);
assert(suc>0)
figure(1);clf;ax1=gca;
stst=br_contn(funcs,stst,100,'plotaxis',ax1);
[stst,~,c1_ind,c1_type]=LocateSpecialPoints(funcs,stst);
%% continue fold
indfold=c1_ind(strcmp(c1_type,'fold'));
[fold,suc]=SetupFold(funcs,stst,indfold,'contpar',[ind.Iapp,ind.S],...
    'dir',ind.S);
assert(suc>0);
figure(2);clf;ax2=gca;
fold=br_contn(funcs,fold,200,'plotaxis',ax2);
%%
[fold,ftestfuncs,fc2_ind,fc2_type]=LocateSpecialPoints(funcs,fold);
%% fold-Hopf point (branch off Hopf)
izeho=fc2_ind(strcmp(fc2_type,'zeho'));
assert(~isempty(izeho));
[~,hbr]=C1branch_from_C2point(funcs,fold.point(izeho(1)),fold.parameter.free,...
    'codim2','zeho','codim1','hopf',brpars{:},'step',1e-4);
assert(length(hbr)==1&&length(hbr.point)>1);
hbr=br_contn(funcs,hbr,50,'plotaxis',ax2);
hbr=br_rvers(hbr);
hbr=br_contn(funcs,hbr,50,'plotaxis',ax2);
%% fold-Hopf point (branch off tr)
[trfuncs,trbr]=C1branch_from_C2point(funcs,fold.point(izeho(1)),fold.parameter.free,...
    'codim2','zeho','codim1','TorusBifurcation',...
    brpars{:},'step',1e-4,...
    'print_residual_info',1);
assert(length(trbr)==1&&length(trbr.point)>1);
%%
trbr=br_contn(trfuncs,trbr,40,'plotaxis',ax2);
assert(length(trbr.point)>10);
rotnumbers=trfuncs.get_comp(trbr,'omega');
assert(all(abs(diff(rotnumbers))>0))
%%
figure(1);clf;ax1=gca;hold(ax1,'on');
lg=Plot2dBranch(fold,'ax',ax1);
lg=Plot2dBranch(hbr,'oldlegend',lg,'ax',ax1,'funcs',funcs);
lg=Plot2dBranch(trbr,'oldlegend',lg,'ax',ax1,'funcs',trfuncs);
legend(ax1,lg{1},lg{2},'location','Southeast');