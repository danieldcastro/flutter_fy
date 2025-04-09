# 🔢 FyFieldNumber - Campo de Número

## 📖 Descrição

O **FyFieldNumber** é um campo de texto personalizado para entrada exclusivamente numérica.  
Ele remove espaços e aceita apenas dígitos, sendo ideal para valores inteiros como quantidade, idade ou número de documentos sem formatação.

## ✨ Recursos

- **Restrição a números:** Permite somente entrada numérica (sem espaços).
- **Validação personalizada:** Compatível com qualquer lista de validadores fornecida.
- **Suporte a ícone/sufixo personalizado:** Ícone final opcional com largura adaptativa.

## 🚀 Como Usar

```dart
FyFieldNumber(
  myTextFormFieldConfig,
  suffix: Icon(Icons.numbers),
);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                               |
| --------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define o comportamento do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `suffix`  | `Widget?`             | Um widget opcional para exibir como sufixo (ex: ícone, texto, etc.).                                                                                    |

## 🔧 Configurações

| Parâmetro            | Tipo                       | Descrição                                                   |
| -------------------- | -------------------------- | ----------------------------------------------------------- |
| `keyboardType`       | `TextInputType.number`     | Mostra um teclado numérico ao usuário.                      |
| `inputFormatters`    | `List<TextInputFormatter>` | Remove espaços e restringe entrada apenas a dígitos.        |
| `validators`         | `ValidatorsCallBack`       | Usa os validadores definidos no `config`.                   |
| `suffixIcon`         | `Widget?`                  | Ícone ou elemento exibido no final do campo.                |
| `suffixIconMaxWidth` | `double`                   | Largura máxima do sufixo, proporcional ao tamanho do campo. |

## 📌 Considerações Finais

O **FyFieldNumber** oferece uma experiência simples e segura para entrada de números, com flexibilidade para personalização visual. Ideal para campos como quantidade, códigos numéricos e mais.