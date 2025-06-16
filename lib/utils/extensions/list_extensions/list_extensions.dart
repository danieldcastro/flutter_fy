extension ListExtensions on List {
  /// Extensão para a classe List que adiciona um método utilitário para verificar se a lista contém apenas um elemento.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// List<int> numbers = [42];
  /// print(numbers.isSingle); // Saída: true
  ///
  /// numbers = [1, 2];
  /// print(numbers.isSingle); // Saída: false
  /// ```
  bool get isSingle => length == 1;

  /// Extensão para desserializar uma lista de mapas para uma lista de objetos do tipo `T`.
  ///
  /// Essa função converte a lista atual, assumindo que contém mapas (`Map<String, dynamic>`),
  /// e utiliza a função `fromMap` para transformá-los no tipo desejado.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// List<Map<String, dynamic>> jsonList = [
  ///   {'id': 1, 'name': 'Item 1'},
  ///   {'id': 2, 'name': 'Item 2'}
  /// ];
  ///
  /// List<MyClass> objects = jsonList.deserializeList(MyClass.fromMap);
  /// ```
  ///
  /// Onde `MyClass.fromMap` é um método que converte um `Map<String, dynamic>` em uma instância de `MyClass`.
  List<T> deserializeList<T>(T Function(Map<String, dynamic>) fromMap) => List.castFrom<dynamic, Map<String, dynamic>>(this)
        .map(fromMap)
        .toList();
}

extension ListExtensionsNullable on List? {
  /// Extensão para listas que podem ser nulas, adicionando um método utilitário para verificar se estão vazias ou indefinidas.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// List<int>? numbers;
  /// print(numbers.isNullOrEmpty); // Saída: true
  ///
  /// numbers = [];
  /// print(numbers.isNullOrEmpty); // Saída: true
  ///
  /// numbers = [1];
  /// print(numbers.isNullOrEmpty); // Saída: false
  /// ```
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);
}
