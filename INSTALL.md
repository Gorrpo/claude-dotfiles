# 📦 Guia de Instalação

## Pré-requisitos

- Git instalado
- Claude Code instalado
- Windows 11 (ou superior)

## Instalação Automática

### 1. Clone o repositório
```powershell
cd $env:USERPROFILE
git clone https://github.com/seu-usuario/claude-dotfiles.git
cd claude-dotfiles
```

### 2. Execute o script de instalação
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

### 3. Reinicie o Claude Code
Feche e abra novamente o Claude Code para carregar as configurações.

## Instalação Manual

### 1. Clone o repositório
```powershell
git clone https://github.com/seu-usuario/claude-dotfiles.git
```

### 2. Copie os arquivos

**Skills:**
```powershell
$claudeDir = "$env:USERPROFILE\.claude"
Copy-Item -Path ".\skills\*" -Destination "$claudeDir\skills\" -Recurse -Force
```

**Configurações:**
```powershell
Copy-Item -Path ".\settings\settings.json" -Destination "$claudeDir\" -Force
Copy-Item -Path ".\settings\keybindings.json" -Destination "$claudeDir\" -Force
```

**Plugins:**
```powershell
Copy-Item -Path ".\plugins\*" -Destination "$claudeDir\plugins\" -Recurse -Force
```

### 3. Reinicie o Claude Code

## Usar como Git Submodule

Se você quer manter sincronizado com atualizações:

```bash
cd seu-projeto
git submodule add https://github.com/seu-usuario/claude-dotfiles.git .claude-config
git submodule update --recursive
```

## Sincronizar Alterações

Para atualizar a partir do repositório remoto:

```powershell
git pull origin main
.\scripts\install.ps1
```

## Fazer Backup

Para fazer backup de suas configurações atuais antes de instalar:

```powershell
.\scripts\backup.ps1
```

Os backups serão salvos em `./backups/`

## Troubleshooting

### Erro de permissão (ExecutionPolicy)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Diretório .claude não existe
O script criará automaticamente se não existir.

### Skills não aparecem
1. Reinicie o Claude Code
2. Verifique se os arquivos estão em `~/.claude/skills/`
3. Verifique o caminho em `settings.json`

## Próximos Passos

1. Customize o `settings.json` conforme necessário
2. Adicione mais skills em `skills/`
3. Customize o `keybindings.json` para seus atalhos preferidos
4. Crie um `settings.local.json` para configurações sensíveis

## 📝 Notas

- Sempre faça backup antes de atualizar
- Use `settings.local.json` para dados sensíveis
- Não comite credenciais ou tokens
