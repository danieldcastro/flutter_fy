# ⚙️ TextFormFieldSetup

## 📖 Descrição

Classe que define configurações visuais e comportamentais globais para o componente `TextFormFieldBase` e seus derivados.  
Pode ser usada para personalizar temas específicos de campos de texto em diferentes contextos da aplicação.



## ✨ Recursos

`TextFormFieldSetup` encapsula configurações visuais (estilos, cores, preenchimento) e comportamentais (validações, mensagens de ajuda) aplicadas a um campo de formulário.

É frequentemente utilizada em conjunto com `TextFormFieldConfig` para definir como os campos devem se comportar visual e funcionalmente.



## 🔧 Configurações

| Parâmetro            | Tipo                                                  | Descrição                                                                     |
| -------------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------- |
| `titleStyle`         | `TextStyle`                                           | Estilo aplicado ao título do campo.                                           |
| `cursorTextStyle`    | `TextStyle`                                           | Estilo do texto digitado no campo.                                            |
| `validationMessages` | `FyValidationMessages`                                | Objeto com mensagens de validação personalizadas.                             |
| `helpTextSetup`      | `({Color iconColor, Result<String, IconData> icon})?` | Define o ícone e cor do botão de ajuda (exibido ao lado do título).           |
| `onValidationError`  | `ValueChanged<String>?`                               | Função chamada quando ocorre um erro de validação. Recebe a mensagem do erro. |
| `readOnlyTextColor`  | `Color`                                               | Cor aplicada ao texto do campo quando `readOnly` estiver ativado.             |
| `filled`             | `bool`                                                | Define se o campo terá preenchimento de fundo.                                |
| `enabledFillColor`   | `Color?`                                              | Cor de fundo quando o campo está habilitado e `filled = true`.                |
| `readOnlyFillColor`  | `Color?`                                              | Cor de fundo quando o campo está em modo somente leitura e `filled = true`.   |


## 🧪 Validação

- As mensagens de validação podem ser totalmente customizadas através de `FyValidationMessages`.
- O `onValidationError` permite ações adicionais quando a validação falhar (como scroll automático até o campo, log, etc).



## 💡 Ajuda Interativa

Se `helpTextSetup` for fornecido, um botão de ajuda será exibido ao lado do título do campo.  
Esse botão usará o ícone e a cor definidos e poderá abrir um modal explicativo sobre o campo.



## 🧪 Exemplo de uso

```dart
final setup = TextFormFieldSetup(
  titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  cursorTextStyle: TextStyle(color: Colors.black),
  validationMessages: FyValidationMessages.defaultMessages,
  helpTextSetup: (
    iconColor: Colors.blue,
    icon: Result.success(Icons.info_outline),
  ),
  readOnlyTextColor: Colors.grey,
  filled: true,
  enabledFillColor: Colors.white,
  readOnlyFillColor: Colors.grey.shade200,
);
```

Claro! Aqui vai a versão das **📝 Considerações finais** em parágrafo único, como nas anteriores:



### 📌 Considerações finais

A classe `TextFormFieldSetup` permite padronizar aspectos visuais e comportamentais dos campos de formulário, tornando mais simples aplicar temas e comportamentos consistentes em diferentes contextos da aplicação. Seu uso é recomendado em conjunto com `TextFormFieldConfig` para garantir flexibilidade e coesão na experiência do usuário.
