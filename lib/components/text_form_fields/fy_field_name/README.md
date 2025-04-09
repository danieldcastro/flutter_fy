# 🙋 FyFieldName - Campo de Nome

## 📖 Descrição

O **FyFieldName** é um campo de formulário customizado para entrada de nomes próprios.  
Ele permite apenas letras (com ou sem acentos) e espaços, além de aplicar capitalização automática por palavra.

## ✨ Recursos

- **Formatação automática:** Permite apenas caracteres válidos para nomes.
- **Capitalização automática:** Coloca a primeira letra de cada palavra em maiúsculo.
- **Validação flexível:** Usa validadores personalizados conforme necessário.

## 🚀 Como Usar

```dart
FyFieldName(
  myTextFormFieldConfig,
);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                               |
| --------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |

## 🔧 Configurações

| Parâmetro            | Tipo                       | Descrição                                                      |
| -------------------- | -------------------------- | -------------------------------------------------------------- |
| `keyboardType`       | `TextInputType.name`       | Define o tipo do teclado apropriado para nomes.                |
| `inputFormatters`    | `List<TextInputFormatter>` | Permite apenas letras (com acentos) e espaços.                 |
| `textCapitalization` | `TextCapitalization.words` | Capitaliza automaticamente a primeira letra de cada palavra.   |
| `validators`         | `ValidatorsCallBack`       | Valida a entrada com os validadores personalizados fornecidos. |

## 📌 Considerações Finais

O **FyFieldName** melhora a experiência do usuário ao lidar com entradas de nomes, garantindo consistência e validação adequada. Feedbacks e sugestões são sempre bem-vindos!