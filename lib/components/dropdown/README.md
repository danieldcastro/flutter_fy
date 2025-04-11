# 📌 FyDropdown - Componente Flutter

## 📖 Descrição

O **FyDropdown** é um widget de _dropdown_ altamente customizável destinado a facilitar a seleção de um item em uma lista. Ele integra recursos de validação, formatação personalizada e configurações de estilo que garantem uma experiência consistente, seja em modo de seleção normal ou desabilitado. Esse componente é pensado para ser flexível e atender a diferentes necessidades de exibição e interação, podendo ser configurado através dos parâmetros de **FyDropdownConfig** e **FyDropdownSetup**.

## ✨ Recursos

- **Validação integrada:** Permite configurar campos obrigatórios e exibe mensagens de erro personalizadas quando necessário.
- **Formatação customizada:** Possui suporte à formatação personalizada dos itens, utilizando callbacks para conversão de objetos para `String` ou `Widget`.
- **Aparência customizável:** Permite configurar cores, estilos de texto, ícones e decorações, inclusive para estados desativados.
- **Gestão de foco:** O widget utiliza um `FocusNode` para gerenciar o foco e validar a seleção quando o usuário sai do campo.
- **Leve interação via toque:** Controlado por um `DropdownButtonFormField` que responde de maneira intuitiva a interações do usuário.

## 🚀 Como Usar

### 📌 Exemplo Básico

```dart
// Importações necessárias
import 'package:flutter/material.dart';
import 'path/para/fy_dropdown.dart'; // ajuste o path conforme seu projeto
import 'path/para/dropdown_config.dart';
import 'path/para/dropdown_setup.dart';
import 'path/para/fy_validation_messages.dart';

final fyDropdownSetup = FyDropdownSetup(
  disabledColor: Colors.grey,
  disabledTextColor: Colors.white,
  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  valueTextStyle: TextStyle(fontSize: 14, color: Colors.black),
  validationMessages: FyValidationMessages(requiredField: 'Este campo é obrigatório'),
  dropDownIconConfigs: (
    icon: Icons.arrow_drop_down,
    iconColor: Colors.black,
    disabledIconColor: Colors.grey,
  ),
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
  ),
);

final fyDropdownConfig = FyDropdownConfig<String>(
  fyDropdownSetup: fyDropdownSetup,
  hintText: 'Selecione uma opção',
  title: 'Opção',
  isRequired: true,
  isReadOnly: false,
  initialValue: null,
);

List<String> opcoes = ['Opção 1', 'Opção 2', 'Opção 3'];

class ExemploDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo FyDropdown')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FyDropdown<String>(
          values: opcoes,
          config: fyDropdownConfig,
        ),
      ),
    );
  }
}
```

### 🎨 Exemplo com Formatação Personalizada de String

```dart
final fyDropdownConfigCustom = FyDropdownConfig<int>(
  fyDropdownSetup: fyDropdownSetup,
  title: 'Selecione um número',
  isRequired: true,
  customItemText: (value) => "Número $value",
);

List<int> numeros = [1, 2, 3, 4, 5];

class ExemploDropdownCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FyDropdown<int>(
        values: numeros,
        config: fyDropdownConfigCustom,
      ),
    );
  }
}
```

### 🎨 Exemplo com Formatação Personalizada de Widget

```dart
final fyDropdownConfigCustom = FyDropdownConfig<int>(
  fyDropdownSetup: fyDropdownSetup,
  title: 'Selecione um número',
  isRequired: true,
  customItemWidget: (value) => Container(
    padding: EdgeInsets.all(8),
    child: Text(
      "Número $value",
      style: TextStyle(fontSize: 16, color: Colors.blue),
    ),
  ),
);

List<int> numeros = [1, 2, 3, 4, 5];

class ExemploDropdownCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FyDropdown<int>(
        values: numeros,
        config: fyDropdownConfigCustom,
      ),
    );
  }
}
```

### 🔒 Exemplo em Modo Somente Leitura

```dart
final fyDropdownConfigReadOnly = FyDropdownConfig<String>(
  fyDropdownSetup: fyDropdownSetup,
  title: 'Selecione uma opção (read-only)',
  isRequired: true,
  isReadOnly: true,
  initialValue: 'Opção 1',
);

class ExemploDropdownReadOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FyDropdown<String>(
        values: ['Opção 1', 'Opção 2'],
        config: fyDropdownConfigReadOnly,
      ),
    );
  }
}
```

### 🧩 Exemplo com tipo Customizado: Country

```dart
// Definição do tipo Country
class Country {
  final String name;
  final String code;

  Country({required this.name, required this.code});
}
```

### Exemplo de Uso do FyDropdown com Country

```dart
import 'package:flutter/material.dart';
import 'fy_dropdown.dart';         // ajuste o path conforme seu projeto
import 'dropdown_config.dart';
import 'dropdown_setup.dart';
import 'fy_validation_messages.dart';
import 'country.dart';             // arquivo onde está definido o tipo Country

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Cria uma instância padrão do FyDropdownSetup
  final FyDropdownSetup fyDropdownSetup = FyDropdownSetup(
    disabledColor: Colors.grey,
    disabledTextColor: Colors.white,
    titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    valueTextStyle: TextStyle(fontSize: 14, color: Colors.black),
    validationMessages: FyValidationMessages(requiredField: 'Este campo é obrigatório'),
    dropDownIconConfigs: (
      icon: Icons.arrow_drop_down,
      iconColor: Colors.black,
      disabledIconColor: Colors.grey,
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
    ),
  );

  // Configuração do FyDropdownConfig para o tipo Country
  late final FyDropdownConfig<Country> fyDropdownConfig = FyDropdownConfig<Country>(
    fyDropdownSetup: fyDropdownSetup,
    hintText: 'Selecione um país',
    title: 'País',
    isRequired: true,
    // Formata a exibição do Country utilizando o nome e o código
    customItemText: (Country country) => "${country.name} (${country.code})",
  );

  // Lista de países a serem exibidos no dropdown
  final List<Country> countries = [
    Country(name: 'Brasil', code: 'BR'),
    Country(name: 'Estados Unidos', code: 'US'),
    Country(name: 'Canadá', code: 'CA'),
    Country(name: 'Alemanha', code: 'DE'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo FyDropdown com Modelo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo FyDropdown: Country'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FyDropdown<Country>(
            values: countries,
            config: fyDropdownConfig,
          ),
        ),
      ),
    );
  }
}
```

---

### Explicação do Exemplo

- **Definição do Tipo:**  
  O tipo `Country` possui duas propriedades: `name` e `code`. Esse tipo representa um país.

- **Configuração do Dropdown:**  
  Ao criar a configuração do dropdown (`FyDropdownConfig<Country>`), foi utilizado o parâmetro `customItemText` para formatar a apresentação do objeto `Country` na interface, retornando uma string que concatena o nome do país com seu código (por exemplo, "Brasil (BR)").

- **Lista de Valores:**  
  É definida uma lista de instâncias do tipo `Country` que serão exibidas no dropdown.

- **Uso do FyDropdown:**  
  O widget `FyDropdown<Country>` é utilizado com os parâmetros `values` e `config`, garantindo a seleção de um objeto do tipo `Country`.

Esse exemplo demonstra como integrar objetos personalizados em componentes de seleção no Flutter, mantendo a flexibilidade e a personalização oferecida pelo **FyDropdown**.

## 🔧 Parâmetros e Configurações

### FyDropdown

| Parâmetro | Tipo                | Descrição                                                                                       |
| --------- | ------------------- | ----------------------------------------------------------------------------------------------- |
| `config`  | `FyDropdownConfig<T>` | Configurações e customizações do dropdown (inclui estilos, validações, textos e comportamento). |
| `values`  | `List<T>`           | Lista de itens a serem exibidos no _dropdown_.                                                  |

> **Observação:** O widget gerencia o foco para exibir mensagens de erro, chamando o validador quando o campo perde o foco.

### FyDropdownConfig

| Parâmetro                | Tipo                        | Descrição                                                                                                 |
| ------------------------ | --------------------------- | --------------------------------------------------------------------------------------------------------- |
| `fyDropdownSetup`          | `FyDropdownSetup`             | Configuração visual e de comportamento do dropdown.                                                       |
| `hintText`               | `String?`                   | Texto de dica exibido quando nenhum item é selecionado.                                                   |
| `title`                  | `String?`                   | Título do campo exibido acima do dropdown.                                                                |
| `onChanged`              | `ValueChanged<T?>?`         | Callback disparado quando o item selecionado é alterado.                                                  |
| `initialValue`           | `T?`                        | Valor inicial a ser selecionado no _dropdown_.                                                            |
| `menuMaxHeight`          | `double?`                   | Altura máxima do menu aberto do dropdown.                                                                 |
| `mustSelectItemOnChange` | `bool`                      | Indica se um item deve ser selecionado sempre que ocorrer uma mudança.                                    |
| `customItemText`   | `String Function(T value)?` | Função para formatar a exibição dos itens em formato de String.        
| `customItemWidget`   | `Widget Function(T value)?` | Função para formatar a exibição dos itens em formato de Widget.                                                               |
| `isReadOnly`             | `bool`                      | Define se o _dropdown_ é somente leitura. (Padrão: `false`)                                               |
| `isRequired`             | `bool`                      | Define se o campo é obrigatório. Se `true`, será aplicada a validação de valor não nulo. (Padrão: `true`) |

> **Observação:** O parâmetro `customItemText` e `customItemWidget` são mutuamente exclusivos. Se ambos forem fornecidos, haverá um erro de compilação. Utilize apenas um deles para formatar a exibição dos itens no dropdown.


### FyDropdownSetup

| Parâmetro             | Tipo                                                            | Descrição                                                                                  |
| --------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `disabledColor`       | `Color`                                                         | Cor de fundo quando o dropdown está desativado.                                            |
| `disabledTextColor`   | `Color`                                                         | Cor do texto quando o dropdown está desativado.                                            |
| `titleStyle`          | `TextStyle`                                                     | Estilo do texto do título.                                                                 |
| `valueTextStyle`      | `TextStyle`                                                     | Estilo do texto dos itens selecionados e exibidos.                                         |
| `validationMessages`  | `FyValidationMessages`                                          | Mensagens de validação personalizadas.                                                     |
| `onValidationError`   | `ValueChanged<String>?`                                         | Callback para tratamento de erros de validação.                                            |
| `dropdownColor`       | `Color`                                                         | Cor de fundo do menu do dropdown (padrão: `Colors.white`).                                 |
| `dropDownIconConfigs` | `({ IconData icon, Color iconColor, Color disabledIconColor })` | Configurações dos ícones do dropdown, incluindo cores para os estados normal e desativado. |
| `decoration`          | `InputDecoration?`                                              | Decoração padrão do campo, possibilitando personalizações como borda e preenchimento.      |

## 📌 Considerações Finais

O **FyDropdown** é uma solução robusta e flexível para implementação de _dropdowns_ em aplicações Flutter. Se você utilizou este componente e achou útil, não deixe de dar uma ⭐ no repositório, enviar feedback e compartilhar melhorias! 😊
