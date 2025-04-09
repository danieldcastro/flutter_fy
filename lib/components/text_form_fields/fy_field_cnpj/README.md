# 🏣 FyFieldCnpj - Campo de CNPJ

## 📖 Descrição

O **FyFieldCnpj** é um campo de formulário especializado para entrada e validação de CNPJ (Cadastro Nacional da Pessoa Jurídica).  
Utiliza uma máscara com o padrão `##.###.###/####-##` para formatar a entrada e valida o valor através dos métodos definidos em `FyValidationTypes.cnpj`.

## ✨ Recursos

- **Formatação automática:** Aplica máscara para CNPJ conforme o padrão brasileiro.
- **Validação integrada:** Utiliza validadores específicos para CNPJ.
- **Integração simples:** Basta passar uma configuração de _text field_ para utilizar o campo.

## 🚀 Como Usar

```dart
FyFieldCnpj(
  config: myTextFormFieldConfig,
);
```

## ⚙️ Parâmetros

| Parâmetro | Tipo                  | Descrição                                                                                                                                                |
| --------- | --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`  | `TextFormFieldConfig` | Define as propriedades do campo.  Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |

## 🔧 Configurações

| Parâmetro         | Tipo                       | Descrição                                              |
| ----------------- | -------------------------- | ------------------------------------------------------ |
| `keyboardType`    | `TextInputType.number`     | Define o tipo do teclado para entrada numérica.        |
| `maxLength`       | `int`                      | Define o número máximo de caracteres (18 com máscara). |
| `inputFormatters` | `List<TextInputFormatter>` | Aplica a máscara `##.###.###/####-##` na entrada.      |
| `validators`      | `ValidatorsCallBack`       | Valida a entrada utilizando `FyValidationTypes.cnpj`.  |

## 📌 Considerações Finais

O **FyFieldCnpj** é ideal para formulários empresariais e garante a entrada correta do CNPJ.  
Caso utilize este componente, fique à vontade para enviar sugestões e contribuir com melhorias!
