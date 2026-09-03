$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

# Diretório do script atual
$scriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

# Tenta localizar a raiz do projeto (dbscripts)
$projectDirectory = Split-Path -Path $scriptDirectory -Parent
$searchRoots = @($scriptDirectory, $projectDirectory) |
    Where-Object { $_ -and (Test-Path $_ -PathType Container) } |
    Select-Object -Unique

# Arquivo final que será gerado
$outputFile = Join-Path -Path $scriptDirectory -ChildPath "migration.sql"

# Busca todos os SQL válidos, incluindo subpastas, evitando duplicidade
$sqlFiles = @()
foreach ($root in $searchRoots) {
    $foundFiles = Get-ChildItem -Path $root -Filter *.sql -File -Recurse -ErrorAction SilentlyContinue |
        Where-Object {
            $_.Name -ne "migration.sql" -and
            $_.FullName -ne $outputFile
        }

    if ($foundFiles) {
        $sqlFiles += $foundFiles
    }
}

$sqlFiles = $sqlFiles | Sort-Object FullName -Unique

if (-not $sqlFiles) {
    throw "Nenhum arquivo .sql encontrado em '$scriptDirectory' ou em '$projectDirectory'."
}

# Remove arquivo antigo, se existir
if (Test-Path -Path $outputFile) {
    Remove-Item -Path $outputFile -Force
}

# Concatena os arquivos
foreach ($file in $sqlFiles) {
    Get-Content -Path $file.FullName | Out-File -Append -FilePath $outputFile -Encoding UTF8
    "GO" | Out-File -Append -FilePath $outputFile -Encoding UTF8
}

Write-Host "Arquivos SQL processados: $($sqlFiles.Count)"
Write-Host "Arquivo gerado: $outputFile"