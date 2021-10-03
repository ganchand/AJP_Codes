function [ID_S1, ID_S2, ID_S1S2, ID_None] = assign_subgroups(E1, E2, ID)
%--------------------------------------------------------------------------
%% Input
%   E1: Expression of neuroanatomical signature 1
%   E2: Expression of neuroanatomical signature 2
%   ID: Identity numbers of subjects

%% Output 
%   ID_S1: Identity numbers of subjects with signature 1 only
%   ID_S2: Identity numbers of subjects with signature 2 only
%   ID_None: Identity numbers of subjects with none of signatures
%   ID_S1S2: Identity numbers of subjects with both signatures
%--------------------------------------------------------------------------

%% S1: (E1+, E2-)
ss =[];
for ii = 1:length(E1),
    if E1(ii) > 0 & E2(ii) < 0  
        s = 1;
    else
        s = 0;
    end
    ss = [ss; s]; clear s
end
idx_S1 = find(ss==1); clear ss

%% S2: (E1-, E2+)
ss =[];
for ii = 1:length(E1),
    if E1(ii) < 0 & E2(ii) > 0  
        s = 1;
    else
        s = 0;
    end
    ss = [ss; s]; clear s
end
idx_S2 = find(ss==1); clear ss

%% S1+S2: (E1+, E2+)
ss =[];
for ii = 1:length(E1),
    if E1(ii) > 0 & E2(ii) > 0 
        s = 1;
    else
        s = 0;
    end
    ss = [ss; s]; clear s
end
idx_S1S2 = find(ss==1); clear ss

%% None: (E1-, E2-)
ss =[];
for ii = 1:length(E1),
    if E1(ii) < 0 & E2(ii) < 0  
        s = 1;
    else
        s = 0;
    end
    ss = [ss; s]; clear s
end
idx_None = find(ss==1); clear ss

%% assign subgroups based on above index 
ID_S1 = ID(idx_S1);
ID_S2 = ID(idx_S2);
ID_S1S2 = ID(idx_S1S2);
ID_None = ID(idx_None);

end