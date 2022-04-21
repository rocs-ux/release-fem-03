function [N,dN] = funcao_tenda(csi)

No_1 = (1-csi)/2;
No_2 = (1+csi)/2;



dNo_1 = -(1/2);
dNo_2 = (1/2);



N = [No_1 No_2];
dN = [dNo_1 dNo_2];

end