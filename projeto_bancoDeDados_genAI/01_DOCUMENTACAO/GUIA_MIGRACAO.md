# Guia de migrações SQL

Os scripts de migracao ficam em `../02_BANCO_DE_DADOS/dbscripts/migrations`. Eles consolidam a criacao das tabelas e a carga dos dados iniciais.

## Ordem recomendada

1. Execute `tables/001_create_tables.sql` no banco compativel com o script.
2. Execute os arquivos de `seeds/` em ordem numerica.
3. Execute os arquivos de `VIEWS/` em ordem numerica.
4. Use `migrations/` quando o ambiente utilizar o fluxo automatizado de migracao.

## Scripts PowerShell

Os arquivos `tables/to_migration.ps1` e `seeds/to_migration.ps1` podem ser usados para aplicar os scripts da pasta correspondente. Abra o PowerShell na raiz da entrega e execute o caminho completo do script, por exemplo:

```powershell
& ".\02_BANCO_DE_DADOS\dbscripts\tables\to_migration.ps1"
```

Valide previamente o nome do banco, as credenciais e o cliente SQL usados pelo script. Nao inclua senhas ou strings de conexao no pacote enviado para a banca.

