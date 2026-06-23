# CLAUDE.md - Configuração do Projeto

## Visão Geral

Documentação de configuração do Claude Code para este projeto. Use este arquivo para registrar:
- Convenções do projeto
- Padrões de código
- Preferências de estrutura
- Instruções específicas do domínio

## Estrutura do Projeto

```
src/               # Código-fonte principal
tests/             # Testes
docs/              # Documentação
scripts/           # Scripts utilitários
.claude/           # Configuração do Claude Code
```

## Padrões e Convenções

### Nomenclatura
- **Pastas**: kebab-case (ex: `my-folder`)
- **Arquivos**: kebab-case (ex: `my-file.ts`)
- **Classes**: PascalCase (ex: `MyClass`)
- **Variáveis/Funções**: camelCase (ex: `myVariable`)
- **Constantes**: UPPER_SNAKE_CASE (ex: `MAX_SIZE`)

### Estrutura de Commits
```
<tipo>: <descrição breve>

<descrição detalhada se necessário>
```

**Tipos permitidos:**
- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `refactor`: Refatoração
- `test`: Testes
- `docs`: Documentação
- `chore`: Manutenção

### Qualidade de Código
- Manter cobertura de testes acima de 80%
- Usar type-checking/linting
- Documentar funções públicas
- Evitar comentários óbvios

## Configuração do Claude Code

### Skills Recomendadas
- `superpowers:test-driven-development` - Para desenvolvimento orientado a testes
- `superpowers:systematic-debugging` - Para debug de issues
- `superpowers:writing-plans` - Para planejar mudanças grandes

### Preferências Pessoais

**Estilo de Resposta:**
- Prefiro respostas concisas com links para o código
- Inclua exemplos de uso quando apropriado
- Cite referências externas quando necessário

**Abordagem para Código:**
- Prefiro refatorações incrementais
- Testes antes de implementação
- Commits pequenos e focados

## Stack Técnico

- **Linguagem**: [Sua linguagem principal]
- **Framework**: [Se aplicável]
- **Runtime**: [Ex: Node.js, Python 3.11]
- **Package Manager**: [npm, yarn, pip, etc]

## Checklist para PRs

- [ ] Testes passando
- [ ] Código revisado
- [ ] Documentação atualizada
- [ ] Commits com mensagens claras
- [ ] Sem arquivos de debug ou temporários

## Recursos Úteis

- [Documentação](docs/)
- [Guia de Contribuição](CONTRIBUTING.md)
- [Issues Abertas](https://github.com/seu-usuario/projeto/issues)

## Notas

Adicione notas específicas do projeto, decisões arquiteturais, ou gotchas conhecidos aqui.

---

**Última atualização:** 2025-01-01
