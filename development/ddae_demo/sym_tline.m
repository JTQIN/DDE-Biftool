function varargout=sym_tline(action,varargin)
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
f=str2func(sprintf('sym_tline_%s_%d_%d',action,ind,order));
varargout=cell(nout,1);
[varargout{:}]=f(varargin{4:end});




function [out1,out2] = sym_tline_rhs_1_0(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_0
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_0(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:48

t2 = 1.0./R;
t3 = 1.0./Rc;
out1 = vtau.*(t2+t3)-(t2-t3).*(vtau-y);
if nargout > 1
    out2 = v+vtau-y+Is_Rc_by_V0.*(exp(v-vtau+y)-1.0);
end


function [out1,out2] = sym_tline_rhs_1_1(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_1
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_1(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:49

t2 = 1.0./R;
t3 = 1.0./Rc;
t4 = 1.0./R.^2;
t5 = R_d.*t4;
t6 = 1.0./Rc.^2;
out1 = (vtau-y).*(t5-Rc_d.*t6)+vtau_d.*(t2+t3)-(t2-t3).*(vtau_d-y_d)-vtau.*(t5+Rc_d.*t6);
if nargout > 1
    t7 = v-vtau+y;
    t8 = exp(t7);
    out2 = v_d+vtau_d-y_d+Is_Rc_by_V0_d.*(t8-1.0)+Is_Rc_by_V0.*t8.*(v_d-vtau_d+y_d);
end


function [out1,out2] = sym_tline_rhs_1_2(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_2
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_2(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:49

t2 = 1.0./R.^3;
t3 = R_d.^2;
t4 = t2.*t3.*2.0;
t5 = 1.0./Rc.^3;
t6 = Rc_d.^2;
t7 = t5.*t6.*2.0;
t8 = 1.0./R.^2;
t9 = R_d.*t8;
t10 = 1.0./Rc.^2;
out1 = (vtau_d-y_d).*(t9-Rc_d.*t10).*2.0+vtau.*(t4+t7)-(t4-t7).*(vtau-y)-vtau_d.*(t9+Rc_d.*t10).*2.0;
if nargout > 1
    t11 = v-vtau+y;
    t12 = exp(t11);
    t13 = v_d-vtau_d+y_d;
    out2 = Is_Rc_by_V0_d.*t12.*t13.*2.0+Is_Rc_by_V0.*t12.*t13.^2;
end


function [out1,out2] = sym_tline_rhs_1_3(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_3
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_3(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:49

t2 = R_d.^2;
t3 = Rc_d.^2;
t4 = 1.0./R.^4;
t5 = R_d.*t2.*t4.*6.0;
t6 = 1.0./Rc.^4;
t7 = Rc_d.*t3.*t6.*6.0;
t8 = 1.0./R.^3;
t9 = t2.*t8.*2.0;
t10 = 1.0./Rc.^3;
t11 = t3.*t10.*2.0;
out1 = -vtau.*(t5+t7)+vtau_d.*(t9+t11).*3.0+(t5-t7).*(vtau-y)-(t9-t11).*(vtau_d-y_d).*3.0;
if nargout > 1
    t12 = v_d-vtau_d+y_d;
    t13 = t12.^2;
    t14 = v-vtau+y;
    t15 = exp(t14);
    out2 = Is_Rc_by_V0_d.*t13.*t15.*3.0+Is_Rc_by_V0.*t12.*t13.*t15;
end


function [out1,out2] = sym_tline_rhs_1_4(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_4
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_4(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:49

t2 = R_d.^2;
t3 = Rc_d.^2;
t4 = 1.0./R.^5;
t5 = t2.^2;
t6 = t4.*t5.*2.4e1;
t7 = 1.0./Rc.^5;
t8 = t3.^2;
t9 = t7.*t8.*2.4e1;
t10 = 1.0./R.^4;
t11 = R_d.*t2.*t10.*6.0;
t12 = 1.0./Rc.^4;
t13 = Rc_d.*t3.*t12.*6.0;
out1 = vtau.*(t6+t9)-vtau_d.*(t11+t13).*4.0-(t6-t9).*(vtau-y)+(t11-t13).*(vtau_d-y_d).*4.0;
if nargout > 1
    t14 = v_d-vtau_d+y_d;
    t15 = t14.^2;
    t16 = v-vtau+y;
    t17 = exp(t16);
    out2 = Is_Rc_by_V0.*t15.^2.*t17+Is_Rc_by_V0_d.*t14.*t15.*t17.*4.0;
end


function [out1,out2] = sym_tline_rhs_1_5(y,v,ytau,vtau,Rc,R,Is_Rc_by_V0,tau_by_C,y_d,v_d,ytau_d,vtau_d,Rc_d,R_d,Is_Rc_by_V0_d,tau_by_C_d)
%SYM_TLINE_RHS_1_5
%    [OUT1,OUT2] = SYM_TLINE_RHS_1_5(Y,V,YTAU,VTAU,RC,R,IS_RC_BY_V0,TAU_BY_C,Y_D,V_D,YTAU_D,VTAU_D,RC_D,R_D,IS_RC_BY_V0_D,TAU_BY_C_D)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    21-Aug-2019 00:38:49

t2 = R_d.^2;
t3 = Rc_d.^2;
t4 = t2.^2;
t5 = t3.^2;
t6 = 1.0./R.^6;
t7 = R_d.*t4.*t6.*1.2e2;
t8 = 1.0./Rc.^6;
t9 = Rc_d.*t5.*t8.*1.2e2;
t10 = 1.0./R.^5;
t11 = t4.*t10.*2.4e1;
t12 = 1.0./Rc.^5;
t13 = t5.*t12.*2.4e1;
out1 = -vtau.*(t7+t9)+vtau_d.*(t11+t13).*5.0+(t7-t9).*(vtau-y)-(t11-t13).*(vtau_d-y_d).*5.0;
if nargout > 1
    t14 = v_d-vtau_d+y_d;
    t15 = t14.^2;
    t16 = t15.^2;
    t17 = v-vtau+y;
    t18 = exp(t17);
    out2 = Is_Rc_by_V0_d.*t16.*t18.*5.0+Is_Rc_by_V0.*t14.*t16.*t18;
end

