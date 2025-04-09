# 🔢 NumExtensionsNullable - Extensões para `num?`

## 📖 Descrição

A **NumExtensionsNullable** adiciona um método utilitário à classe `num?`, facilitando a validação de números que podem ser `null`, `0` ou `0.0`. É especialmente útil em formulários ou cálculos em que a ausência de valor numérico precisa ser detectada de forma clara e concisa.

## 🔧 Métodos Disponíveis

| Método           | Retorno | Descrição                                               |
|------------------|---------|---------------------------------------------------------|
| `isNullOrEmpty`  | `bool`  | Retorna `true` se o valor for `null`, `0` ou `0.0`.     |

## 🚀 Como Usar

```dart
num? value;

print(value.isNullOrEmpty); // true

value = 0;
print(value.isNullOrEmpty); // true

value = 0.0;
print(value.isNullOrEmpty); // true

value = 42;
print(value.isNullOrEmpty); // false
```

## 📌 Considerações Finais

A **NumExtensionsNullable** simplifica verificações numéricas e evita duplicação de lógica em validações.

🔮 **Novos métodos utilitários poderão ser adicionados no futuro**.
