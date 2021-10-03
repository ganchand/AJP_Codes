function [E1, E2] = compute_signature_expressions(W1, b1, W2, b2, X)
%--------------------------------------------------------------------------
%% Input
    %   W1: weight (of ROI features) representing neuroanatomical signature 1
    %   b1: bias term representing neuroanatomical signature 1
    %   W2: weight (of ROI features) representing neuroanatomical signature 2
    %   b2: bias term representing neuroanatomical signature 2
    %   X: harmonized ROI volumes of the test data (dimension: ROIs*subjects)

%% Output 
%   E1: Expression of neuroanatomical signature 1
%   E2: Expression of neuroanatomical signature 2
%--------------------------------------------------------------------------

E1 = W1' * X + b1;
E2 = W2' * X + b2;

end
