# Escopo e status da entrega

## Problema

O acompanhamento manual por planilhas produz snapshots isolados da operacao. O MVP demonstra como transformar uma entrada tabular em uma base normalizada, com indicadores e recomendacao operacional rastreavel.

## Entregue

- Interface local para consulta dos registros processados.
- Upload de CSV e sincronizacao por URL CSV publicada.
- Normalizacao de nomes de colunas em portugues e ingles.
- Calculos de ocupacao, vagas livres, tempo restante e elegibilidade.
- Recomendacao de canal por volume de vagas na praca.
- Exportacao da base para uso no Grafana.
- Esqueleto de ingestao de API e sincronizacao com Google Sheets.
- Estrutura SQL com tabelas, dados iniciais, migrations e views.
- Prompts e materiais de apoio para a frente de dados e IA.

## Nao entregue no MVP

- Acesso a uma API operacional real ou contrato validado.
- Disparo automatico de mensagens para entregadores.
- Autenticacao, autorizacao e trilha de auditoria de usuarios.
- Banco de dados conectado ao aplicativo local.
- Historico completo de eventos de abertura, reserva, cancelamento e reabertura.
- Modelo preditivo treinado, incluindo LSTM.

Esses itens nao foram simulados. Eles dependem de fontes, credenciais, regras de negocio e criterios de validacao que nao estao disponiveis neste pacote.

## Criterios de demonstracao

Com o arquivo `data/exemplo_entrada.csv`, a banca pode iniciar a aplicacao, visualizar a base processada, importar outro CSV no mesmo formato e baixar `base_grafana.csv` pela interface. O arquivo de saida e gerado em tempo de execucao e nao faz parte do material estatico da entrega.

## Proximas fases recomendadas

1. Validar o contrato da API e definir frequencia de coleta.
2. Persistir snapshots e eventos com identificadores idempotentes.
3. Adicionar autenticacao, logs, auditoria e observabilidade.
4. Conectar Google Sheets e Grafana em ambiente controlado.
5. Medir conversao por canal e preparar a base historica para previsao.
