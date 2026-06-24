# Script de Sincronização - Claude Dotfiles
# Copia skills e plugins do .claude para o repositório (nunca sincroniza configurações pessoais)

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptPath
$claudeDir = "$env:USERPROFILE\.claude"

Write-Host "Sincronizando Claude Dotfiles..." -ForegroundColor Green

# Sincronizar Skills
Write-Host "`nSincronizando Skills..." -ForegroundColor Cyan
$skillsSource = "$claudeDir\skills"
$skillsDest = "$repoRoot\skills"

if (Test-Path $skillsSource) {
    $skills = Get-ChildItem -Path $skillsSource -Directory
    if ($skills.Count -eq 0) {
        Write-Host "  Nenhuma skill encontrada localmente"
    } else {
        foreach ($skill in $skills) {
            Copy-Item -Path $skill.FullName -Destination "$skillsDest\" -Recurse -Force
            Write-Host "  OK: $($skill.Name)"
        }
    }
} else {
    Write-Host "  Pasta de skills nao encontrada em $skillsSource"
}

# Sincronizar Plugins
Write-Host "`nSincronizando Plugins..." -ForegroundColor Cyan
$pluginsSource = "$claudeDir\plugins"
$pluginsDest = "$repoRoot\plugins"

if (Test-Path $pluginsSource) {
    $plugins = Get-ChildItem -Path $pluginsSource -Directory
    if ($plugins.Count -eq 0) {
        Write-Host "  Nenhum plugin encontrado localmente"
    } else {
        foreach ($plugin in $plugins) {
            Copy-Item -Path $plugin.FullName -Destination "$pluginsDest\" -Recurse -Force
            Write-Host "  OK: $($plugin.Name)"
        }
    }
} else {
    Write-Host "  Pasta de plugins nao encontrada em $pluginsSource"
}

# Lembrar que configurações pessoais não são sincronizadas
Write-Host "`nNao sincronizado (configuracoes pessoais):" -ForegroundColor Yellow
Write-Host "  settings.json"
Write-Host "  keybindings.json"

# Ver mudanças no git
Write-Host "`nMudancas prontas para commit:" -ForegroundColor Cyan
git -C $repoRoot status --short

Write-Host "`nPara enviar ao GitHub:" -ForegroundColor Green
Write-Host "  git add ."
Write-Host "  git commit -m ""Sync: atualizar skills e plugins"""
Write-Host "  git push origin main"
Write-Host ""
