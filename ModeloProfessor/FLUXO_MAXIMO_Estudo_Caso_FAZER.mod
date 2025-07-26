#  Estudo de Caso sobre Fluxo_M�ximo 
#  Conforme indica��o do descritivo do estudo de caso no Moodle,  utilizar somente uma entre as Redes 1, 2 e 3 apresentadas nas Notas de Aula, com as adapta��es necess�rias, se indicadas. As adapta��es s�o descritas conforme o Grupo.

# -----------------------
# Template Base - Adaptar conforme necessidades indicadas para o Grupo
# -----------------------

# Declara��es das vari�veis que indicam as quantidades a serem transportadas [un] entre arcos. 
# Total de 48 vari�veis --> uma para cada arco
# Notar sentido de fluxo bidirecional nos arcos da rede
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0;
var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; var ...>=0; 

# Importante: Produ��es e demandas s�o VARI�VEIS em um modelo de Fluxo M�ximo. Valores dados em [un].
# Caso de rede com 3 f�bricas e 4 dep�sitos. Adequar conforme necessidade.
var prodf1>=0; var prodf2>=0; var prodf3>=0; 
var  demd1>=0; var  demd2>=0; var  demd3>=0; var demd4>=0; 

# Par�metros utilizados no estudo de caso. 
# Valores iniciais adotados --> ap�s modelo implementado e validado, testar modifica��es.
param L:=100; 
param k:=100; 
param c:=10;

# Maximizar o Fluxo na Rede de Transporte
maximize z: L*(prodf1+prodf2+prodf3) - 
	(colocar somat�rio dos custos de transporte.);

# Restri��es de "capacidades" das f�bricas
# Balan�o entre o que SAI menos o que ENTRA na f�brica
# F�brica --> Produtora --> Fornece material
subj to RF1: ... = prodf1;
subj to RF2: ... = prodf2;
subj to RF3: ... = prodf3;

# Restri��es de "demandas" dos dep�sitos
# Balan�o entre o que ENTRA menos o que SAI do dep�sito
# Dep�sito --> Possui demanda local --> Consumidor
subj to RD1: ... = demd1;
subj to RD2: ... = demd2;
subj to RD3: ... = demd3;
subj to RD4: ... = demd4;

# Restri��es de balan�o das esta��es intermedi�rias
# Quantidade que ENTRA = SAI da esta��o
# Ponto de troca de Custo ou Modal de transporte
# No caso, n�o desejamos ter demanda local
subj to RE1: ... = ...;
subj to RE2: ... = ...;
subj to RE3: ... = ...;
subj to RE4: ... = ...;
subj to RE5: ... = ...;
subj to RE6: ... = ...;
subj to RE7: ... = ...;
subj to RE8: ... = ...;
subj to RE9: ... = ...;

# Restri��es de capacidade de transporte dos arcos (corrigir o fator k/4 adequadamente)
# Restri��es t�m influ�ncia direta na Capacidade "global" de transporte na rede
subj to RK01: ...<=k/4;	subj to RK25: ...<=k/4; 
subj to RK02: ...<=k/4;	subj to RK26: ...<=k/4; 
subj to RK03: ...<=k/4;	subj to RK27: ...<=k/4;
subj to RK04: ...<=k/4;	subj to RK28: ...<=k/4; 
subj to RK05: ...<=k/4;	subj to RK29: ...<=k/4; 
subj to RK06: ...<=k/4;	subj to RK30: ...<=k/4;
subj to RK07: ...<=k/4;	subj to RK31: ...<=k/4; 
subj to RK08: ...<=k/4;	subj to RK32: ...<=k/4; 
subj to RK09: ...<=k/4;	subj to RK33: ...<=k/4; 
subj to RK10: ...<=k/4;	subj to RK34: ...<=k/4;
subj to RK11: ...<=k/4;	subj to RK35: ...<=k/4; 
subj to RK12: ...<=k/4;	subj to RK36: ...<=k/4; 
subj to RK13: ...<=k/4;	subj to RK37: ...<=k/4; 
subj to RK14: ...<=k/4;	subj to RK38: ...<=k/4; 
subj to RK15: ...<=k/4;	subj to RK39: ...<=k/4; 
subj to RK16: ...<=k/4;	subj to RK40: ...<=k/4; 
subj to RK17: ...<=k/4;	subj to RK41: ...<=k/4; 
subj to RK18: ...<=k/4;	subj to RK42: ...<=k/4; 
subj to RK19: ...<=k/4;	subj to RK43: ...<=k/4; 
subj to RK20: ...<=k/4;	subj to RK44: ...<=k/4;
subj to RK21: ...<=k/4;	subj to RK45: ...<=k/4; 
subj to RK22: ...<=k/4;	subj to RK46: ...<=k/4; 
subj to RK23: ...<=k/4;	subj to RK47: ...<=k/4; 
subj to RK24: ...<=k/4;	subj to RK48: ...<=k/4;

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
printf "\n> Somat�rio das Produ��es: %5.2f \n",prodf1+prodf2+prodf3;
printf "\n> Somat�rio das  Demandas: %5.2f \n",demd1+demd2+demd3+demd4;
printf "\n**************************************\n\n\n";
end;
