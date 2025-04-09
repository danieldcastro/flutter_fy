# 📜 ListExtensions - Extensões para `List` e `List?`

## 📖 Descrição

Essas extensões adicionam funcionalidades utilitárias a listas (`List`) e listas opcionais (`List?`) no Dart. São ideais para melhorar a legibilidade e produtividade ao trabalhar com coleções.

## 🔧 Métodos Disponíveis

### 🔹 `ListExtensions` – para listas não nulas (`List`)

| Método                                                         | Retorno   | Descrição                                                                    |
| -------------------------------------------------------------- | --------- | ---------------------------------------------------------------------------- |
| `isSingle`                                                     | `bool`    | Verifica se a lista contém exatamente um único elemento.                     |
| `deserializeList<T>(T Function(Map<String, dynamic>) fromMap)` | `List<T>` | Converte uma lista de mapas em uma lista tipada usando uma função `fromMap`. |

### 🚀 Como Usar

#### ✅ `isSingle`

```dart
List<int> numbers = [42];
print(numbers.isSingle); // Saída: true

numbers = [1, 2];
print(numbers.isSingle); // Saída: false
```

#### 🔁 `deserializeList`

```dart
List<Map<String, dynamic>> jsonList = [
  {'id': 1, 'name': 'Item 1'},
  {'id': 2, 'name': 'Item 2'}
];

List<MyClass> objects = jsonList.deserializeList(MyClass.fromMap);
```

> `MyClass.fromMap` deve ser uma função que recebe um `Map<String, dynamic>` e retorna um `MyClass`.



### 🔹 `ListExtensionsNullable` – para listas nulas ou não (`List?`)

| Método          | Retorno | Descrição                                              |
| --------------- | ------- | ------------------------------------------------------ |
| `isNullOrEmpty` | `bool`  | Retorna `true` se a lista for `null` ou estiver vazia. |

#### 💡 Exemplo de uso

```dart
List<int>? numbers;
print(numbers.isNullOrEmpty); // true

numbers = [];
print(numbers.isNullOrEmpty); // true

numbers = [1];
print(numbers.isNullOrEmpty); // false
```

## 📌 Considerações Finais

Essas extensões são simples, porém poderosas. Elas trazem clareza ao código e evitam checagens repetitivas ou casting explícito.

🔮 **Futuramente podem ser adicionados novos métodos**.
