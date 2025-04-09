# 📞 FyFieldPhoneOrCellphone - Campo de Telefone ou Celular

## 📖 Descrição

O **FyFieldPhoneOrCellphone** é um campo de entrada que permite a digitação de números de telefone fixo ou celular, com formatação automática e validação.

## ✨ Recursos

- Formatação automática para número de telefone ou celular.
- Validação customizável.
- Adaptação automática de máscara com base no tipo (`isCellphone`).

## 🚀 Como Usar

```dart
FyFieldPhoneOrCellphone(
  myTextFormFieldConfig,
  isCellphone: true,
);
```

## ⚙️ Parâmetros

| Parâmetro     | Tipo                  | Descrição                                                                                                                                               |
| ------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`      | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `isCellphone` | `bool`                | Define se o campo é para celular (`true`) ou telefone fixo (`false`).                                                                                   |

## 🔧 Configurações

| Parâmetro         | Tipo                              | Descrição                                                       |
| ----------------- | --------------------------------- | --------------------------------------------------------------- |
| `keyboardType`    | `TextInputType.number`            | Teclado numérico para facilitar a digitação.                    |
| `maxLength`       | `int`                             | Tamanho máximo permitido (15 para celular, 14 para telefone).   |
| `inputFormatters` | `List<TextInputFormatter>`        | Formatação automática do número (com máscara).                  |
| `validators`      | `List<String? Function(String?)>` | Valida se o número informado é válido para telefone ou celular. |

## 📌 Considerações Finais

Esse campo é útil em formulários que exigem flexibilidade para entrada de contato, adaptando-se automaticamente ao tipo de número. Ideal para formulários de cadastro de usuários ou perfis.