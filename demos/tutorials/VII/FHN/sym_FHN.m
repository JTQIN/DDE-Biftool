function varargout=sym_FHN(action,varargin)
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
f=str2func(sprintf('sym_FHN_%s_%d_%d',action,ind,order));
varargout=cell(nout,1);
[varargout{:}]=f(varargin{4:end});
end



function [out1, out2] = sym_FHN_rhs_1_0(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_0  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = 2*par11.*tanh(xx12) - xx11.^3/3 + xx11.^2.*(par12 + 1283/625) - 1296*pi*xx11/1267 - xx21;
  out2 = 2*xx11/25 - 9*xx21/125;

end


function [out1, out2] = sym_FHN_rhs_1_1(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_1  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = 2*par11.*xx12_d.*(-tanh(xx12).^2 + 1) + 2*par11_d.*tanh(xx12) + par12_d.*xx11.^2 - xx11.^2.*xx11_d + 2*xx11.*xx11_d.*(par12 + 1283/625) - 1296*pi*xx11_d/1267 - xx21_d;
  out2 = 2*xx11_d/25 - 9*xx21_d/125;

end


function [out1, out2] = sym_FHN_rhs_1_2(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_2  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = -4*par11.*xx12_d.^2.*(-tanh(xx12).^2 + 1).*tanh(xx12) + 4*par11_d.*xx12_d.*(-tanh(xx12).^2 + 1) + 4*par12_d.*xx11.*xx11_d - 2*xx11.*xx11_d.^2 + 2*xx11_d.^2.*(par12 + 1283/625);
  out2 = 0;

end


function [out1, out2] = sym_FHN_rhs_1_3(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_3  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = -4*par11.*xx12_d.^3.*(-tanh(xx12).^2 + 1).^2 + 8*par11.*xx12_d.^3.*(-tanh(xx12).^2 + 1).*tanh(xx12).^2 - 12*par11_d.*xx12_d.^2.*(-tanh(xx12).^2 + 1).*tanh(xx12) + 6*par12_d.*xx11_d.^2 - 2*xx11_d.^3;
  out2 = 0;

end


function [out1, out2] = sym_FHN_rhs_1_4(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_4  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = 32*par11.*xx12_d.^4.*(-tanh(xx12).^2 + 1).^2.*tanh(xx12) - 16*par11.*xx12_d.^4.*(-tanh(xx12).^2 + 1).*tanh(xx12).^3 - 16*par11_d.*xx12_d.^3.*(-tanh(xx12).^2 + 1).^2 + 32*par11_d.*xx12_d.^3.*(-tanh(xx12).^2 + 1).*tanh(xx12).^2;
  out2 = 0;

end


function [out1, out2] = sym_FHN_rhs_1_5(xx11, xx21, xx12, xx22, par11, par12, par13, xx11_d, xx21_d, xx12_d, xx22_d, par11_d, par12_d, par13_d)
  %SYM_FHN_RHS_1_5  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = 32*par11.*xx12_d.^5.*(-tanh(xx12).^2 + 1).^3 - 176*par11.*xx12_d.^5.*(-tanh(xx12).^2 + 1).^2.*tanh(xx12).^2 + 32*par11.*xx12_d.^5.*(-tanh(xx12).^2 + 1).*tanh(xx12).^4 + 160*par11_d.*xx12_d.^4.*(-tanh(xx12).^2 + 1).^2.*tanh(xx12) - 80*par11_d.*xx12_d.^4.*(-tanh(xx12).^2 + 1).*tanh(xx12).^3;
  out2 = 0;

end

