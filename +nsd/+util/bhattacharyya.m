function [d] = bhattacharyya(m1, P1, m2, P2)
%--------------------------------------------------------------------------
%
% Copyright (c) 2012 Jeffrey Byrne 
% $Id: bhattacharyya.m 97 2012-12-24 16:17:52Z jebyrne $
%
%--------------------------------------------------------------------------

% (1/8)*(m1-m2)^T P^{-1} (m1-m2) + (1/2)*ln(\frac{det(P)}{\sqrt(det(P1)det(P2)}}
%P = 0.5*(P1+P2);
%detP = P(1,1)*P(2,2)-P(2,1)*P(1,2);
%Pinv = detP*[P(2,2) -P(1,2); -P(2,1) P(1,1)];
%detP1 = P1(1,1)*P1(2,2)-P1(2,1)*P1(1,2);
%detP2 = P2(1,1)*P2(2,2)-P2(2,1)*P2(1,2);
%d = 0.125*((m1-m2)'*(Pinv*(m1-m2))) + 0.5*log(detP/sqrt(detP1*detP2));

P = 0.5*(P1+P2);
detP = det(P);
Pinv = P\eye(size(P));
detP1 = det(P1);
detP2 = det(P2);
m1 = m1(:); % force columnwise
m2 = m2(:); % force columnwise
d = 0.125*((m1-m2)'*(Pinv*(m1-m2))) + 0.5*log(detP/sqrt(detP1*detP2));


