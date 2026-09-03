# Entrega Final

Pacote organizado para avaliacao da banca do curso. A entrega apresenta um MVP de ingestao e monitoramento operacional de slots, com normalizacao de CSV, regras de elegibilidade, recomendacao de canal e preparacao para Google Sheets e Grafana.

## Como navegar

| Pasta | Conteudo |
| --- | --- |
| `01_DOCUMENTACAO` | Guias de migracao e escopo da entrega |
| `02_BANCO_DE_DADOS` | Tabelas, seeds, migrations e views SQL |
| `03_IA_E_PROMPTS` | Prompts, tratamento de dados e materiais de analise |
| `04_ASSETS` | Imagens e recursos visuais |
| `05_DASHBOARDS` | Dashboards e visualizacoes |
| `06_SOLUCAO_EXECUTAVEL` | Aplicacao local, exemplos, integracoes e testes |

## Demonstracao do MVP

1. Abra `../index.html` para a visao executiva e pagina de oferta.
2. Entre em `06_SOLUCAO_EXECUTAVEL/rodar_em_loja_automation`.
3. No Windows, execute `INICIAR_WINDOWS.bat`.
4. Abra `http://127.0.0.1:5000`.
5. Use `data/exemplo_entrada.csv` para testar uma importacao.
6. Execute `TESTAR_INSTALACAO_WINDOWS.bat` para verificar dependencias e sintaxe Python.

Para macOS/Linux, execute `./run_local.sh` dentro da pasta da aplicacao.

## Resumo do script de migracao

O script `02_BANCO_DE_DADOS/dbscripts/migrations/to_migration.ps1` localiza os arquivos `.sql` da pasta de migrations e de sua pasta-pai, ignora o arquivo de saida `migration.sql`, remove uma versao anterior e concatena os scripts encontrados em um unico arquivo. Os arquivos sao ordenados pelo caminho, recebem a separacao `GO` e o resultado e gravado na propria pasta de migrations.

Esse processo facilita a execucao organizada do conjunto SQL sem editar manualmente cada arquivo. Antes de executar, confira a ordem dos scripts, o banco de destino e as credenciais do cliente SQL.

## Evidencias tecnicas

- Ingestao de arquivo CSV com deteccao de separador.
- Normalizacao de aliases de colunas e conversao numerica.
- Calculo de vagas livres, taxa de ocupacao e minutos restantes.
- Regra de elegibilidade: vagas livres e mais de 90 minutos ate o encerramento.
- Recomendacao de `Blip Desk` para ate 2 vagas e `Blip Portal` para 3 ou mais.
- Endpoint de exportacao da base preparada para Grafana.
- Adaptadores separados para API interna e Google Sheets.
- Scripts SQL organizados por tabelas, seeds, migrations e views.

## Cuidados para envio

Nao incluir credenciais reais, tokens, arquivos `.env` preenchidos, dados pessoais ou bases corporativas. O arquivo `.env.example` e apenas um modelo de configuracao. A aplicacao recomenda uma acao, mas nao dispara comunicacoes automaticamente.

## Escopo e limitacoes

O pacote e um MVP local. A integracao com a API operacional depende do contrato real do servico; a integracao com Google Sheets depende de credenciais e configuracao do Google Cloud. Historico de eventos, persistencia temporal completa, autenticacao de usuarios e modelo preditivo LSTM permanecem como evolucoes posteriores, descritas em `01_DOCUMENTACAO/ESCOPO_E_STATUS.md`.
