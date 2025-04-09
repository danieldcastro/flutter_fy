# 📌 FyLoadingRotatingDots - Componente Flutter

## 📖 Descrição

O **FyLoadingRotatingDots** é um widget de carregamento que exibe três pontos animados com movimentos de translação e escala. Essa animação cria um efeito dinâmico, simulando uma rotação ou um "pulsar" que pode ser utilizado para indicar que uma operação está em andamento. O componente é altamente customizável, permitindo ajustar o tamanho e a cor dos pontos, garantindo uma integração harmoniosa com a identidade visual da sua aplicação.

## ✨ Recursos

- **Animação contínua e suave:** A animação é controlada por um `AnimationController` que repete indefinidamente, proporcionando transições dinâmicas dos pontos.
- **Movimentos coordenados:** Utiliza transformações de translação e escala para dar um efeito visual interessante.
- **Customização simples:** Basta ajustar os parâmetros `size` e `color` para adaptar o widget ao design do seu app.
- **Integração facilitada:** Ideal para indicar carregamento em diversas partes da aplicação, como durante solicitações de rede ou processamento de dados.

## 🚀 Como Usar

### 📌 Exemplo Básico

```dart
import 'package:flutter/material.dart';
import 'fy_loading_rotating_dots.dart'; // Ajuste o path conforme sua organização de arquivos

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo FyLoadingRotatingDots',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loading Rotating Dots'),
        ),
        body: Center(
          child: FyLoadingRotatingDots(
            size: 50, // Tamanho total do widget
            color: Colors.blueAccent, // Cor dos pontos animados
          ),
        ),
      ),
    );
  }
}
```

## 🔧 Parâmetros

| Parâmetro | Tipo     | Descrição                                                               |
| --------- | -------- | ----------------------------------------------------------------------- |
| `size`    | `double` | Define o tamanho total do widget de loading. Valor padrão: `30`.        |
| `color`   | `Color`  | Cor utilizada para os pontos animados, determinando a aparência visual. |

> **Observação:**  
> O widget utiliza um `AnimationController` para criar animações contínuas. Os pontos são desenhados em um arquivo separado (`draw_dot.dart`), que faz parte da biblioteca, garantindo a modularização do código.

## 📌 Considerações Finais

O **FyLoadingRotatingDots** é uma solução prática e estilizada para indicar que uma operação está em andamento em sua aplicação Flutter. Se este componente ajudou a melhorar a experiência do usuário no seu projeto, sinta-se à vontade para compartilhar feedback, contribuir com melhorias e dar aquela ⭐ no repositório! 😊
