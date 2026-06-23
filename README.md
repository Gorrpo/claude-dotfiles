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

## 🔐 Segurança

- Nunca comite `.env`, senhas ou tokens pessoais
- Use `settings.local.json` para configurações sensíveis
- Veja `.gitignore` para arquivos excluídos

## 📚 Links Úteis

- [Claude Code Docs](https://claude.ai/code)
- [GitHub CLI](https://cli.github.com/)

## 📄 Licença

Pessoal - Uso próprio
