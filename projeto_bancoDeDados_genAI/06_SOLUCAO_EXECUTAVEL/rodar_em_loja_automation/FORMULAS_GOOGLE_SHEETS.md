# Formulas Google Sheets pt-BR

Considere a aba `BASE_GRAFANA` com as colunas A a Q. Cole as formulas apenas na linha 2.

## M2 - Vagas livres calculadas
```text
=ARRAYFORMULA(SE(A2:A="";;SE(J2:J-K2:K<0;0;J2:J-K2:K)))
```

## N2 - Taxa de ocupacao
```text
=ARRAYFORMULA(SE(A2:A="";;SEERRO(K2:K/J2:J;0)))
```

## O2 - Minutos restantes
```text
=ARRAYFORMULA(SE(A2:A="";;ARRED(((A2:A+I2:I)-AGORA())*1440;0)))
```
Observacao: `AGORA()` serve para leitura atual, nao para historico permanente.

## P2 - Elegibilidade
```text
=ARRAYFORMULA(SE(A2:A="";;SE((M2:M>0)*(O2:O>90);"SIM";"NAO")))
```

## Q2 - Canal recomendado por total da praca no dia
```text
=ARRAYFORMULA(SE(A2:A="";;SE(P2:P<>"SIM";"Nao acionar";SE(SOMASES(M:M;A:A;A2:A;C:C;C2:C;P:P;"SIM")<=2;"Blip Desk";"Blip Portal"))))
```

## R2 - Chave unica
```text
=ARRAYFORMULA(SE(A2:A="";;TEXTO(A2:A;"yyyymmdd")&"|"&C2:C&"|"&D2:D&"|"&TEXTO(H2:H;"hhmm")&"|"&TEXTO(F2:F;"yyyymmddhhmmss")))
```
