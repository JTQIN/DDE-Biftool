function [p,q,sg]=nmfm_nullvector(funcs,point,lambda,varargin)
%% compute left (p) and right (q) nullvector of Delta(lambda) in equilibrium
%
%% Inputs
%
% * funcs: user-provided problem functions
% * point: equlibrium poin (kind 'stst' or local bifurcation)
% * lambda: eigenvalue for which eigenvectors are needed
% * (optional) nullpoint: point from which nullvectors are to be used
% in bordered matrix.
%
%% Outputs
%
% * p (1 x n) left nullvector of Delta(lambda)
% * q (n x 1) right eigenvector of Delta(lambda)
% * sg was bordered matrix needed and singular?
%
% p and q are scaled such that p*Delta'(lambda)*q=1
%
% $Id$
%%
Delta=@(deg)ch_matrix(funcs,point.x,point.parameter,lambda,'deri',deg);
if length(point.x)==1
    p=1;
    q=1;
    sg=false;
else
    default={'nullpoint',[]};
    options=dde_set_options(default,varargin,'pass_on');
    if isempty(options.nullpoint) % use null vectors of point
        nullpoint = point;
    else % use supplied null vectors
        nullpoint = options.nullpoint;
    end
    % Construct null vectors
    if isfield(nullpoint, 'nvec')
        if isfield(nullpoint.nvec,'p')
            pp = nullpoint.nvec.p;
        else
            pp = [];
        end
        if isfield(nullpoint.nvec,'q')
            qq = nullpoint.nvec.q;
        else
            qq = [];
        end
    else
        pp = []; qq = [];
    end
    [p,q,sg]=nmfm_border(Delta(0), pp, qq);
    p = p/norm(p);
    q = q/norm(q);
end
%% if eigenvectors are real avoid introducing complex numbers
ainv=p*Delta(1)*q;
if imag(ainv)==0 && real(ainv)<0
    q=-q;
    ainv=-ainv;
end
%% scale eigenvectors
alpha = 1/ainv;
p = alpha*p;
%q = alpha*q;
end
