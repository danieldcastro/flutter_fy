# 📌 FyFieldCep - Campo de CEP

## 📖 Descrição

O **FyFieldCep** é um campo de formulário especializado para entrada e validação de CEP (Código de Endereçamento Postal brasileiro).  
Utiliza uma máscara com o padrão `##.###-###` para formatar a entrada e valida o valor através dos métodos definidos em `FyValidationTypes.cep`.

## ✨ Recursos

- **Formatação automática:** Aplica máscara para CEP conforme o padrão brasileiro.
- **Validação integrada:** Utiliza validadores específicos para CEP.
- **Integração simples:** Basta passar uma configuração de _text field_ para utilizar o campo.

## 🚀 Como Usar

```dart
FyFieldCep(
  config: myTextFormFieldConfig,
);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                               |
| --------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |

## 🔧 Configurações

| Parâmetro         | Tipo                       | Descrição                                            |
| ----------------- | -------------------------- | ---------------------------------------------------- |
| `keyboardType`    | `TextInputType.number`     | Define o tipo do teclado para entrada numérica.      |
| `inputFormatters` | `List<TextInputFormatter>` | Aplica a máscara `##.###-###` na entrada.            |
| `validators`      | `ValidatorsCallBack`       | Valida a entrada utilizando `FyValidationTypes.cep`. |

## 📌 Considerações Finais

O **FyFieldCep** facilita a entrada correta de CEPs em seus formulários. Caso utilize este componente, considere compartilhar feedbacks ou melhorias para futuros aprimoramentos!
