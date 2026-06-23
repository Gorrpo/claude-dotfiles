# 🚀 Setup do GitHub - Claude Dotfiles

## Próximas Etapas

Seu repositório local está pronto! Agora você precisa criar o repositório no GitHub e fazer push.

### Opção 1: Criar via Interface Web (Mais Fácil)

1. Acesse [github.com/new](https://github.com/new)
2. Preencha os campos:
   - **Repository name**: `claude-dotfiles`
   - **Description**: "Minha configuração centralizada do Claude Code - skills, plugins e configurações"
   - **Public/Private**: Escolha sua preferência
   - **DO NÃO inicialize com README, .gitignore ou license** (já temos esses)
3. Clique em "Create repository"

### Opção 2: Usar Git (Após instalar GitHub CLI)

```powershell
gh repo create claude-dotfiles --public --source=. --remote=origin --push
```

## Após Criar o Repositório no GitHub

Execute estes comandos no PowerShell:

```powershell
cd C:\Users\leonardo.leal_tjto\claude-dotfiles

# Adicionar remote (substitua seu-usuario pelo seu username do GitHub)
git remote add origin https://github.com/seu-usuario/claude-dotfiles.git

# Renomear branch para main (recomendado)
git branch -M main

# Fazer push
git push -u origin main
```

## Verificar se Funcionou

```powershell
# Ver informações do remote
git remote -v

# Deve mostrar algo como:
# origin  https://github.com/seu-usuario/claude-dotfiles.git (fetch)
# origin  https://github.com/seu-usuario/claude-dotfiles.git (push)
```

## Próximo: Usar em Seus Projetos

### Como Submodule
```bash
cd seu-projeto
git submodule add https://github.com/seu-usuario/claude-dotfiles.git .claude-config
```

### Como Clone Simples
```bash
git clone https://github.com/seu-usuario/claude-dotfiles.git
cd claude-dotfiles
.\scripts\install.ps1
```

## 📝 Não Esqueça

1. ✅ Criar repositório no GitHub
2. ✅ Fazer push da branch main
3. ✅ Testar instalação em outro local
4. ✅ Adicionar README ao repositório (já está incluído)
5. ⚠️ Revisar `settings.json` para dados sensíveis antes de fazer push público

## Troubleshooting

### Erro: "fatal: remote origin already exists"
```powershell
git remote remove origin
git remote add origin https://github.com/seu-usuario/claude-dotfiles.git
```

### Erro: "Permission denied (publickey)"
Você precisa adicionar sua chave SSH ao GitHub:
1. Gere uma chave: `ssh-keygen -t ed25519`
2. Copie a chave pública em: `~/.ssh/id_ed25519.pub`
3. Adicione em: https://github.com/settings/keys

Ou use HTTPS em vez de SSH:
```powershell
git remote set-url origin https://github.com/seu-usuario/claude-dotfiles.git
```

---

Assim que terminar o setup no GitHub, você terá um repositório centralizado reutilizável em todos os seus projetos! 🎉
