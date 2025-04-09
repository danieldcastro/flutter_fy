## ✅ Result – Representação de Sucesso ou Falha (Either)

### 📖 Descrição

A classe `Result<L, R>` é uma **estrutura funcional imutável** que representa o resultado de uma operação que pode ser:

- ✅ **Sucesso**: representado por `Right<R>`, contendo um valor do tipo `R`.
- ❌ **Falha**: representada por `Left<L>`, contendo um erro ou valor do tipo `L`.

É útil para substituir exceções e capturar erros de forma mais funcional e previsível.



### 🔧 Métodos Disponíveis

| Método                  | Tipo de Retorno | Descrição                                                     |
| ----------------------- | --------------- | ------------------------------------------------------------- |
| `getOrThrow()`          | `R`             | Retorna o valor de sucesso ou lança a falha.                  |
| `getOrElse(fn)`         | `R`             | Retorna o sucesso ou aplica uma função fallback ao erro.      |
| `getOrDefault(value)`   | `R`             | Retorna o sucesso ou o valor padrão informado.                |
| `getOrNull()`           | `R?`            | Retorna o sucesso ou `null` em caso de falha.                 |
| `exceptionOrNull()`     | `L?`            | Retorna a falha ou `null` em caso de sucesso.                 |
| `isRight()`             | `bool`          | Retorna `true` se for sucesso.                                |
| `isLeft()`              | `bool`          | Retorna `true` se for falha.                                  |
| `fold(onLeft, onRight)` | `W`             | Aplica funções para sucesso e erro, retornando um novo valor. |
| `map(fn)`               | `Result<L, T>`  | Transforma o valor de sucesso.                                |
| `onRight(action)`       | `Result<L, R>`  | Executa efeito colateral se for sucesso.                      |
| `onLeft(action)`        | `Result<L, R>`  | Executa efeito colateral se for falha.                        |


### 🧱 Subclasses

#### `Right<L, R>` – Sucesso

Representa o sucesso de uma operação, armazenando o valor do tipo `R`.

#### `Left<L, R>` – Falha

Representa uma falha, erro ou exceção, armazenando o valor do tipo `L`.



### 🧩 Extensão – ResultObjectExtension

Essa extensão permite transformar **qualquer objeto** em um `Result`, de forma fluente:

| Método         | Retorno       | Descrição                        |
| -------------- | ------------- | -------------------------------- |
| `toLeft<R>()`  | `Left<W, R>`  | Converte o objeto em uma falha.  |
| `toRight<L>()` | `Right<L, W>` | Converte o objeto em um sucesso. |

> 🚫 Os métodos `toLeft` e `toRight` não devem ser usados diretamente em `Result` ou `Future`, pois lançam `assert`.



### 🧪 Exemplo de Uso

```dart
Result<String, int> divide(int a, int b) {
  if (b == 0) return 'Divisão por zero'.toLeft();
  return (a ~/ b).toRight();
}

final resultado = divide(10, 2);

resultado
  .onRight((value) => print('Sucesso: $value'))
  .onLeft((err) => print('Erro: $err'));
```



### 📌 Considerações finais

- Permite manipular erros sem exceções.
- Excelente para fluxos assíncronos e testes.
- Funciona bem com padrões funcionais e imutáveis.
