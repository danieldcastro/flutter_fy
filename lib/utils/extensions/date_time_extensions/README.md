# 📜 ListExtensions - Extensões para `List` e `List?`

## 📖 Descrição

A **ListExtensions** fornece métodos utilitários para listas (`List`) e listas opcionais (`List?`) no Dart, facilitando tarefas comuns como validações, desserializações e verificações de quantidade de elementos.

## 🔧 Métodos Disponíveis

### 🔹 `ListExtensions` – para listas não nulas (`List`)

| Método                                                         | Retorno   | Descrição                                                                    |
|----------------------------------------------------------------|-----------|------------------------------------------------------------------------------|
| `isSingle`                                                     | `bool`    | Retorna `true` se a lista contiver **exatamente um** elemento.              |
| `deserializeList<T>(T Function(Map<String, dynamic>) fromMap)` | `List<T>` | Converte uma lista de mapas em uma lista tipada usando uma função `fromMap`. |

### 🔹 `ListExtensionsNullable` – para listas nulas ou não (`List?`)

| Método          | Retorno | Descrição                                               |
|----------------|---------|-----------------------------------------------------------|
| `isNullOrEmpty` | `bool`  | Retorna `true` se a lista for `null` ou estiver vazia.   |

## 🚀 Como Usar

### ✅ `isSingle`

```dart
List<int> numbers = [42];
print(numbers.isSingle); // true

numbers = [1, 2];
print(numbers.isSingle); // false
```

### 🔁 `deserializeList`

```dart
List<Map<String, dynamic>> jsonList = [
  {'id': 1, 'name': 'Item 1'},
  {'id': 2, 'name': 'Item 2'}
];

List<MyClass> objects = jsonList.deserializeList(MyClass.fromMap);
```

> A função `MyClass.fromMap` deve aceitar um `Map<String, dynamic>` e retornar uma instância de `MyClass`.

### 💡 `isNullOrEmpty`

```dart
List<int>? numbers;
print(numbers.isNullOrEmpty); // true

numbers = [];
print(numbers.isNullOrEmpty); // true

numbers = [1];
print(numbers.isNullOrEmpty); // false
```

## 📌 Considerações Finais

Essas extensões tornam o trabalho com listas mais fluido e expressivo, eliminando a necessidade de verificações repetitivas como `list == null || list.isEmpty` ou `list.length == 1`.

🔮 **Novas funcionalidades poderão ser adicionadas futuramente**.