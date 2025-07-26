#  Estudo de Caso sobre Fluxo_Máximo 
#  Conforme indicação do descritivo do estudo de caso no Moodle,  utilizar somente uma entre as Redes 1, 2 e 3 apresentadas nas Notas de Aula, com as adaptações necessárias, se indicadas. As adaptações são descritas conforme o Grupo.

# -----------------------
# Template Base - Adaptar conforme necessidades indicadas para o Grupo
# -----------------------

# Declarações das variáveis que indicam as quantidades a serem transportadas [un] entre arcos. 
# Total de 48 variáveis --> uma para cada arco
# Notar sentido de fluxo bidirecional nos arcos da rede
var F1_E4>= 0; var E4_F1>= 0; var E4_E6>= 0; var E6_E4>= 0; var E6_F3>= 0; var F3_E6>= 0;
var F1_E1>= 0; var E1_F1>= 0; var E4_D1>= 0; var D1_E4>= 0; var E6_F2>= 0; var F2_E6>= 0; var F3_E8>= 0; var E8_F3>= 0;
var E1_D1>= 0; var D1_E1>= 0; var D1_F2>= 0; var F2_D1>= 0; var F2_E8>= 0; var E8_F2>= 0;
var E1_E2>= 0; var E2_E1>= 0; var D1_E5>= 0; var E5_D1>= 0; var F2_D3>= 0; var D3_F2>= 0; var E8_E9>= 0; var E9_E8>= 0;
var E2_E5>= 0; var E5_E2>= 0; var E5_D3>= 0; var D3_E5>= 0; var D3_E9>= 0; var E9_D3>= 0;
var E2_E3>= 0; var E3_E2>= 0; var E5_D2>= 0; var D2_E5>= 0; var D3_E7>= 0; var E7_D3>= 0; var E9_D4>= 0; var D4_E9>= 0;
var E3_D2>= 0; var D2_E3>= 0; var D2_E7>= 0; var E7_D2>= 0; var E7_D4>= 0; var D4_E7>= 0;

# Importante: Produções e demandas são VARIÁVEIS em um modelo de Fluxo Máximo. Valores dados em [un].
# Caso de rede com 3 fábricas e 4 depósitos. Adequar conforme necessidade.
var prodf1>=0; var prodf2>=0; var prodf3>=0; 
var  demd1>=0; var  demd2>=0; var  demd3>=0; var demd4>=0; 

# Parâmetros utilizados no estudo de caso. 
# Valores iniciais adotados --> após modelo implementado e validado, testar modificações.
param L:=100; 
param k:=100; 
param c:=10;

# Maximizar o Fluxo na Rede de Transporte
maximize z: L*(prodf1+prodf2+prodf3) - F1_E4*c/4 + E4_F1*c/4 + E4_E6*c/4 + E6_E4*c/4 + E6_F3*c/4 + F3_E6*c/4 + F1_E1*c + E1_F1*c + E4_D1*c + D1_E4*c + E6_F2*c + F2_E6*c + F3_E8*c/3 + E8_F3*c/3 + E1_D1*c/2 + D1_E1*c/2 + D1_F2*c/4 + F2_D1*c/4 + F2_E8*c/3 + E8_F2*c/3 + E1_E2*c/2 + E2_E1*c/2 + D1_E5*c/2 + E5_D1*c/2 + F2_D3*c/2 + D3_F2*c/2 + E8_E9*c/2 + E9_E8*c/2 + E2_E5*c/2 + E5_E2*c/2 + E5_D3*c/2 + D3_E5*c/2 + D3_E9*c/2 + E9_D3*c/2 + E2_E3*c/3 + E3_E2*c/3 + E5_D2*c/3 + D2_E5*c/3 + D3_E7*c/3 + E7_D3*c/3 + E9_D4*c + D4_E9*c + E3_D2*c + D2_E3*c + D2_E7*c + E7_D2*c + E7_D4*c + D4_E7*c;


# Restrições de "capacidades" das fábricas
# Balanço entre o que SAI menos o que ENTRA na fábrica
# Fábrica --> Produtora --> Fornece material
subj to RF1:(F1_E4 + F1_E1) - (E4_F1 + E1_F1) = prodf1;
subj to RF2: (F2_E6 + F2_E8 + F2_D3 + F2_D1) - (E6_F2 + E8_F2 + D3_F2 + D1_F2) = prodf2;
subj to RF3: (F3_E8 + F3_E6) - (E6_F3 + E8_F3) = prodf3;

# Restrições de "demandas" dos depósitos
# Balanço entre o que ENTRA menos o que SAI do depósito
# Depósito --> Possui demanda local --> Consumidor
subj to RD1: (E4_D1 + F2_D1 + E5_D1 + E1_D1) - (D1_E4 + D1_F2 + D1_E5 + D1_E1) = demd1;
subj to RD2: (E3_D2 + E5_D2 + E7_D2) - (D2_E3 + D2_E5 + D2_E7) = demd2;
subj to RD3: (F2_D3 + E9_D3 + E7_D3 + E5_D3) - (D3_F2 + D3_E9 + D3_E7 + D3_E5) = demd3;
subj to RD4: (E9_D4 + E7_D4) - (D4_E9 + D4_E7) = demd4;

# Restrições de balanço das estações intermediárias
# Quantidade que ENTRA = SAI da estação
# Ponto de troca de Custo ou Modal de transporte
# No caso, não desejamos ter demanda local
subj to RE1: (F1_E1 + D1_E1 + E2_E1) = (E1_F1 + E1_D1 + E1_E2);
subj to RE2: (E1_E2 + E5_E2 + E3_E2) = (E2_E1 + E2_E5 + E2_E5);
subj to RE3: (E2_E3 + D2_E3 ) = (E3_E2 + E3_D2);
subj to RE4: (F1_E4 + E6_E4 + D1_E4) = (E4_F1 + E4_E6 + E4_D1);
subj to RE5: (E2_E5 + D3_E5 + D1_E5 + D2_E5) = (E5_E2 + E5_D3 + E5_D1 + E5_D2);
subj to RE6: (E4_E6 + F3_E6 + F2_E6) = (E6_E4 + E6_F3 + E6_F2);
subj to RE7: (D2_E7 + D3_E7 + D4_E7) = (E7_D2 + E7_D3 + E7_D4);
subj to RE8: (F2_E8 + F3_E8 + E9_E8) = (E8_F2 + E8_F3 + E8_E9);
subj to RE9: (D3_E9 + E8_E9 + D4_E9) = (E9_D3 + E9_E8 + E9_D4);

# Restrições de capacidade de transporte dos arcos (corrigir o fator k/4 adequadamente)
# Restrições têm influência direta na Capacidade "global" de transporte na rede
subj to RK01: (F1_E4 + E4_F1) <=k/4;
subj to RK02: (E4_E6 + E6_E4) <=k/4;
subj to RK03: (E6_F3 + F3_E6) <=k/4;
subj to RK04: (F1_E1 + E1_F1) <=k;
subj to RK05: (E4_D1 + D1_E4) <=k;
subj to RK06: (E6_F2 + F2_E6) <=k;
subj to RK07: (F3_E8 + E8_F3) <=k/3;
subj to RK08: (E1_D1 + D1_E1) <=k/2;
subj to RK09: (D1_F2 + F2_D1) <=k/4;
subj to RK10: (F2_E8 + E8_F2) <=k/3;
subj to RK11: (E1_E2 + E2_E1) <=k/2;
subj to RK12: (D1_E5 + E5_D1) <=k/2;
subj to RK13: (F2_D3 + D3_F2) <=k/2;
subj to RK14: (E8_E9 + E9_E8) <=k/2;
subj to RK15: (E2_E5 + E5_E2) <=k/2;
subj to RK16: (E5_D3 + D3_E5) <=k/2;
subj to RK17: (D3_E9 + E9_D3) <=k/2;
subj to RK18: (E2_E3 + E3_E2) <=k/3;
subj to RK19: (E5_D2 + D2_E5) <=k/3;
subj to RK20: (D3_E7 + E7_D3) <=k/3;
subj to RK21: (E9_D4 + D4_E9) <=k;
subj to RK22: (E3_D2 + D2_E3) <=k;
subj to RK23: (D2_E7 + E7_D2) <=k;
subj to RK24: (E7_D4 + D4_E7) <=k;

solve;

printf "\n\n************************************** \n";
printf "\n Resultados do Modelo \n";
# printf "\n Valor de  z: %5.2f \n", ;
printf "\n> Valor de  ProdF1: %5.2f \n",prodf1;
printf "\n> Valor de  ProdF2: %5.2f \n",prodf2;
printf "\n> Valor de  ProdF3: %5.2f \n",prodf3;
printf "\n> Valor de   DemD1: %5.2f \n",demd1;
printf "\n> Valor de   DemD2: %5.2f \n",demd2;
printf "\n> Valor de   DemD3: %5.2f \n",demd3;
printf "\n> Valor de   DemD4: %5.2f \n\n",demd4;
printf "\n> Somatório das Produções: %5.2f \n",prodf1+prodf2+prodf3;
printf "\n> Somatório das  Demandas: %5.2f \n",demd1+demd2+demd3+demd4;
printf "\n**************************************\n\n\n";
end;
