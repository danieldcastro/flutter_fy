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
