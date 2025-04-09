# ✉️ FyFieldEmail - Campo de E-mail

## 📖 Descrição

O **FyFieldEmail** é um campo de formulário especializado para entrada e validação de endereços de e-mail.  
Ele aplica uma formatação simples que impede espaços e valida a estrutura do e-mail conforme os padrões comuns.

## ✨ Recursos

- **Formatação automática:** Impede a digitação de espaços.
- **Validação integrada:** Verifica se o e-mail está em um formato válido.
- **Integração simples:** Basta passar uma configuração de _text field_ para utilizar o campo.

## 🚀 Como Usar

```dart
FyFieldEmail(
  myTextFormFieldConfig,
);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                               |
| --------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |

## 🔧 Configurações

| Parâmetro         | Tipo                         | Descrição                                              |
| ----------------- | ---------------------------- | ------------------------------------------------------ |
| `keyboardType`    | `TextInputType.emailAddress` | Define o tipo do teclado para entrada de e-mail.       |
| `inputFormatters` | `List<TextInputFormatter>`   | Impede a digitação de espaços em branco.               |
| `validators`      | `ValidatorsCallBack`         | Valida a entrada utilizando `FyValidationTypes.email`. |

## 📌 Considerações Finais

O **FyFieldEmail** garante uma entrada consistente e válida de endereços de e-mail, otimizando a experiência do usuário em formulários. Feedbacks e sugestões são sempre bem-vindos!