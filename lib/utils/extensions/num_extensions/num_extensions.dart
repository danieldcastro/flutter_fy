extension NumExtensionsNullable on num? {
  /// Extensão para números que podem ser nulos, adicionando um método utilitário para verificar se são `null` ou zero.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// num? value;
  /// print(value.isNullOrEmpty); // Saída: true
  ///
  /// value = 0;
  /// print(value.isNullOrEmpty); // Saída: true
  ///
  /// value = 0.0;
  /// print(value.isNullOrEmpty); // Saída: true
  ///
  /// value = 42;
  /// print(value.isNullOrEmpty); // Saída: false
  /// ```
  bool get isNullOrEmpty => this == null || this == 0 || this == 0.0;
}
