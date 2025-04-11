# 🔐 FyFieldPassword - Campo de Senha

## 📖 Descrição

O **FyFieldPassword** é um campo de formulário para entrada de senhas, com validações de segurança e suporte para validadores personalizados. Ele oferece uma interface moderna com ícone para alternar a visibilidade da senha.

## ✨ Recursos

- Validação completa de senha:
  - Tamanho mínimo configurável;
  - Verificação de espaços no início ou fim;
  - Regras de complexidade (letra maiúscula, minúscula, número e caractere especial).
- Suporte a validadores personalizados.
- Ícone de visibilidade integrado.
- Configuração centralizada via `FyTextFormFieldConfig`.

## 🚀 Como Usar

```dart
FyFieldPassword(
  myTextFormFieldConfig,
  minLength: 8,
  customValidators: [
    () => 'Senha não pode ser igual ao nome de usuário',
    () => myOtherCustomValidation(),
  ],
);
```

## ⚙️ Parâmetros

| Parâmetro          | Tipo                              | Descrição                                                                                                                                               |
| ------------------ | --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`           | `FyTextFormFieldConfig`           | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `minLength`        | `int`                             | Número mínimo de caracteres exigido para a senha.                                                                                                       |
| `customValidators` | `List<String? Function()>?`       | Lista de validadores adicionais personalizados (sem parâmetro). Executados após os validadores padrões.                                               |

## 🔧 Configurações Aplicadas Internamente

| Propriedade     | Valor                             | Descrição                                                                 |
| --------------- | --------------------------------- | ------------------------------------------------------------------------- |
| `keyboardType`  | `TextInputType.visiblePassword`   | Define o teclado padrão para entrada de senhas.                           |
| `validators`    | `ValidatorsCallBack`              | Lista de validações padrão e customizadas aplicadas ao campo.            |

### ✅ Validações Padrão

1. **Tamanho mínimo:** exige `minLength` caracteres.
2. **Espaços:** não permite espaços em branco no início ou fim.
3. **Complexidade:** se `customValidators` estiver vazio ou nulo, aplica:
   - Uma letra maiúscula;
   - Uma letra minúscula;
   - Um número;
   - Um caractere especial.
4. **Customizados:** se `customValidators` estiver preenchido, eles serão executados no lugar da validação de complexidade.

## 📌 Considerações Finais

O `FyFieldPassword` é ideal para formulários que exigem campos de senha seguros, personalizáveis e com uma boa experiência de uso. Com suporte a validações padrão e personalizadas, ele é flexível e preparado para aplicações exigentes.
