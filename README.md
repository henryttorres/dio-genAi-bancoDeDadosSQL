# ⚙️ System.Monitor_Slots // Engenharia de Dados

![Status](https://img.shields.io/badge/Status-Deployed-brightgreen?style=for-the-badge)
![Context](https://img.shields.io/badge/Desafio-DIO_GenAI-blue?style=for-the-badge)
![Tech](https://img.shields.io/badge/Framework-Prompt_Engineering-critical?style=for-the-badge)

> *"A principal mudança não é migrar uma planilha para outro local. É substituir um modelo de verificação manual por observabilidade contínua."*

## 🎯 Visão Executiva do Projeto
Este repositório contém o artefato arquitetural desenvolvido para o bootcamp **GenAI, Dados & Cyber da DIO**. O objetivo principal é solucionar um gargalo logístico crítico: a cegueira temporal causada por registros estáticos em planilhas manuais. 

Através de Engenharia de Prompts de nível Sênior (estruturado como um PRD - *Product Requirements Document*), o projeto orquestra uma transição completa para uma arquitetura orientada a eventos. O escopo abrange desde a ingestão de dados em tempo real até a automação de *Customer Experience* (CX), preparando o terreno para algoritmos de **Deep Learning**.

## 🏗️ Arquitetura e Frentes de Atuação

O ecossistema desenhado neste repositório atua em duas camadas fundamentais da operação:

### 1. Data Engineering & Time-Series (Back-end)
* **Ingestão Dinâmica:** Substituição do retrato manual estático (ex: extrações às 16h) por varreduras contínuas integradas via API (Grafana).
* **Modelagem de Eventos:** Separação estrita entre *Snapshots Temporais* (o estado momentâneo da praça) e *Eventos de Ciclo de Vida* (abertura, preenchimento e cancelamento de vagas/slots).
* **Deep Learning Roadmap:** Estruturação da base de dados histórica necessária para alimentar redes neurais recorrentes (**LSTM - Long Short-Term Memory**), permitindo a previsão de demanda e ociosidade logística.

### 2. Automação de CX e NLP (Front-end Operacional)
* **Motor de Decisão (Agente Cowork):** Algoritmo condicional para validação de elegibilidade de turnos, evitando disparos massivos em praças saturadas.
* **Integração Blip Desk / Portal:** Geração de devolutivas de linguagem natural com *guardrails* estritos (injeção direta em variáveis de template, controle de tom de voz e bloqueio de alucinações sobre promoções inexistentes).

## 📂 Estrutura do Repositório

| Arquivo | Descrição |
| :--- | :--- |
| `prompt_dados_final.md` | O núcleo da solução. Um prompt mestre que instrui modelos fundacionais (LLMs) a gerar o design do banco de dados, scripts de automação em Python, fórmulas de Array no Sheets e o controle de variáveis de CX. |

## 🚀 Guia de Execução (Deployment)

Para extrair o valor máximo deste prompt em qualquer LLM (GPT-4, Claude 3.5, Gemini):

1. **Injeção de Contexto:** Forneça o conteúdo integral de `prompt_dados_final.md` como *System Prompt* ou primeira instrução.
2. **Execução em Sprints:** Não exija o output completo de uma vez para evitar cortes por limite de tokens. Execute em fases:
   * *Sprint 1:* Peça a modelagem de Banco de Dados e Script de Ingestão (Python).
   * *Sprint 2:* Solicite as fórmulas matriciais e regras de negócio logísticas.
   * *Sprint 3:* Gere os *guardrails* de CX e o Roadmap da LSTM.

## 🛡️ Segurança da Informação (Compliance)
Este repositório foi construído com base nos pilares de *Privacy by Design*. Nenhum dado sensível (PII), credenciais de API, *tokens* ou volumetrias corporativas reais foram expostos. A documentação opera exclusivamente na camada de lógica de negócios e abstração arquitetural.

---
**Desenvolvido por Henry Torres**  
*Business Process Outsourcing & Data Analytics*
