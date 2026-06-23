# Script de Backup - Claude Dotfiles
# Faz backup das configurações atuais do .claude

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptPath
$claudeDir = "$env:USERPROFILE\.claude"
$backupDir = "$repoRoot\backups\$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')"

Write-Host "💾 Iniciando backup das configurações..." -ForegroundColor Green

# Criar diretório de backup
New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

# Fazer backup de todos os arquivos importantes
$itemsToBackup = @(
    @{ Source = "$claudeDir\skills"; Name = "Skills" },
    @{ Source = "$claudeDir\settings.json"; Name = "settings.json" },
    @{ Source = "$claudeDir\keybindings.json"; Name = "keybindings.json" },
    @{ Source = "$claudeDir\hooks"; Name = "Hooks" },
    @{ Source = "$claudeDir\plugins"; Name = "Plugins" }
)

$itemsToBackup | ForEach-Object {
    if (Test-Path $_.Source) {
        if ((Get-Item $_.Source).PSIsContainer) {
            Copy-Item -Path $_.Source -Destination "$backupDir\" -Recurse -Force
        } else {
            Copy-Item -Path $_.Source -Destination "$backupDir\" -Force
        }
        Write-Host "  ✓ $($_.Name) incluído no backup"
    }
}

Write-Host "`n✅ Backup concluído com sucesso!" -ForegroundColor Green
Write-Host "`n📂 Localização do backup:" -ForegroundColor Yellow
Write-Host "  $backupDir" -ForegroundColor Cyan
Write-Host ""
