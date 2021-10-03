function [X] = harmonization_steps(xk, dx, covar)
%--------------------------------------------------------------------------
%% Input
%   xk: raw ROI volumes or voxel-wise volumetric tissue maps
%   dx: diagnosis labels (-1 controls and +1 patients)
%   covar: covariates (age, sex, site)
%   
%% Output 
%   X: harmonized ROI volumes or voxel-wise volumetric tissue maps
%--------------------------------------------------------------------------

%% selecting normal controls to compute regression coefficients (b_c)
xk_nc = xk(dx==-1,:);
covar_nc = covar(dx==-1,:);
b = [covar_nc ones(size(covar_nc,1),1)];
b_c = xk_nc' * b * inv(b' * b);
b_c = b_c(:,1:end-1);

%% Applying regression coefficients (b_c) to obtain the harmonized ROI volumes or voxel-wise volumetric tissue maps
X = (xk' - b_c * covar')';

end


