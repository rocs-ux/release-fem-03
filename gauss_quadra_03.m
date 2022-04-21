function [xi , wi] = gauss_quadra_03(NumInt)


if NumInt == 1 
    
    xi(1) = 0;
    wi(1) = 2; 
    


elseif NumInt == 2 
    
    wi(1) = 1; 
    wi(2) = 1;
    
    
    xi(1) = -1/sqrt(3); %vai precisar virar matriz pq nem todo mundo pode ser xi
    xi(2) = 1/sqrt(3);
    
    
    
elseif NumInt ==3
    wi(1) = 5/9; 
    wi(2) = 8/9; 
    wi(3) = 5/9;
    
    
    xi(1) = -sqrt(3/5); 
    xi(2) = 0; 
    xi(3) = sqrt(3/5);
    
    
    
elseif NumInt ==4
    wi(1) = 0.348;
    wi(2) = 0.652;
    wi(3) = 0.652;
    wi(4) = 0.348;
    
    xi(1) = -0.861;
    xi(2) = -0.340;
    xi(3) = 0.340;
    xi(4) = 0.861;
    
    
    
elseif NumInt ==5
    wi(1) = 0.237;
    wi(2) = 0.479;
    wi(3) = 0.569;
    wi(4) = 0.479;
    wi(5) = 0.237;
    
    xi(1) = -0.906;
    xi(2) = -0.538;
    xi(3) = 0.0;
    xi(4) = 0.538;
    xi(5) = 0.906;
    
    
elseif NumInt ==6
    wi(1) = 0.171;
    wi(2) = 0.361;
    wi(3) = 0.468;
    wi(4) = 0.468;
    wi(5) = 0.361;
    wi(6) = 0.171;
    
    xi(1) = -0.932;
    xi(2) = -0.661;
    xi(3) = -0.239;
    xi(4) = 0.239;
    xi(5) = 0.661;
    xi(6) = 0.932;
    
    
end