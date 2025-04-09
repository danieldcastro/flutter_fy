# 📝 FyFieldText - Campo de Texto Genérico

## 📖 Descrição

O **FyFieldText** é um campo de texto genérico ideal para inserção de conteúdos livres, como descrições, comentários ou observações. Ele aplica capitalização de frases automaticamente e validações configuráveis.

## ✨ Recursos

- Aceita qualquer tipo de texto.
- Capitaliza automaticamente a primeira letra de cada frase.
- Suporte a validações personalizadas.
- Aceita limite máximo de caracteres (`maxLength`).

## 🚀 Como Usar

```dart
FyFieldText(
  myTextFormFieldConfig,
  maxLength: 200,
);
```

## ⚙️ Parâmetros

| Parâmetro   | Tipo                  | Descrição                                                                                                                                               |
| ----------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`    | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `maxLength` | `int?`                | Define o número máximo de caracteres permitidos no campo. (Opcional)                                                                                    |

## 🔧 Configurações

| Parâmetro            | Tipo                              | Descrição                                                  |
| -------------------- | --------------------------------- | ---------------------------------------------------------- |
| `keyboardType`       | `TextInputType.text`              | Usa o teclado padrão para digitação de textos.             |
| `textCapitalization` | `TextCapitalization.sentences`    | Capitaliza automaticamente o início de frases.             |
| `validators`         | `List<String? Function(String?)>` | Executa as validações solicitadas via `requestValidators`. |

## 📌 Considerações Finais

Esse campo é útil para qualquer tipo de entrada textual genérica, oferecendo uma experiência de digitação otimizada e personalizável conforme as regras de negócio.