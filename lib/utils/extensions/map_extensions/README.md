# 🗺️ MapExtensionsNullable - Extensões para `Map?`

## 📖 Descrição

A **MapExtensionsNullable** fornece métodos utilitários para mapas que podem ser `null`, tornando mais simples a verificação de nulidade ou se o mapa está vazio. É ideal para reduzir validações repetitivas em código que lida com estruturas de dados dinâmicas.

## 🔧 Métodos Disponíveis

| Método          | Retorno | Descrição                                             |
|----------------|---------|--------------------------------------------------------|
| `isNullOrEmpty` | `bool`  | Retorna `true` se o mapa for `null` ou estiver vazio. |

## 🚀 Como Usar

```dart
Map<String, int>? map;

print(map.isNullOrEmpty); // true

map = {};
print(map.isNullOrEmpty); // true

map = {'key': 1};
print(map.isNullOrEmpty); // false
```

## 📌 Considerações Finais

Essa extensão evita a repetição de condições como `map == null || map.isEmpty` e torna o código mais limpo e legível.

🔮 **Novas funcionalidades poderão ser adicionadas futuramente**.