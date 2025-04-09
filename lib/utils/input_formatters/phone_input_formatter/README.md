## ☎️ FyPhoneFormatter – Formatação de Número de Telefone

### 📖 Descrição

O `FyPhoneFormatter` é um `TextInputFormatter` personalizado que formata automaticamente números de telefone enquanto o usuário digita, com suporte para **fixo** e **celular**.  
A formatação segue o padrão brasileiro:

- **Fixo:** `(00) 0000-0000`
- **Celular:** `(00) 00000-0000`

Ideal para formulários de cadastro, login, contatos e outros campos de telefone.


### 🔧 Configurações

| Parâmetro     | Tipo   | Obrigatório | Descrição                                                     |
| ------------- | ------ | ----------- | ------------------------------------------------------------- |
| `isCellphone` | `bool` | ✅ Sim       | Define se o número inserido deve seguir o formato de celular. |



### ⚙️ Comportamento

| Tipo de número | Exemplo de entrada | Resultado formatado |
| -------------- | ------------------ | ------------------- |
| Fixo           | `1198765432`       | `(11) 9876-5432`    |
| Celular        | `11998765432`      | `(11) 99876-5432`   |
| Incompleto     | `11`               | `(11`               |


### 🧪 Exemplo de Uso

```dart
TextFormField(
  inputFormatters: [
    FyPhoneFormatter(isCellphone: true), // ou false para fixo
  ],
  keyboardType: TextInputType.number,
)
```



### 📌 Considerações Finais

- Remove todos os caracteres não numéricos antes de formatar.
- Define automaticamente o cursor no final do texto.
- Evita que o usuário digite mais do que os dígitos permitidos.

🔮 **No futuro, poderá ser expandido para suportar formatos internacionais ou validações mais avançadas.**
