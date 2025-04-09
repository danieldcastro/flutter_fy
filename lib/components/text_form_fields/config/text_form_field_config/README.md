# ⚙️ TextFormFieldConfig

## 📖 Descrição

O `TextFormFieldConfig` é uma classe de configuração que centraliza e padroniza os parâmetros para os campos de texto do pacote **FlutterFy**. Ele permite definir comportamentos e estilos dos `TextFormFields` de maneira consistente e reutilizável.

## ✨ Recursos

- Controle centralizado de parâmetros como `controller`, `validators`, `hintText`, entre outros.
- Suporte a estados como `loading`, `readOnly`, `enabled`, etc.
- Permite definir validações, estilos, ações e comportamento do campo de texto.
- Suporte a `helpText` com título e descrição.

## 🚀 Como Usar

```dart
final config = TextFormFieldConfig(
  textFormFieldSetup: mySetup,
  hintText: 'Digite seu nome',
  title: 'Nome Completo',
  controller: myController,
);
```

## 🔧 Configurações

| Parâmetro            | Tipo                                                                                      | Descrição                                                 |
| -------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| `textFormFieldSetup` | `TextFormFieldSetup`                                                                      | Configuração de estilo e comportamento base para o campo. |
| `hintText`           | `String?`                                                                                 | Texto de dica que aparece quando o campo está vazio.      |
| `title`              | `String?`                                                                                 | Título do campo, exibido acima do `TextFormField`.        |
| `initialValue`       | `String?`                                                                                 | Valor inicial do campo (caso não use `controller`).       |
| `onChanged`          | `ValueChanged<String>?`                                                                   | Callback disparado ao alterar o valor do campo.           |
| `onFieldSubmitted`   | `ValueChanged<String>?`                                                                   | Callback disparado ao submeter o campo.                   |
| `onSaved`            | `ValueChanged<String?>?`                                                                  | Callback chamado ao salvar o campo em um `Form`.          |
| `onEditingComplete`  | `VoidCallback?`                                                                           | Callback chamado ao finalizar a edição.                   |
| `requestValidators`  | `List<String? Function(String?)>?`                                                        | Lista de validadores personalizados.                      |
| `controller`         | `TextEditingController?`                                                                  | Controlador do campo de texto.                            |
| `isEnabled`          | `bool?`                                                                                   | Define se o campo está habilitado.                        |
| `isLoading`          | `bool?`                                                                                   | Notificador de estado de carregamento.                    |
| `onFocusChanged`     | `ValueChanged<bool>?`                                                                     | Callback para mudança de foco.                            |
| `helpTextConfigs`    | `({String title, String description, TextStyle titleStyle, TextStyle descriptionStyle})?` | Configurações para exibição de texto de ajuda.            |
| `obscureText`        | `bool` *(default: false)*                                                                 | Oculta o conteúdo do campo (ex: para senhas).             |
| `obscuringCharacter` | `String` *(default: '•')*                                                                 | Caractere usado quando `obscureText` está ativado.        |
| `needsFocus`         | `bool` *(default: false)*                                                                 | Define se o campo deve solicitar foco automaticamente.    |
| `textInputAction`    | `TextInputAction?` *(default: TextInputAction.done)*                                      | Ação de teclado (ex: `next`, `done`).                     |
| `isReadOnly`         | `bool` *(default: false)*                                                                 | Define se o campo é somente leitura.                      |
| `isRequired`         | `bool` *(default: true)*                                                                  | Adiciona validador `isNotEmpty` automaticamente.          |

## 🧪 Exemplo de uso com componente FyField

```dart
FyFieldText(
  TextFormFieldConfig(
    textFormFieldSetup: mySetup,
    title: 'Nome',
    hintText: 'Digite seu nome completo',
    controller: myController,
  ),
)
```

## 📌 Considerações Finais

Use o `TextFormFieldConfig` para garantir consistência e flexibilidade em todos os seus campos de texto. Ele centraliza a configuração, facilita manutenção e evita duplicações.