%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                %
%                  GABRIEL FERNANDES ROCATELLI                   %
%             IMPLEMENTAÇÃO MÉTODO ELEMENTOS FINITOS             %
%                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% DADOS
data_03


%% PROCESSAMENTO 
%%


        % INCIDENCIA NODAL 


for i=1:elementnumber
inci(i,:)=[ i  i+1];    %identificação da localização de cada elemento - elemento 1 nós 1 e 2; elemento 2 nós 2 e 3; elemento 3 nós 3 e 4; elemento 4 nós 4 e 5.
end



        % MATRIZ DE RIGIDEZ LOCAL E GLOBAL


       
        
        KG = zeros(nos,nos); %matriz zero que representa a matriz global em dimensões
        
%         NumInt = ('Grau da função de forma: ')
%         NumInt = input(NumInt)
          NumInt = 1;
        
        [xi , wi] = gauss_quadra_03(NumInt); %CHAMADA DA FUNÇÃO DAS COORDENADAS DE GAUSS QUE RETORNA OS VALORES DE xi E wi DE ACORDO COM O GRAU DA FUNÇÃO DE FORMA
        
        Ke = zeros(2,2); 
        
        
        
for e=1:elementnumber
 
     % MATRIZ LOCAL
        
         Ke(:,:,e) = (B') * (E*A) * (B) * (wi) * (1/J);
       
     % SUPERPOSIÇÃO - MATRIZ GLOBAL
         
         loc=[inci(e,1) inci(e,2)]; %posição na qual os elementos entrarão na matriz de rigidez global
         KG(loc,loc) = KG(loc,loc) + Ke(:,:,e); %matriz global
end


        % Condições de contorno naturais

 
        KG(1,1) = KG(1,1)+k1;
        KG(nos,nos) = KG(nos,nos)+k2;
 

        % CARREGAMENTO
        
        NumInt = 2;
        [xi , wi] = gauss_quadra_03(NumInt);
       % Fe = zeros(2,1,elementnumber);
        F = zeros(nos,1);
        
for i=1:elementnumber
  Fe = zeros(2,1,elementnumber);
    for j = 1:NumInt
    
     csi = xi(1,j);
    
    [N,dN] = funcao_tenda(csi);
    
    No_1 = N(1,1);
    
    No_2 = N(1,2);
    
    
    coordenada = [0 1/4 ; 1/4 1/2 ; 1/2 3/4 ; 3/4 1];
    b = (coordenada(i,1)*No_1) + (coordenada(i,2)*No_2);
    
        
    Fe(:,:,i) = Fe(:,:,i) + (N' * x_car(b) * wi(1,j) * J);

    end
    
    loc=[inci(i,1) inci(i,2)];
    loc = loc';
    F(loc,:) = F(loc,:) + Fe(:,1,i);
end

       % Condições de contorno naturais
       
       F(5) = F(5) - k2 * 0.1 * 1;

%% PÓS PROCESSAMENTO
%POR FIM, OS DESLOCAMENTOS PODEM SER LOCALIZADOS ATRAVÉS DO SISTEMA LINEAR:


format long
U = KG\F;

U_tensao = U(inci);

        NumInt = 3;
        [xi , wi] = gauss_quadra_03(NumInt);
        Desloc_1=zeros(1,NumInt,elementnumber);
        Deform = zeros(1,NumInt,elementnumber);
        Tensao = zeros(1,NumInt,elementnumber);
        

for i = 1:elementnumber
    loc=[inci(i,1) inci(i,2)];
    for j = 1:NumInt
    
     csi = xi(1,j);
     
     [N,dN] = funcao_tenda(csi);
     
     dNo_1 = dN(1,1);
    
     dNo_2 = dN(1,2);
     
     
     Desloc_1(:,j,i) = N * U_tensao(loc)';
     Deform(:,j,i) = (Le/2)*dN * U_tensao(loc)';
     Tensao(:,j,i) = E*Deform(:,j,i);

    end
    
end



hold on

% plot(Deform(:,:,1))
% xlim([0 10])
% ylim([-1 1])
% plot(Deform(:,:,2))
% plot(Deform(:,:,3))
% plot(Deform(:,:,4))


plot(Tensao(:,:,1))
plot(Tensao(:,:,2))
plot(Tensao(:,:,3))
plot(Tensao(:,:,4))

%professor roberto  daledone machado marcos ardnt 

