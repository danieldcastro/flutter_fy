## 🧾 FyValidationMessages – Gerenciador Central de Mensagens de Validação

### 📖 Descrição

A classe `FyValidationMessages` é responsável por armazenar e fornecer mensagens de validação personalizadas para diversos tipos de entradas de dados. Ela facilita a **internacionalização**, **manutenção** e **padronização** das mensagens de erro exibidas em formulários e outras validações do app.

É especialmente útil quando se deseja personalizar mensagens em diferentes idiomas ou adaptar os textos conforme o contexto da aplicação.



### 📦 Enum: ValidationMessagesEnum

Enumeração que define as **chaves possíveis de validação** suportadas pelo app:

| Enum                            | Descrição                                  |
| ------------------------------ | ------------------------------------------ |
| `requiredField`                | Campo obrigatório.                         |
| `invalidEmail`                 | E-mail em formato inválido.                |
| `invalidPassword`              | Senha inválida.                            |
| `passwordTooShort`            | Senha muito curta.                         |
| `passwordStartEndsWithSpace`  | Senha começa ou termina com espaço.        |
| `invalidCurrency`              | Valor monetário inválido.                  |
| `invalidCpf`                   | CPF inválido.                              |
| `invalidCnpj`                  | CNPJ inválido.                             |
| `invalidNumber`                | Número inválido.                           |
| `invalidCep`                   | CEP inválido.                              |
| `invalidRg`                    | RG inválido.                               |
| `invalidDate`                  | Data inválida.                             |



### 🔧 Principais Métodos e Acessos

| Método / Acesso                         | Tipo de Retorno           | Descrição                                                                 |
| -------------------------------------- | -------------------------- | ------------------------------------------------------------------------- |
| `requiredField`                        | `String?`                  | Retorna a mensagem para campo obrigatório.                                |
| `invalidEmail`                         | `String?`                  | Retorna a mensagem para e-mail inválido.                                  |
| `invalidPassword`, `passwordTooShort`, `invalidCurrency` etc. | `String?` | Retorna mensagens específicas para os erros listados no enum.            |
| `getMessage(key)`                      | `String?`                  | Retorna a mensagem de acordo com a chave `ValidationMessagesEnum`.       |
| `operator [](key)`                     | `String?`                  | Acesso direto como `fyMessages[ValidationMessagesEnum.invalidCpf]`.      |
| `copyWith(newMessages)`               | `FyValidationMessages`     | Retorna uma nova instância mesclando novas mensagens às existentes.      |


### 🧪 Exemplo de Uso

```dart
final validationMessages = FyValidationMessages(
  messages: {
    ValidationMessagesEnum.requiredField: 'Este campo é obrigatório.',
    ValidationMessagesEnum.invalidEmail: 'Informe um e-mail válido.',
    ValidationMessagesEnum.invalidCpf: 'CPF inválido.',
  },
);

// Acesso por getter
print(validationMessages.invalidCpf); // CPF inválido.

// Acesso genérico
print(validationMessages.getMessage(ValidationMessagesEnum.invalidEmail));

// Acesso por operador []
print(validationMessages[ValidationMessagesEnum.requiredField]);

// Copiando com novos valores
final updatedMessages = validationMessages.copyWith({
  ValidationMessagesEnum.invalidEmail: 'E-mail não reconhecido.',
});
```

### 🌐 Integração com Internacionalização

`FyValidationMessages` pode ser facilmente integrado com pacotes de internacionalização como `intl` ou `flutter_localizations`, permitindo trocar as mensagens conforme o idioma selecionado.

### 📌 Considerações Finais

- Proporciona **flexibilidade** e **clareza** na gestão de mensagens de erro.
- Ideal para formulários e validações reutilizáveis.
- Facilita a **manutenção** e **padronização** em projetos maiores.
- Estimula uma abordagem escalável e desacoplada na exibição de mensagens de erro.
