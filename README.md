# Claude Dotfiles

Repositório centralizado com todas as minhas skills, plugins e configurações personalizadas do Claude Code.

## 📁 Estrutura

```
claude-dotfiles/
├── skills/              # Skills customizadas
├── plugins/             # Plugins personalizados
├── settings/            # Configurações (settings.json, keybindings.json)
│   └── hooks/          # Scripts custom de hooks
├── scripts/            # Scripts de instalação e sincronização
├── templates/          # Templates para novos projetos (CLAUDE.md)
└── .github/workflows/  # CI/CD (opcional)
```

## 🚀 Instalação Rápida

### Método 1: Script Automático
```powershell
.\scripts\install.ps1
```

### Método 2: Manual
1. Clone o repositório
2. Copie os arquivos para `~/.claude/`
3. Reinicie o Claude Code

## 📋 Conteúdo

- **Skills**: Automações e workflows personalizados
- **Plugins**: Extensões e integrações customizadas
- **Configurações**: Settings, keybindings e hooks do Claude Code
- **Templates**: CLAUDE.md template para usar em novos projetos

## 🔄 Sincronização

Para sincronizar alterações de volta ao repositório:

```powershell
.\scripts\sync.ps1
```

Para fazer backup das configurações atuais:

```powershell
.\scripts\backup.ps1
```

## 📝 Como Usar em Seus Projetos

1. Clone este repositório ou use como submodule
2. No seu projeto, copie ou referencie o `templates/CLAUDE.md`
3. Customize conforme necessário

### Como Submodule
```bash
git submodule add <url-do-repo> .claude-config
```

## 👥 Para Colaboradores

Se você foi adicionado como colaborador, siga estes passos:

### Primeira Vez
```powershell
# 1. Clonar o repositório
git clone https://github.com/Gorrpo/claude-dotfiles.git
cd claude-dotfiles

# 2. Instalar configurações
.\scripts\install.ps1

# 3. Reiniciar o Claude Code
```

### Fluxo de Trabalho
```powershell
# Fazer suas alterações nos arquivos da sua configuração

# 1. Sincronizar alterações de volta ao repositório
.\scripts\sync.ps1

# 2. Revisar mudanças
git status
git diff

# 3. Fazer commit
git add .
git commit -m "Sync: atualizar [skills/settings/plugins]"

# 4. Fazer push
git push origin main

# 5. Outros colaboradores puxam as atualizações
git pull origin main
.\scripts\install.ps1  # Reaplica as mudanças
```

### Dicas
- Use `.\scripts\backup.ps1` antes de grandes mudanças
- Prefixe commits com "Sync:" para sincronizações
- Comunique mudanças importantes com outros colaboradores

## 🔐 Segurança

- Nunca comite `.env`, senhas ou tokens pessoais
- Use `settings.local.json` para configurações sensíveis
- Veja `.gitignore` para arquivos excluídos

## 📚 Links Úteis

- [Claude Code Docs](https://claude.ai/code)
- [GitHub CLI](https://cli.github.com/)

## 📄 Licença

Pessoal - Uso próprio
