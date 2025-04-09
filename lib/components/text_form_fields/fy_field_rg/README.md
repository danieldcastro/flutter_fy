# 🪪 FyFieldRg - Campo de RG

## 📖 Descrição

O **FyFieldRg** é um campo de texto específico para entrada do número de RG (Registro Geral), com validações e restrições adequadas ao formato brasileiro.

## ✨ Recursos

- Permite somente caracteres alfanuméricos e espaços.
- Limite máximo de 25 caracteres.
- Validação personalizada para RG.

## 🚀 Como Usar

```dart
FyFieldRg(myTextFormFieldConfig);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                               |
| --------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |

## 🔧 Configurações

| Parâmetro         | Tipo                              | Descrição                                          |
| ----------------- | --------------------------------- | -------------------------------------------------- |
| `keyboardType`    | `TextInputType.number`            | Teclado numérico para facilitar a digitação do RG. |
| `maxLength`       | `int`                             | Limite de 25 caracteres.                           |
| `inputFormatters` | `List<TextInputFormatter>`        | Permite apenas caracteres alfanuméricos e espaços. |
| `validators`      | `List<String? Function(String?)>` | Validação personalizada para o número de RG.       |

## 📌 Considerações Finais

Esse campo é ideal para formulários que exijam a entrada do RG, com validação e restrição de caracteres apropriadas para documentos oficiais.