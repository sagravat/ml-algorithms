
% Needleman-Wunsch algorithm
function [F, pointer] = align(seq1,seq2,ScoringMatrix,gap)
m = length(seq1);
n = length(seq2);
intseq1 = nt2int(seq1);
intseq2 = nt2int(seq2);

% set up storage for dynamic programming matrix
F = zeros(n+1,m+1);
F(2:end,1) = gap * (1:n)';
F(1,2:end) = gap * (1:m);

% and for the back tracing matrix
pointer= repmat(uint8(4),n+1,m+1);
pointer(:,1) = 2;  % up
pointer(1,1) = 1;

pos = [1 2 4];

% initialize buffers to the first column
ptr = pointer(:,2); % ptr(1) is always 4
currentFColumn = F(:,1);

% main loop runs through the matrix looking for maximal scores
for outer = 2:m+1

    % score current column
    scoredMatchColumn = ScoringMatrix(intseq2,intseq1(outer-1));
    % grab the data from the matrices and initialize some values
    lastFColumn    = currentFColumn;
    currentFColumn = F(:,outer);
    best = currentFColumn(1);

    for inner = 2:n+1
        % score the three options
        up       = best + gap;
        left     = lastFColumn(inner) + gap;
        diagonal = lastFColumn(inner-1) + scoredMatchColumn(inner-1);

        [best, index] = max([diagonal, up, left]);
        ptr(inner) = pos(index);
        currentFColumn(inner) = best;

    end 
    % put back updated columns
    F(:,outer)   = currentFColumn;
    % save columns of pointers
    pointer(:,outer)  = ptr;
end 
