% ic=[
% 2+ (5/6)*(log2(5/6)) +  (1/6)*(log2(1/6)),...
% 2+ (2/3)*(log2(2/3)) + (1/3)*(log2(1/3)),...
% 2+ (3/6)*(log2(3/6)) + (3/6)*(log2(3/6)),...
% 2+ (1)*(log2(1)),...
% 2+ (1/6)*(log2(1/6)) + (1/3)*(log2(1/3)) +(3/6)*(log2(3/6)),...
% 2+ (1/6)*(log2(1/6)) + (5/6)*(log2(5/6))];


seqs{1} = ['A', 'A', 'C', 'A', 'T', 'G'];
seqs{2} = ['A', 'A', 'G', 'A', 'T', 'G'];
seqs{3} = ['A', 'T', 'G', 'A', 'G', 'G'];
seqs{4} = ['T', 'A', 'C', 'A', 'T', 'G'];
seqs{5} = ['A', 'A', 'G', 'A', 'G', 'A'];
seqs{6} = ['A', 'T', 'C', 'A', 'A', 'G'];

pwm = [5/6, 4/6, 0, 1, 1/6, 1/6; 0, 0, 3/6, 0, 0, 0; 0, 0, 3/6, 0, 1/6, 5/6; 1/6, 2/6, 0, 0, 3/6, 0];

pwm_reg = reg_pwm(seqs,.5,.25);
odds_score = pwm_reg/.25;
pwm_log = log2(odds_score);

PSSM=pwm_log;
% score1 =PSSM(1,1) + PSSM (4,2) + PSSM (3,3) + PSSM (1,4) + PSSM (4,5) + PSSM(3,6)
% score2=PSSM(1,1) + PSSM (1,2) + PSSM (3,3) + PSSM (2,4) + PSSM (4,5) + PSSM(3,6)
% odds_score1 =odds_score(1,1) + odds_score(4,2) + odds_score(3,3) + odds_score(1,4) + odds_score(4,5) + odds_score(3,6)
% odds_score2=odds_score(1,1) + odds_score (1,2) + odds_score(3,3) + odds_score(2,4) + odds_score(4,5) + odds_score(3,6)
% 
sm = [5 -4 -4 -4;
-4 5 -4 -4;
-4 -4 6 -4;
-4 -4 -4 5];

 s2{1} = ['TTGAGGTTGTCCAGGTGAGCCAGGCCATCACTAAAGGCACCGAGCACTTTCTTGCCATGAGCCTTCACCT'];
 s2{2}= ['TTGAGGTTGTCCAGGTGAGTCAGGCCGTCACTAAAGGCACCTAGCACCTTCTTGCCATGAGCCTTCACCT'];
 s2{3} = ['TTGTGGTTGTCGAGGTGTTTCAGGCCATTACTAAAGGAATCAATCACCTTCTTGCCATGAGCCTTCACTT'];
 s2{4}=['TTGAGGTCGTCGAGATGCTTCAGGCCCTCACCAAAGGAGGCTAGCACCTTTTGGCCATGTTTCTTCACGT'];
 s2{5} = ['TTGAGGTTATCCAGATGCTGCAGACCCTCACTGAAGGAGTCTAGCACTTTCTTGCCATGGGCCTTCACCT'];
% 
 m_align = multialign(s2, 'GapOpen', 10, 'ExtendGap',0.5, 'ScoringMatrix', sm);
 D=seqpdist(m_align, 'GapOpen', 10, 'ExtendGap',0.5, 'ScoringMatrix', sm);

% D = [0.57, 0, 0 , 0; .171, .157, 0,0; .271, .229, .243,0;.186, .186, .229, .214];
 s3 = {'human', 'marmoset', 'squirrel', 'dolphin', 'megabat'};
 tree = seqneighjoin(D, 'equivar', s3);
 view(tree) 
 dist = pdist(tree,'nodes','leaves','squareform',true);
% 
% 
% 
% 
 d = [0.57, 0, 0 , 0; .171, .157, 0,0; .271, .229, .243,0;.186, .186, .229, .214];
% 
