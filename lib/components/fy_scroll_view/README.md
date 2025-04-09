# 🧻 FyScrollView - Componente Flutter

## 📖 Descrição

O **FyScrollView** é um widget de rolagem personalizado que adapta seu comportamento conforme a plataforma (mobile ou desktop). Ele permite scroll suave com suporte a carregamento infinito e um callback especial para quando o usuário força o scroll para o topo. Ideal para listas e conteúdos longos com experiência consistente entre dispositivos.

## ✨ Recursos

- **Adaptação automática** ao ambiente mobile ou desktop (com `Scrollbar`).
- **Scroll controller personalizado ou interno**.
- **Callback de "scroll forçado para o topo"** (ideal para navegação).
- **Função de carregamento automático no fim da lista**.
- **Suporte a padding, reverse scroll e carregamento incremental**.

## 🚀 Como Usar

### 📌 Exemplo Básico

```dart
FyScrollView(
  child: Column(
    children: List.generate(30, (i) => Text('Item \$i')),
  ),
)
```

### 🔄 Com Scroll Reverso e Padding

```dart
FyScrollView(
  padding: EdgeInsets.all(16),
  reverse: true,
  child: Column(
    children: List.generate(20, (i) => Text('Mensagem \$i')),
  ),
)
```

### 🔃 Com carregamento infinito

```dart
FyScrollView(
  loadMoreFunction: () => fetchMoreData(),
  loadMore: (loading: false, hasMore: true),
  child: Column(
    children: List.generate(100, (i) => Text('Comentário \$i')),
  ),
)
```

### 🔝 Com ação de scroll forçado para o topo

```dart
FyScrollView(
  onForceScrollToTop: () => print("Scroll foi forçado para o topo"),
  child: Column(
    children: [...],
  ),
)
```

## 🔧 Parâmetros

| Parâmetro             | Tipo                                 | Descrição                                                                 |
|-----------------------|--------------------------------------|---------------------------------------------------------------------------|
| `child`               | `Widget`                             | Conteúdo a ser exibido no scroll.                                        |
| `padding`             | `EdgeInsetsGeometry?`                | Espaçamento interno do conteúdo.                                         |
| `onForceScrollToTop`  | `VoidCallback?`                      | Chamado quando o usuário tenta forçar o scroll para o topo.              |
| `loadMoreFunction`    | `VoidCallback?`                      | Função chamada quando o scroll atinge o final.                           |
| `loadMore`            | `({bool loading, bool hasMore})?`    | Controle do estado de carregamento incremental.                          |
| `scrollController`    | `ScrollController?`                  | ScrollController customizado, se necessário.                             |
| `reverse`             | `bool`                               | Inverte a direção do scroll (padrão: `false`).                           |

## 📌 Considerações Finais

O `FyScrollView` é ideal para interfaces responsivas com scroll suave e carregamento dinâmico. Se achou útil, ⭐ o projeto e compartilhe feedbacks para evolução contínua! 😉
