%         Fair   Bias1  Bias2  End  Start
trans_p = [3/8,  1/4,   1/4,   0,    1;  %transitions from Fair
           1/2,  3/8,   0,     0,    0;  %transitions from Bias1
           1/2,  0,     3/8,   0,    0;  %transitions from Bias2
           1/8,  1/8,   1/8,   0,    0;  %transitions from End 
           0,    0,      0,    0,    0];  %transitions from Start 
       
%         Fair   Bias1  Bias2    Start
% trans_p = [3/8,  1/4,   1/4,       0;  %transitions from Fair
%            1/2,  3/8,   0,         0;  %transitions from Bias1
%            1/2,  0,     3/8,       0;  %transitions from Bias2        
%            0,    0,      0,        0]  %transitions from Start 
% 
%        
       
%        heads  tails
emit_p = [1/2,  1/2;  %emissions from Fair
          1/4,  3/4;  %emissions from Bias 1
          3/4,  1/4;  %emissions from Bias 2
          0  ,   0;   %emissions from End
          0  ,   0];   %emissions from start
      
      

% [seq,states] = ...
%    hmmgenerate(6,trans_p,emit_p,...
%                'Statenames',{'fair';'bias1';'bias2';'end';'start'});      
seq = [1 1 1 2 2 2]; 
           
estimateStates = ...
   hmmviterbi(seq,trans_p,emit_p,...
               'Statenames',{'fair';'bias1';'bias2';'end';'start'});  
