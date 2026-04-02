# Flutter Development in AstroNvim

Guia rápido para desenvolver Flutter usando AstroNvim com `flutter-tools.nvim`.

## Configuração

### Plugins Instalados

- **flutter-tools.nvim** - Integração completa com Flutter
- **AstroCommunity dart pack** - LSP, syntax highlighting, snippets
- **nvim-dap** - Debug support (via AstroNvim)

### Arquivos de Configuração

- `lua/plugins/flutter.lua` - Configuração do flutter-tools
- `lua/community.lua` - Importa o pack Dart do AstroCommunity

---

## Keybindings

**⚠️ Atalhos disponíveis apenas em arquivos `.dart`**

| Tecla | Comando | Descrição |
|-------|---------|-----------|
| `<leader>Fl` | `:FlutterRun` | Start Flutter (primeira vez) / Hot Reload |
| `<leader>FR` | `:FlutterRestart` | Hot Restart (limpa estado) |
| `<leader>Fq` | `:FlutterQuit` | Para o app |
| `<leader>Fd` | `:FlutterDevices` | Seleciona device |
| `<leader>Fe` | `:FlutterEmulators` | Inicia emulador |
| `<leader>Fo` | `:FlutterOutlineToggle` | Toggle widget tree |

---

## Workflow Típico

### 1. Abrir Projeto Flutter

```bash
cd /path/to/flutter/project
nvim lib/main.dart
```

### 2. Iniciar Flutter

Dentro do Neovim, em qualquer arquivo `.dart`:

```vim
:FlutterRun
```

- Aparece lista de devices disponíveis
- Escolhe device (Chrome, macOS, Android emulator, etc.)
- App inicia

### 3. Desenvolver com Hot Reload

1. Edita código Dart
2. Salva o arquivo (`:w`)
3. Aperta `<leader>Fl` → Hot reload instantâneo! 🔥
   - Mantém o estado do app
   - Recarrega apenas widgets modificados

**Ou use Hot Restart** (`<leader>FR`) se:
- Mudou código de inicialização (`main()`)
- Mudou variáveis globais
- Reload não funcionou direito

### 4. Trocar Device

1. Aperta `<leader>Fd`
2. Escolhe novo device
3. App reinicia automaticamente

### 5. Parar

Aperta `<leader>Fq` ou fecha o buffer.

---

## Comandos Flutter (Manual)

Além dos atalhos, pode executar comandos diretamente:

```vim
:FlutterRun                 " Inicia app
:FlutterReload              " Hot reload
:FlutterRestart             " Hot restart
:FlutterQuit                " Para app
:FlutterDevices             " Lista/seleciona devices
:FlutterEmulators           " Lista/inicia emuladores
:FlutterOutlineToggle       " Toggle widget tree
:FlutterDevTools            " Abre DevTools no browser
:FlutterLogClear            " Limpa logs
:FlutterRename              " Renomeia símbolo (like LSP)
:FlutterSuper               " Vai para super class
```

---

## LSP Features (Dart Analysis Server)

### Navegação

| Tecla | Ação | Descrição |
|-------|------|-----------|
| `gd` | Go to Definition | Vai para definição |
| `gD` | Go to Declaration | Vai para declaração |
| `gr` | Find References | Busca todas referências |
| `gI` | Go to Implementation | Vai para implementação |
| `K` | Hover | Mostra documentação |
| `<C-k>` | Signature Help | Mostra parâmetros |

### Code Actions

Posiciona cursor no elemento e aperta:

```vim
<leader>la  " Lista code actions
```

**Code Actions disponíveis:**
- **Wrap with Widget** → Column, Row, Container, Padding, Center...
- **Remove Widget** → Remove wrapper mantendo children
- **Extract Method** → Extrai código para método
- **Extract Widget** → Extrai para novo widget
- **Import Library** → Auto-import de dependências
- **Fix Issues** → Quick fixes para warnings/errors
- **Sort Members** → Organiza métodos da classe

### Refactoring

```vim
<leader>lr  " Rename (renomeia em todo projeto)
<leader>lf  " Format (formata arquivo)
<leader>lF  " Format seleção
```

### Diagnostics

```vim
<leader>ld  " Line Diagnostics (mostra erros da linha)
]d          " Next Diagnostic
[d          " Previous Diagnostic
```

---

## Recursos Especiais

### 1. Color Previews 🎨

Cores aparecem inline automaticamente:

```dart
Color(0xFF42A5F5)   // Vê preview azul
Colors.red          // Vê preview vermelho
backgroundColor: Theme.of(context).primaryColor  // Preview dinâmico
```

### 2. Widget Outline

Aperta `<leader>Fo` para abrir árvore de widgets:

```
MyHomePage
├─ Scaffold
│  ├─ AppBar
│  │  └─ Text
│  └─ Body
│     └─ Center
│        └─ Column
│           ├─ Text
│           └─ FloatingActionButton
```

Navega com `j/k`, Enter para ir ao widget.

### 3. Flutter DevTools

```vim
:FlutterDevTools
```

Abre no browser:
- Widget Inspector
- Performance profiler
- Network monitor
- Memory profiler

### 4. Logs em Tempo Real

Logs aparecem no terminal onde rodou `:FlutterRun`.

Para ver dentro do Neovim:
```vim
:messages  " Vê mensagens recentes
```

---

## Dicas Práticas

### Widget Wrapping Rápido

```dart
Text("Hello World")  
// Cursor no Text, aperta <leader>la
// Escolhe "Wrap with Container"
Container(child: Text("Hello World"))
```

### Extract Widget

```dart
Column(
  children: [
    Icon(Icons.star),
    Text("Rating"),
    Text("4.5"),
  ],
)
// Seleciona linhas, <leader>la → "Extract Widget"
// Cria novo widget RatingWidget
```

### Auto Import

```dart
Navigator.push(...)  // Sublinhado em vermelho
// Aperta <leader>la → "Import library 'package:flutter/material.dart'"
```

### Format on Save

Código é formatado automaticamente ao salvar (`:w`).

**Desabilitar (se quiser):**
```vim
:set noautoformat
```

### Múltiplos Devices Simultâneos

Pode rodar em vários devices ao mesmo tempo:

1. **Terminal 1:** `flutter run -d chrome`
2. **Terminal 2:** `flutter run -d macos`
3. **Neovim:** Use `<leader>Fd` para alternar contexto

Cada instância funciona independente!

---

## Troubleshooting

### Hot Reload não funciona

```vim
:FlutterRestart  " Ou <leader>FR
```

Se ainda não funcionar, reinicia completamente:
```vim
:FlutterQuit
:FlutterRun
```

### LSP não está funcionando

```vim
:LspInfo  " Vê se dartls está attached
```

Se não estiver:
```vim
:LspRestart
```

Ou fecha e reabre o arquivo:
```vim
:e!
```

### Comandos Flutter não aparecem

- Verifica se está em arquivo `.dart`
- Keybindings são específicos para buffers Dart
- Tenta `:FlutterRun` manualmente

### Device não aparece

No terminal:
```bash
flutter devices  # Lista devices disponíveis
```

Se lista vazia:
- **Chrome:** Instale Google Chrome
- **Android:** Inicie emulador ou conecte device físico
- **macOS:** Já está disponível
- **iOS:** Requer Xcode + Simulator

### Hot Reload muda algo inesperado

Alguns tipos de mudança **não funcionam** com hot reload:

❌ Mudanças no `main()` ou inicialização  
❌ Mudanças em variáveis globais `const`  
❌ Mudanças em native code (Android/iOS)  

**Solução:** Use Hot Restart (`<leader>FR`)

### Erro "Waiting for connection from debug service"

1. Para tudo: `:FlutterQuit`
2. Limpa: `flutter clean` no terminal
3. Reinicia: `:FlutterRun`

---

## Atalhos do Projeto

### AstroNvim Defaults

| Tecla | Ação |
|-------|------|
| `<leader>fr` | Find Registers (seu mapping customizado) |
| `<leader>bd` | Close Buffer |
| `<leader>nt` | Toggle Neotree |
| `<leader>cs` | Clear Search |

**Flutter usa `<leader>F` (maiúsculo) para evitar conflito!**

---

## Recursos Externos

- **flutter-tools.nvim:** https://github.com/akinsho/flutter-tools.nvim
- **Flutter Docs:** https://docs.flutter.dev
- **Dart Language Server:** https://github.com/dart-lang/sdk/tree/main/pkg/analysis_server
- **AstroNvim:** https://docs.astronvim.com

---

## Quick Reference

```vim
" Iniciar
:FlutterRun

" Hot Reload
<leader>Fl

" Hot Restart
<leader>FR

" Code Actions (wrap, extract, etc)
<leader>la

" Rename
<leader>lr

" Parar
<leader>Fq
```

Bom desenvolvimento! 🚀🎯
