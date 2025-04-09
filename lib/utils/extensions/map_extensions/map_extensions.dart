extension MapExtensionsNullable on Map? {
  /// Extensão para mapas que podem ser nulos, adicionando um método utilitário para verificar se estão vazios ou indefinidos.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// Map<String, int>? map;
  /// print(map.isNullOrEmpty); // Saída: true
  ///
  /// map = {};
  /// print(map.isNullOrEmpty); // Saída: true
  ///
  /// map = {'key': 1};
  /// print(map.isNullOrEmpty); // Saída: false
  /// ```
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);
}
