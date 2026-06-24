# Script de Instalação - Claude Dotfiles
# Instala skills e plugins do repositório (nunca sobrescreve configurações pessoais)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptPath
$claudeDir = "$env:USERPROFILE\.claude"

Write-Host "Iniciando instalacao do Claude Dotfiles..." -ForegroundColor Green

# Criar diretório .claude se não existir
if (-not (Test-Path $claudeDir)) {
    New-Item -ItemType Directory -Path $claudeDir -Force | Out-Null
    Write-Host "  Diretorio .claude criado: $claudeDir"
}

# Instalar Skills (sempre atualiza)
Write-Host "`nInstalando Skills..." -ForegroundColor Cyan
$skillsSource = "$repoRoot\skills"
$skillsDest = "$claudeDir\skills"

if (-not (Test-Path $skillsDest)) {
    New-Item -ItemType Directory -Path $skillsDest -Force | Out-Null
}

if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    if ($skills.Count -eq 0) {
        Write-Host "  Nenhuma skill no repositorio ainda"
    } else {
        foreach ($skill in $skills) {
            Copy-Item -Path $skill.FullName -Destination "$skillsDest\" -Recurse -Force
            Write-Host "  OK: $($skill.Name)"
        }
    }
} else {
    Write-Host "  Pasta de skills nao encontrada no repositorio"
}

# Instalar Plugins (sempre atualiza)
Write-Host "`nInstalando Plugins..." -ForegroundColor Cyan
$pluginsSource = "$repoRoot\plugins"
$pluginsDest = "$claudeDir\plugins"

if (-not (Test-Path $pluginsDest)) {
    New-Item -ItemType Directory -Path $pluginsDest -Force | Out-Null
}

if (Test-Path $pluginsSource) {
    $plugins = Get-ChildItem -Path $pluginsSource -Directory
    if ($plugins.Count -eq 0) {
        Write-Host "  Nenhum plugin no repositorio ainda"
    } else {
        foreach ($plugin in $plugins) {
            Copy-Item -Path $plugin.FullName -Destination "$pluginsDest\" -Recurse -Force
            Write-Host "  OK: $($plugin.Name)"
        }
    }
} else {
    Write-Host "  Pasta de plugins nao encontrada no repositorio"
}

# Configurações pessoais (NUNCA sobrescreve - apenas informa)
Write-Host "`nConfiguracoes pessoais (sem alteracoes):" -ForegroundColor Yellow
foreach ($file in @("settings.json", "keybindings.json")) {
    if (Test-Path "$claudeDir\$file") {
        Write-Host "  Mantido: $file (ja existe localmente)"
    } else {
        Write-Host "  Info: $file nao encontrado localmente - crie o seu em $claudeDir\$file"
    }
}

Write-Host "`nInstalacao concluida!" -ForegroundColor Green
Write-Host ""
Write-Host "  Skills e plugins: atualizados do repositorio"
Write-Host "  Configuracoes pessoais: preservadas"
Write-Host ""
Write-Host "Reinicie o Claude Code para carregar as mudancas."
Write-Host ""
