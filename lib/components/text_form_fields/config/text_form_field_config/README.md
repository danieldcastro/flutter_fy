Claro! Aqui está a documentação formatada para o `FyTextFormFieldConfig`, sem utilizar `---` como separador:

---

# ⚙️ FyTextFormFieldConfig

## 📖 Descrição

O `FyTextFormFieldConfig` é uma classe que centraliza a configuração dos campos de texto do pacote **FlutterFy**, permitindo reutilização de lógica, personalização e consistência visual e funcional entre os campos.

## ✨ Recursos

- Controle centralizado dos parâmetros do campo de texto
- Suporte a estados (`loading`, `readOnly`, `enabled`, etc.)
- Permite definições de comportamento como foco automático, validações, ações e estilos
- Suporte a textos de ajuda (`helpText`) com título e descrição estilizados

## 🚀 Como Usar

```dart
final config = FyTextFormFieldConfig(
  fyTextFormFieldSetup: mySetup,
  hintText: 'Digite seu nome',
  title: 'Nome Completo',
  controller: myController,
);
```

## 🔧 Configurações

| Parâmetro              | Tipo                                                                                      | Descrição                                                             |
| ---------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `fyTextFormFieldSetup` | `FyTextFormFieldSetup`                                                                    | Configuração base de estilo e comportamento do campo.                 |
| `hintText`             | `String?`                                                                                 | Texto de dica exibido quando o campo está vazio.                      |
| `title`                | `String?`                                                                                 | Título do campo.                                                      |
| `initialValue`         | `String?`                                                                                 | Valor inicial do campo (caso não use `controller`).                   |
| `onChanged`            | `ValueChanged<String>?`                                                                   | Função chamada quando o valor do campo é alterado.                    |
| `onFieldSubmitted`     | `ValueChanged<String>?`                                                                   | Função chamada ao submeter o campo.                                   |
| `onSaved`              | `ValueChanged<String?>?`                                                                  | Função chamada ao salvar o campo (em um `Form`).                      |
| `onEditingComplete`    | `VoidCallback?`                                                                           | Função chamada ao concluir a edição.                                  |
| `requestValidators`    | `List<String? Function(String?)>?`                                                        | Lista de validadores personalizados.                                  |
| `controller`           | `TextEditingController?`                                                                  | Controlador do valor do campo.                                        |
| `isEnabled`            | `bool?`                                                                                   | Define se o campo está habilitado.                                    |
| `isLoading`            | `bool?`                                                                                   | Define se o campo está em estado de carregamento.                     |
| `onFocusChanged`       | `ValueChanged<bool>?`                                                                     | Callback para mudanças no foco do campo.                              |
| `helpTextConfigs`      | `({String title, String description, TextStyle titleStyle, TextStyle descriptionStyle})?` | Define o conteúdo e estilo do texto de ajuda do campo.                |
| `obscureText`          | `bool` *(default: false)*                                                                 | Se `true`, oculta o conteúdo do campo (ex: para senhas).              |
| `obscuringCharacter`   | `String` *(default: '•')*                                                                 | Caractere utilizado quando `obscureText` está ativado.                |
| `needsFocus`           | `bool` *(default: false)*                                                                 | Define se o campo deve solicitar foco automaticamente ao ser exibido. |
| `textInputAction`      | `TextInputAction?` *(default: TextInputAction.done)*                                      | Ação do botão "enter" no teclado virtual.                             |
| `isReadOnly`           | `bool` *(default: false)*                                                                 | Se `true`, o campo é apenas leitura.                                  |
| `isRequired`           | `bool` *(default: true)*                                                                  | Se `true`, adiciona automaticamente o validador `isNotEmpty()`.       |
| `suffixIcon`           | `Widget?`                                                                                 | Ícone exibido ao final do campo.                                      |
| `suffixIconMaxWidth`   | `double` *(default: 60)*                                                                  | Largura máxima do ícone à direita.                                    |
| `prefixIcon`           | `Widget?`                                                                                 | Ícone exibido no início do campo.                                     |
| `prefixIconMaxWidth`   | `double` *(default: 60)*                                                                  | Largura máxima do ícone à esquerda.                                   |
| `prefix`               | `Widget?`                                                                                 | Widget que aparece antes do conteúdo do campo (ex: um texto fixo).    |

## 🧪 Exemplo de uso com componente FyField

```dart
FyFieldText(
  FyTextFormFieldConfig(
    fyTextFormFieldSetup: mySetup,
    title: 'Nome',
    hintText: 'Digite seu nome completo',
    controller: myController,
  ),
)
```

## 📌 Considerações Finais

Utilize o `FyTextFormFieldConfig` para criar campos de texto padronizados, limpos e de fácil manutenção. Centralizar essas configurações reduz duplicações, facilita testes e garante consistência em toda a aplicação.

Se quiser, posso gerar isso como um README pronto para colar na pasta do componente também.