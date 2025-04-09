# 📌 FySideSheet - Componente Flutter

## 📖 Descrição

O **FySideSheet** é um componente que exibe um modal deslizante (side sheet) a partir da lateral esquerda ou direita da tela, conforme a configuração definida. Esse widget utiliza o método `showGeneralDialog` para criar uma transição animada, possibilitando que a folha deslize para dentro da tela com uma animação suave. Além disso, permite personalizar diversos aspectos visuais e comportamentais, tais como bordas, cores e a largura do modal.

## ✨ Recursos

- **Modal deslizante:** Exibe um side sheet animado que pode surgir pela esquerda ou pela direita.
- **Personalização completa:** Permite configurar rótulo de barreira, se a folha pode ser descartada com um clique externo, cor e duração da transição, além de outras propriedades visuais.
- **Flexibilidade:** Aceita qualquer widget como conteúdo, possibilitando a exibição de formulários, menus ou conteúdos informativos.
- **Borda ajustável:** O modal pode ter as bordas arredondadas apenas do lado onde ele não está sendo exibido, dando um acabamento visual diferenciado.

## 🚀 Como Usar

### 📌 Exemplo: Side Sheet à Esquerda

```dart
import 'package:flutter/material.dart';
import 'fy_side_sheet.dart';         // ajuste o path conforme a organização dos seus arquivos
import 'fy_side_sheet_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo FySideSheet - Esquerda',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Side Sheet à Esquerda'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Abrir Side Sheet'),
            onPressed: () {
              FySideSheet.left(
                context: context,
                body: Container(
                  padding: const EdgeInsets.all(16),
                  child: const Text("Conteúdo do Side Sheet!"),
                ),
                config: const FySideSheetConfig(
                  sheetBorderRadius: 16,
                  sheetColor: Colors.white,
                  width: 300,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### 📌 Exemplo: Side Sheet à Direita

```dart
import 'package:flutter/material.dart';
import 'fy_side_sheet.dart';         // ajuste o path conforme necessário
import 'fy_side_sheet_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo FySideSheet - Direita',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Side Sheet à Direita'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Abrir Side Sheet'),
            onPressed: () {
              FySideSheet.right(
                context: context,
                body: Container(
                  padding: const EdgeInsets.all(16),
                  child: const Text("Conteúdo do Side Sheet!"),
                ),
                config: const FySideSheetConfig(
                  sheetBorderRadius: 16,
                  sheetColor: Colors.white,
                  width: 300,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

## 🔧 Parâmetros e Configurações

### FySideSheet

O **FySideSheet** não necessita de instância, pois seus métodos são estáticos. Ele disponibiliza dois métodos principais para abrir o modal:

| Método  | Parâmetros Principais       | Descrição                                   |
| ------- | --------------------------- | ------------------------------------------- |
| `left`  | `body`, `context`, `config` | Abre o side sheet no lado esquerdo da tela. |
| `right` | `body`, `context`, `config` | Abre o side sheet no lado direito da tela.  |

- **body:** Widget que representa o conteúdo a ser exibido no modal.
- **context:** Contexto do Flutter para exibição do modal.
- **config:** Instância de **FySideSheetConfig** que permite personalizar o comportamento e a aparência do side sheet.

### FySideSheetConfig

A classe **FySideSheetConfig** possibilita customizar os principais aspectos visuais e comportamentais do modal:

| Parâmetro            | Tipo       | Descrição                                                                         |
| -------------------- | ---------- | --------------------------------------------------------------------------------- |
| `barrierLabel`       | `String`   | Rótulo utilizado para a barreira do modal (default: `"Side Sheet"`).              |
| `barrierDismissible` | `bool`     | Define se o modal pode ser fechado ao tocar fora dele (default: `true`).          |
| `barrierColor`       | `Color`    | Cor da barreira que obscurece o conteúdo de fundo (default: `Color(0x66000000)`). |
| `sheetBorderRadius`  | `double`   | Raio de arredondamento da borda do modal (default: `0`).                          |
| `sheetColor`         | `Color`    | Cor de fundo do modal (default: `Colors.white`).                                  |
| `transitionDuration` | `Duration` | Duração da animação de transição do modal (default: `300ms`).                     |
| `width`              | `double?`  | Largura do modal; se não definido, utiliza uma fração do tamanho da tela.         |

## 📌 Considerações Finais

O **FySideSheet** é uma ferramenta versátil para exibição de conteúdos modais em aplicativos Flutter, permitindo uma experiência de usuário mais dinâmica e visualmente agradável. Com sua personalização via **FySideSheetConfig**, você pode adaptar facilmente o componente à identidade e aos requisitos de sua aplicação. Se este componente foi útil para você, compartilhe feedbacks e sugestões, e não esqueça de dar uma ⭐ no repositório! 😊
