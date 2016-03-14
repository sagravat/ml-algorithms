% Viterbi Example from http://en.wikipedia.org/wiki/Viterbi_algorithm
states = {'Rainy', 'Sunny'}; 
obs = {'walk', 'shop', 'clean', 'shop'};
%       Rainy  Sunny
start_p = [0.6,0.4];
%       Rainy  Sunny
trans_p = [0.7, 0.3; %transitions from Rainy
           0.4,0.6]; %transitions from Sunny
%      walk  shop  clean
emit_p = [0.1,0.4,0.5; %emissions from Rainy
          0.6,0.3,0.1]; %emissions from Sunny
%Pr(obs)  path   Pr(path)


% Viterbi Example from http://en.wikipedia.org/wiki/Viterbi_algorithm

states = {'Fair', 'Bias1', 'Bias2'}; 
%         Fair Bias1 Bias2 End
start_p = [1.0,0.0,0.0];

%       Fair    Bias1  Bias2 
trans_p = [3/8, 1/4,   1/4;  %transitions from Fair
           1/2, 3/8,   0;     %transitions from Bias1
           1/2, 0,     3/8];  %transitions from Bias2

%        heads  tails
emit_p = [1/2,  1/2;  %emissions from Fair
          1/4,  3/4;  %emissions from Bias 1
          3/4,  1/4] %emissions from Bias 2

      
 
term = [1/8 1/8 1/8];
obs = [1 1 1 2 2 2];
%d(o,a,b,pi,term)
%p = hmm_fwd(obs, trans_p, emit_p,start_p,term)
% 
% %Pr(obs)  path   Pr(path)
 [total, argmax, valmax] = forward_viterbi(obs,states,start_p,trans_p,emit_p);