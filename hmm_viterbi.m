%% Viterbi Algorithm.

clc,clear all,close all;

states={'Fair','Bias1','Bias2'}; %The 3 "hidden" states
Nst=length(states);
obs={'Heads','Tails','Heads'}; % the 4 observations.

%Initial Probabilities of states
I_prob = [1.0,0.0,0.0];

%       Fair    Bias1  Bias2 
T_prob = [3/8, 1/4,   1/4;  %transitions from Fair
           1/2, 3/8,   0;     %transitions from Bias1
           1/2, 0,     3/8];  %transitions from Bias2

%        heads  tails
O_prob = [1/2,  1/2;  %emissions from Fair
          1/4,  3/4;  %emissions from Bias 1
          3/4,  1/4] %emissions from Bias 2
      
term = [1/8 1/8 1/8];


% Observation prob( Prob of observation given the state)
%O_prob=[0.6 0.2 0.15 0.05; 0.25 0.25 0.25 0.25; 0.05 0.10 0.35 0.50 ]';

% Here 1 corresponds to Dry, 2 to Dryish, 3 to Damp and 4 to soggy
oblist=[1 3 4 1 1];% List of observations
 lob=length(oblist);

del=zeros(Nst,lob);% collection of the maximum probability values at each stage
maxlist=del;
mx=zeros(1,lob);
for t=1:lob
    if t==1
        del(:,t)=I_prob.*O_prob(oblist(t),:)'; %Initialization
       [p mx(t)]=max(del(:,t));
        continue;
    end
    %Recursive Phase
    
    for j=1:Nst
        [del(j,t) maxlist(j,t)]=max(del(:,t-1).*T_prob(:,j));
    end
    del(:,t)=del(:,t).*O_prob(oblist(t),:)';
    [p mx(t)]=max(del(:,t)); % Read 4) in readme
end

        % Termination and Backtrack stage
dec_state=zeros(1,lob);
decode_state=cell(1,lob);
[pstar dec_state(lob)]=max(del(:,lob));

for t=lob-1:-1:1
    dec_state(t)=maxlist(dec_state(t+1),t+1);
end

for t=1:lob
decode_state{t}=states{dec_state(t)}
end

