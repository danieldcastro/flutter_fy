# 🔐 FyFieldPassword - Campo de Senha

## 📖 Descrição

O **FyFieldPassword** é um campo de senha seguro e personalizável, com regras robustas de validação e opção de exibir ou ocultar o conteúdo digitado.

## ✨ Recursos

- Validação completa de senha (mínimo de caracteres, espaços e padrão de complexidade).
- Ícone para alternar entre mostrar e esconder senha.
- Configuração flexível através do `TextFormFieldConfig`.

## 🚀 Como Usar

```dart
FyFieldPassword(
  myTextFormFieldConfig,
  minLength: 8,
);
```

## ⚙️ Parâmetros

| Parâmetro   | Tipo                  | Descrição                                                                                                                                               |
| ----------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`    | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `minLength` | `int`                 | Número mínimo de caracteres exigido para a senha.                                                                                                       |

## 🔧 Configurações

| Parâmetro      | Tipo                              | Descrição                                                           |
| -------------- | --------------------------------- | ------------------------------------------------------------------- |
| `keyboardType` | `TextInputType.visiblePassword`   | Define o teclado apropriado para digitação de senhas.               |
| `obscureText`  | `bool`                            | Define se o texto deve ser ocultado ou exibido.                     |
| `suffixIcon`   | `Widget`                          | Ícone de visibilidade (olho) para alternar entre mostrar e ocultar. |
| `validators`   | `List<String? Function(String?)>` | Regras de validação específicas para senhas seguras.                |

### Regras de Validação Padrão:

- Mínimo de caracteres (`minLength`);
- Não permitir espaços no início ou no fim;
- Deve conter:
  - Pelo menos uma letra maiúscula;
  - Pelo menos uma letra minúscula;
  - Pelo menos um número;
  - Pelo menos um caractere especial.

## 📌 Considerações Finais

Esse campo é ideal para formulários de cadastro e login que exigem segurança. Ele combina boas práticas de UX com validações robustas para proteger os usuários.