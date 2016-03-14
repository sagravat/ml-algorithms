% Sanjay Agravat
%
% Compute a weighted average of aligned sequences + pseudocounts to form a
% pwm
%
% INPUTS:
%   seqs-aligned sequences
%   pseudocount-scalar, weight of pseudocounts to be added to each letter in
%   each position of the pwm
% OUTPUTS:
%   pwm-weighted average of all seqs for all letters and postions in the pwm;
%   columns add to 1.

function pwm = reg_pwm(seqs,pseudocounts,qa)

if iscell(seqs)
    N = length(seqs);
    L = length(seqs{1});
    intSeq = zeros(N,L);
    for i = 1:N
        intSeq(i,:) = nt2int(seqs{i});
    end
else
    [N,L] = size(seqs);
    intSeq = nt2int(seqs);
end

pwm = zeros(4,L);
for i = 1:L
    for j = 1:4
        ii_j = intSeq(:,i) == j;
        pwm(j,i) = sum(ii_j);
    end
    pwm(:,i) = (pwm(:,i) + (pseudocounts*qa))/(sum(pwm(:,i)) + pseudocounts);
end
