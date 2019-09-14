function varargout=sym_RH(action,varargin)
%% Automatically generated with matlabFunction
% 
%#ok<*DEFNU,*INUSD,*INUSL>

switch action
  case 'ntau'
   varargout{1}=1;
   return
  case 'tp_del'
   varargout{1}=0;
   return
  case 'maxorder'
   varargout{1}=5;
   return
  case 'directional_derivative'
   varargout{1}=1;
   return
end
ind=varargin{1};
order=varargin{2};
nout=varargin{3};
f=str2func(sprintf('sym_RH_%s_%d_%d',action,ind,order));
varargout=cell(nout,1);
[varargout{:}]=f(varargin{4:end});




function [out1,out2,out3] = sym_RH_rhs_1_0(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_0
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_0(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:11

t2 = x.^2;
out1 = Iapp+y-z-t2.*x+xtau.^2.*3.0;
if nargout > 1
    out2 = t2.*-5.0-y+1.0;
end
if nargout > 2
    out3 = -r.*(z-S.*(x+8.0./5.0));
end


function [out1,out2,out3] = sym_RH_rhs_1_1(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_1
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_1(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:12

out1 = Iapp_d+y_d-z_d+xtau.*xtau_d.*6.0-x.^2.*x_d.*3.0;
if nargout > 1
    out2 = -y_d-x.*x_d.*1.0e1;
end
if nargout > 2
    t2 = x+8.0./5.0;
    out3 = r.*(-z_d+S_d.*t2+S.*x_d)-r_d.*(z-S.*t2);
end


function [out1,out2,out3] = sym_RH_rhs_1_2(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_2
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_2(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:12

t2 = x_d.^2;
out1 = t2.*x.*-6.0+xtau_d.^2.*6.0;
if nargout > 1
    out2 = t2.*-1.0e1;
end
if nargout > 2
    out3 = r_d.*(-z_d+S.*x_d+S_d.*(x+8.0./5.0)).*2.0+S_d.*r.*x_d.*2.0;
end


function [out1,out2,out3] = sym_RH_rhs_1_3(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_3
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_3(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:12

t2 = x_d.^2;
out1 = t2.*x_d.*-6.0;
if nargout > 1
    out2 = 0.0;
end
if nargout > 2
    out3 = S_d.*r_d.*x_d.*6.0;
end


function [out1,out2,out3] = sym_RH_rhs_1_4(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_4
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_4(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:12

out1 = 0.0;
if nargout > 1
    out2 = 0.0;
end
if nargout > 2
    out3 = 0.0;
end


function [out1,out2,out3] = sym_RH_rhs_1_5(x,y,z,xtau,ytau,ztau,Iapp,S,r,tau,x_d,y_d,z_d,xtau_d,ytau_d,ztau_d,Iapp_d,S_d,r_d,tau_d)
%SYM_RH_RHS_1_5
%    [OUT1,OUT2,OUT3] = SYM_RH_RHS_1_5(X,Y,Z,XTAU,YTAU,ZTAU,IAPP,S,R,TAU,X_D,Y_D,Z_D,XTAU_D,YTAU_D,ZTAU_D,IAPP_D,S_D,R_D,TAU_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    22-Sep-2018 16:47:12

out1 = 0.0;
if nargout > 1
    out2 = 0.0;
end
if nargout > 2
    out3 = 0.0;
end
