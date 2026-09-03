# ⚙️ System.Monitor_Slots | Engenharia de Dados | Deep Learning

![Status](https://img.shields.io/badge/Status-MVP_Operacional-brightgreen?style=for-the-badge)
![Desafio](https://img.shields.io/badge/Desafio-DIO_GenAI-blue?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-Automação-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Dados](https://img.shields.io/badge/Dados-Time--Series-7B61FF?style=for-the-badge)
![CX](https://img.shields.io/badge/CX-Blip_Desk_%26_Portal-EA1D2C?style=for-the-badge)

> **“A principal transformação não está em mover uma planilha para outro local, mas em substituir um modelo de verificação manual por uma operação orientada a dados e observabilidade contínua.”**

## 🎯 Visão do projeto

O **System.Monitor_Slots** é um MVP desenvolvido para o bootcamp **GenAI, Dados & Cyber da DIO**. A solução propõe a evolução do acompanhamento manual de vagas e slots para um fluxo orientado a dados, com ingestão de CSV, tratamento em Python, regras operacionais, visualização local e preparação para integração com Google Sheets e Grafana.

O projeto parte de um problema real: planilhas estáticas registram apenas uma fotografia da operação e não representam adequadamente alterações que acontecem ao longo do dia, como abertura, preenchimento, cancelamento e reabertura de vagas.

## 💡 Problema identificado

O modelo estático apresenta limitações como:

- Cegueira temporal entre uma extração e outra;
- Perda de eventos durante o dia;
- Decisões tardias de prospecção;
- Dependência de consultas e cálculos manuais;
- Baixa rastreabilidade do ciclo de vida das vagas;
- Ausência de histórico adequado para análises preditivas.

## ✅ Solução proposta

```text
CSV ou API operacional
        ↓
Pipeline de ingestão em Python
        ↓
Normalização e validação
        ↓
Snapshots e eventos operacionais
        ↓
Google Sheets ou banco de dados
        ↓
Dashboard local e Grafana
        ↓
Motor de regras
        ↓
Recomendação: Blip Desk ou Blip Portal
```

O MVP não realiza disparos automáticos. A solução identifica oportunidades, aplica regras transparentes e apoia a decisão humana.

## 🏗️ Frentes de atuação

### 1. Engenharia de Dados e Time-Series

- Importação de dados por CSV;
- Preparação para consumo de API;
- Normalização de colunas e valores;
- Separação entre snapshots e eventos;
- Cálculo de indicadores operacionais;
- Preparação para Google Sheets e Grafana;
- Formação de histórico para modelos preditivos.

### 2. Automação operacional e CX

- Validação de turnos elegíveis;
- Soma de vagas por praça;
- Recomendação de canal;
- Prevenção de acionamentos inadequados;
- Estruturação de um agente cowork;
- Geração futura de devolutivas humanizadas para o Blip;
- Preservação da validação humana.

## ⚖️ Regras do MVP

### Elegibilidade

Uma oportunidade é considerada elegível quando:

- Existem vagas livres;
- O turno pertence ao período analisado;
- O turno está futuro ou em andamento;
- Restam mais de **1 hora e 30 minutos** até o encerramento;
- Praça, loja e turno estão identificados;
- Os dados estão disponíveis para análise.

Quando a validação não for possível, o registro deve receber o status:

```text
Requer validação humana
```

### Canal recomendado

```text
Sem vagas elegíveis
→ Não acionar

Até 2 vagas elegíveis na praça
→ Blip Desk

3 ou mais vagas elegíveis na praça
→ Blip Portal
```

A totalização considera as lojas elegíveis da mesma praça e do mesmo dia.

## 📊 Indicadores

O painel apresenta:

- Vagas solicitadas;
- Vagas reservadas;
- Vagas livres;
- Vagas elegíveis;
- Taxa de ocupação;
- Minutos restantes do turno;
- Vagas por praça;
- Canal recomendado;
- Base consolidada.

## 🖥️ Dashboard local

A aplicação local foi desenvolvida com Python e Flask. O painel permite:

- Importar um arquivo CSV;
- Ler uma URL CSV publicada pelo Google Sheets;
- Normalizar os registros;
- Aplicar regras de elegibilidade;
- Visualizar indicadores e gráfico;
- Recomendar o canal de prospecção;
- Exportar a base tratada.

Endereço local padrão:

```text
http://127.0.0.1:5000
```

## 📂 Estrutura do repositório

```text
System.Monitor_Slots/
├── app.py
├── api_ingestion.py
├── sync_google_sheets.py
├── requirements.txt
├── .env.example
├── README.md
├── prompt_dados_final.md
├── FORMULAS_GOOGLE_SHEETS.md
├── template_google_sheets.xlsx
├── INICIAR_WINDOWS.bat
├── run_local.sh
├── data/
│   ├── exemplo_entrada.csv
│   └── base_grafana.csv
├── templates/
│   └── index.html
└── static/
    └── style.css
```

## 📥 Estrutura esperada do CSV

```csv
data,hora,praca,loja,operacao,inicio_turno,fim_turno,vagas_solicitadas,vagas_reservadas,vagas_livres
2026-09-03,10:00,Recife,Loja Centro,Food,10:00,23:00,12,9,3
2026-09-03,10:00,Recife,Loja Norte,Food,10:00,23:00,8,7,1
2026-09-03,10:00,Campinas,Loja Cambuí,Online,10:00,23:00,10,9,1
```

## 🚀 Execução no Windows

Na pasta do projeto, execute:

```powershell
python -m venv .venv
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt
python app.py
```

Depois, acesse:

```text
http://127.0.0.1:5000
```

A janela do PowerShell deve permanecer aberta durante o uso.

## 📗 Google Sheets

A solução possui um modelo de planilha e um script de sincronização. As configurações devem ser armazenadas em variáveis de ambiente:

```env
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
SPREADSHEET_ID=id_da_planilha
SHEET_NAME=BASE_GRAFANA
```

Execução:

```powershell
python sync_google_sheets.py
```

Nunca publique `credentials.json`, tokens ou IDs privados no repositório.

## 📈 Grafana

Intervalo sugerido para consulta da planilha:

```text
BASE_GRAFANA!A:R
```

Painéis sugeridos:

- Ocupação por praça;
- Vagas livres por loja;
- Evolução das vagas;
- Turnos elegíveis;
- Cancelamentos e reaberturas;
- Canal recomendado;
- Resultado antes e depois da prospecção.

## 💬 CX e humanização

A camada de CX deverá produzir mensagens:

- Diretas e acolhedoras;
- Coerentes com o jeitinho iFood;
- Sem saudações duplicadas;
- Sem prometer disponibilidade;
- Sem inventar vagas, promoções ou valores;
- Baseadas somente em dados validados;
- Preparadas para as variáveis dos templates aprovados.

A humanização faz parte do design da solução e deve caminhar junto com segurança, clareza e rastreabilidade.

## 🧠 Evolução preditiva

O histórico de snapshots e eventos poderá apoiar uma futura rede LSTM para estimar:

- Quantidade futura de vagas livres;
- Risco de ociosidade;
- Probabilidade de cancelamento;
- Tempo esperado para preenchimento;
- Necessidade de prospecção.

O MVP atual utiliza regras condicionais transparentes. Essas regras não são apresentadas como previsões de Inteligência Artificial.

## 🗺️ Roadmap

### MVP

- Importação CSV;
- Dashboard local;
- Indicadores;
- Elegibilidade;
- Recomendação de canal;
- Exportação da base.

### Fase 2

- Integração com API;
- Sincronização com Google Sheets;
- Dashboard no Grafana;
- Snapshots periódicos;
- Logs operacionais.

### Fase 3

- Histórico de acionamentos;
- Controle de públicos;
- Prevenção de duplicidades;
- Alertas;
- Geração assistida de mensagens;
- Aprovação humana.

### Evolução preditiva

- Base histórica Time-Series;
- Engenharia de atributos;
- Treinamento e avaliação da LSTM;
- Monitoramento e retreinamento;
- Integração das previsões ao agente cowork.

## 🛡️ Segurança

O projeto segue princípios de **Privacy by Design**. Não devem ser publicados:

- Dados pessoais;
- Telefones;
- Credenciais;
- Tokens;
- Chaves de API;
- Arquivos de conta de serviço;
- Informações corporativas restritas.

Exemplo de `.gitignore`:

```gitignore
.venv/
__pycache__/
*.pyc
.env
credentials.json
data/base_grafana.csv
*.log
```

## ⚠️ Limitações atuais

- O contrato da API real ainda precisa ser adaptado;
- O MVP utiliza CSV como armazenamento intermediário;
- Não existem disparos automáticos;
- A qualidade da análise depende da padronização dos dados;
- CSVs com aspas ou delimitadores inconsistentes podem exigir correção;
- A camada LSTM faz parte do roadmap futuro.

## 👤 Autoria

**Desenvolvido por Henry Torres Batista**

*Business Process Outsourcing, Data Analytics, Engenharia de Prompts e Automação de Processos.*

Projeto educacional desenvolvido para o bootcamp **GenAI, Dados & Cyber da DIO**.

## 📄 Licença

Projeto de finalidade educacional e demonstrativa. Antes do uso em produção, valide requisitos de segurança, privacidade, governança, regras operacionais e políticas das plataformas envolvidas.
