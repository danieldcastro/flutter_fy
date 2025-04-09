# 📌 FyToggleSlider - Componente Flutter 

## 📖 Descrição

O **FyToggleSlider** é um widget personalizável que funciona como um interruptor animado. Ele permite alternar entre dois estados com uma transição suave e pode exibir qualquer widget nos lados esquerdo e direito. Ideal para alternar entre opções como "Ligado/Desligado", "Sim/Não", entre outras.

## ✨ Recursos

- **Animação suave** ao alternar entre os estados.
- **Totalmente personalizável**, permitindo alterar cores, bordas e tamanhos.
- **Suporte a widgets personalizados** como rótulos, ícones ou imagens.
- **Interação via toque e arraste horizontal**.
- **Estado desativado** para impedir alterações.

## 🚀 Como Usar

### 📌 Exemplo Básico

```dart
FyToggleSlider(
  leftWidget: Icon(Icons.light_mode, color: Colors.black),
  rightWidget: Icon(Icons.dark_mode, color: Colors.black),
  onChanged: (value) => print('Novo estado: \$value'),
  value: true,
)
```

### 🎨 Exemplo Personalizado

```dart
FyToggleSlider(
  leftWidget: Text('Modo Claro', style: TextStyle(color: Colors.black)),
  rightWidget: Text('Modo Escuro', style: TextStyle(color: Colors.white)),
  onChanged: (value) => print('Selecionado: \$value'),
  value: false,
  backgroundBorderRadius: BorderRadius.circular(20),
  foregroundBorderRadius: BorderRadius.circular(20),
  foregroundColor: Colors.deepPurple,
)
```

### 🔒 Exemplo desativado

```dart
FyToggleSlider(
  leftWidget: Icon(Icons.light_mode, color: Colors.black),
  rightWidget: Icon(Icons.dark_mode, color: Colors.black),
  onChanged: null,
  value: true,
)
```

## 🔧 Parâmetros

| Parâmetro                | Tipo                  | Descrição                                               |
| ------------------------ | --------------------- | ------------------------------------------------------- |
| `onChanged`              | `ValueChanged<bool>?` | Função chamada ao alternar o estado.                    |
| `value`                  | `bool`                | Estado atual do switch.                                 |
| `leftWidget`             | `Widget`              | Widget exibido no lado esquerdo.                        |
| `rightWidget`            | `Widget`              | Widget exibido no lado direito.                         |
| `height`                 | `double`              | Altura do switch (padrão: `40`).                        |
| `backgroundBorderRadius` | `BorderRadius?`       | Borda do fundo.                                         |
| `backgroundBorder`       | `BoxBorder?`          | Borda do fundo.                                         |
| `foregroundBorderRadius` | `BorderRadius?`       | Borda do indicador animado.                             |
| `foregroundBorder`       | `BoxBorder?`          | Borda do indicador animado.                             |
| `backgroundColor`        | `Color`               | Cor do fundo (padrão: `Colors.white`).                  |
| `foregroundColor`        | `Color`               | Cor do indicador animado (padrão: `Colors.blueAccent`). |
| `disabledColor`          | `Color`               | Cor quando desativado (padrão: `Colors.grey`).          |

## 📌 Considerações Finais

Se você gostou deste componente, dê uma ⭐ no repositório e compartilhe suas sugestões ou melhorias! 😊



