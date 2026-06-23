# Script de Instalação - Claude Dotfiles
# Instala todas as skills, plugins e configurações

param(
    [switch]$Force = $false,
    [switch]$Backup = $true
)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptPath
$claudeDir = "$env:USERPROFILE\.claude"

Write-Host "🚀 Iniciando instalação do Claude Dotfiles..." -ForegroundColor Green

# Criar diretório .claude se não existir
if (-not (Test-Path $claudeDir)) {
    Write-Host "  Criando diretório: $claudeDir"
    New-Item -ItemType Directory -Path $claudeDir -Force | Out-Null
}

# Fazer backup se solicitado
if ($Backup) {
    $backupDir = "$repoRoot\backups\$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')"
    Write-Host "  📦 Fazendo backup das configurações atuais..." -ForegroundColor Yellow

    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null

    @('skills', 'settings') | ForEach-Object {
        if (Test-Path "$claudeDir\$_") {
            Copy-Item -Path "$claudeDir\$_" -Destination "$backupDir\" -Recurse -Force
            Write-Host "    ✓ Backup de $_ criado"
        }
    }
}

# Instalar Skills
Write-Host "`n📚 Instalando Skills..." -ForegroundColor Cyan
if (Test-Path "$repoRoot\skills") {
    Copy-Item -Path "$repoRoot\skills\*" -Destination "$claudeDir\skills\" -Recurse -Force
    Write-Host "  ✓ Skills instaladas com sucesso"
} else {
    Write-Host "  ⚠️ Diretório de skills não encontrado"
}

# Instalar Configurações
Write-Host "`n⚙️ Instalando Configurações..." -ForegroundColor Cyan
if (Test-Path "$repoRoot\settings\settings.json") {
    Copy-Item -Path "$repoRoot\settings\settings.json" -Destination "$claudeDir\" -Force
    Write-Host "  ✓ settings.json instalado"
}

if (Test-Path "$repoRoot\settings\keybindings.json") {
    Copy-Item -Path "$repoRoot\settings\keybindings.json" -Destination "$claudeDir\" -Force
    Write-Host "  ✓ keybindings.json instalado"
}

if (Test-Path "$repoRoot\settings\hooks") {
    Copy-Item -Path "$repoRoot\settings\hooks\*" -Destination "$claudeDir\hooks\" -Recurse -Force
    Write-Host "  ✓ Hooks instalados"
}

# Instalar Plugins
Write-Host "`n🔌 Instalando Plugins..." -ForegroundColor Cyan
if (Test-Path "$repoRoot\plugins" -and (Get-ChildItem "$repoRoot\plugins" -Recurse | Measure-Object).Count -gt 0) {
    Copy-Item -Path "$repoRoot\plugins\*" -Destination "$claudeDir\plugins\" -Recurse -Force
    Write-Host "  ✓ Plugins instalados"
} else {
    Write-Host "  ℹ️ Nenhum plugin customizado encontrado"
}

Write-Host "`n✅ Instalação concluída com sucesso!" -ForegroundColor Green
Write-Host "`n📝 Próximos passos:" -ForegroundColor Yellow
Write-Host "  1. Reinicie o Claude Code"
Write-Host "  2. Verifique as configurações em: $claudeDir"
Write-Host "  3. Customize conforme necessário"

if ($Backup) {
    Write-Host "`n💾 Backup disponível em: $backupDir"
}

Write-Host ""
