%d = [0.057, 0, 0 , 0; .171, .157, 0,0; .271, .229, .243,0;.186, .186, .229, .214];
function [DistanceMatrix] = distance_matrix(ScoringMatrix)
    n = size(ScoringMatrix,1);
    r(1) = sum(ScoringMatrix(:,1));
    for i=2 : n
        r(i) = sum(ScoringMatrix(i-1,:)) + sum(ScoringMatrix(:,i));
    end
    r(i+1) = sum(ScoringMatrix(n,:));
    r=r/(n-1);

    DistanceMatrix=zeros(n, n);
    for j=1 : n
       for k=j : n
            DistanceMatrix(k,j) = ScoringMatrix(k,j) - r(j) - r(k+1);
       end
    end
end
% t(1,1) = d(1,1) - r(1) - r(2)
% t(2,1) = d(2,1) - r(1) - r(3)
% t(3,1) = d(3,1) - r(1) - r(4)
% t(4,1) = d(4,1) - r(1) - r(5)
% 
% 


















% z(5,5)=sum(d(4,:))/3;
% t=d;
% x = zeros(4,4);
% v = diag(z);
% for outer = 1 : size(t)
%     b=0;
%      for inner = 1 : size(d,2)
%         if (inner  <=  outer)
%             b = t(outer,inner) - v(outer+1)-v(outer);
%             x(outer, inner) = b;
%         end
%      end
%      fprintf('\n');
% end
% 
% 
