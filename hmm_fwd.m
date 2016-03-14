% Sanjay Agravat
% Hidden Markov Model Forward Algorithm
%
% INPUTS:
%   O           = observation sequence labeled with integers
%   trans_p(N,N)= transition probability matrix
%   emit(N,M)   = emission matrix
%   start_p     = initial probability matrix
%   term_p      = terminating probability matrix
% Output:
%   P = probability of given sequence in the given model

function p=hmm_fwd(obs,trans_p,emit,start_p,term_p)
n=length(trans_p(1,:));
L=length(obs);
% initialization
for i=1:n        
    m(1,i)=emit(i,obs(1))*start_p(i);
end
% loop through
for t=1:(L-1)     
    for j=1:n
        z=0;
        for i=1:n
            z=z+trans_p(i,j)*m(t,i);
        end
        m(t+1,j)=z*emit(j,obs(t+1));
    end
end
p=0;
% termination
for i=1:n         
    p=p+m(L,i) * term_p(i);        
end
