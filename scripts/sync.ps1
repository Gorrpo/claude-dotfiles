# Script de Sincronização - Claude Dotfiles
# Sincroniza alterações do diretório .claude para o repositório

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptPath
$claudeDir = "$env:USERPROFILE\.claude"

Write-Host "🔄 Sincronizando Claude Dotfiles..." -ForegroundColor Green

# Sincronizar Skills
Write-Host "`n📚 Sincronizando Skills..." -ForegroundColor Cyan
if (Test-Path "$claudeDir\skills") {
    Get-ChildItem -Path "$claudeDir\skills" -Directory | ForEach-Object {
        Copy-Item -Path "$_.FullName" -Destination "$repoRoot\skills\" -Recurse -Force
        Write-Host "  ✓ $($_.Name) sincronizado"
    }
}

# Sincronizar Configurações
Write-Host "`n⚙️ Sincronizando Configurações..." -ForegroundColor Cyan
@('settings.json', 'keybindings.json') | ForEach-Object {
    if (Test-Path "$claudeDir\$_") {
        Copy-Item -Path "$claudeDir\$_" -Destination "$repoRoot\settings\" -Force
        Write-Host "  ✓ $_ sincronizado"
    }
}

# Sincronizar Hooks
if (Test-Path "$claudeDir\hooks") {
    Copy-Item -Path "$claudeDir\hooks\*" -Destination "$repoRoot\settings\hooks\" -Recurse -Force
    Write-Host "  ✓ Hooks sincronizados"
}

Write-Host "`n✅ Sincronização concluída!" -ForegroundColor Green
Write-Host "`n📋 Próximo passo:" -ForegroundColor Yellow
Write-Host "  git add -A"
Write-Host "  git commit -m 'Sync: atualizar configurações'"
Write-Host "  git push origin main"
Write-Host ""
