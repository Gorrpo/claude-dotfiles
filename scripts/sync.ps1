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
        Copy-Item -Path $_.FullName -Destination "$repoRoot\skills\" -Recurse -Force
        Write-Host "  ✓ $($_.Name) sincronizado"
    }
} else {
    Write-Host "  ℹ️ Nenhuma skill customizada encontrada"
}

# Sincronizar Configurações
Write-Host "`n⚙️ Sincronizando Configurações..." -ForegroundColor Cyan
if (Test-Path "$claudeDir\settings.json") {
    Copy-Item -Path "$claudeDir\settings.json" -Destination "$repoRoot\settings\" -Force
    Write-Host "  ✓ settings.json sincronizado"
}

if (Test-Path "$claudeDir\keybindings.json") {
    Copy-Item -Path "$claudeDir\keybindings.json" -Destination "$repoRoot\settings\" -Force
    Write-Host "  ✓ keybindings.json sincronizado"
}

# Sincronizar Hooks
Write-Host "`n🔗 Sincronizando Hooks..." -ForegroundColor Cyan
if (Test-Path "$claudeDir\hooks") {
    Copy-Item -Path "$claudeDir\hooks\*" -Destination "$repoRoot\settings\hooks\" -Recurse -Force
    Write-Host "  ✓ Hooks sincronizados"
} else {
    Write-Host "  ℹ️ Nenhum hook customizado encontrado"
}

Write-Host "`n✅ Sincronização concluída!" -ForegroundColor Green
Write-Host "`n📋 Próximas etapas:" -ForegroundColor Yellow
Write-Host "  git add ."
Write-Host "  git commit -m 'Sync: atualizar configurações'"
Write-Host "  git push origin main"
Write-Host ""
