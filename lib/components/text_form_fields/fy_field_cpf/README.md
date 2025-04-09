# 👤 FyFieldCpf - Campo de CPF

## 📖 Descrição

O **FyFieldCpf** é um campo de formulário especializado para entrada e validação de CPF (Cadastro de Pessoa Física).  
Utiliza uma máscara com o padrão `###.###.###-##` para formatar a entrada e valida o valor através dos métodos definidos em `FyValidationTypes.cpf`.

## ✨ Recursos

- **Formatação automática:** Aplica máscara para CPF conforme o padrão brasileiro.
- **Validação integrada:** Utiliza validadores específicos para CPF.
- **Integração simples:** Basta passar uma configuração de _text field_ para utilizar o campo.

## 🚀 Como Usar

```dart
FyFieldCpf(
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
| `maxLength`       | `int`                      | Define o número máximo de caracteres (14 com máscara). |
| `inputFormatters` | `List<TextInputFormatter>` | Aplica a máscara `###.###.###-##` na entrada.          |
| `validators`      | `ValidatorsCallBack`       | Valida a entrada utilizando `FyValidationTypes.cpf`.   |

## 📌 Considerações Finais

O **FyFieldCpf** garante a formatação e validação correta do CPF, facilitando a criação de formulários robustos e confiáveis.  
Se tiver sugestões ou encontrar melhorias, colabore com o projeto!
