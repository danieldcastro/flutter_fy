import 'dart:async';
import 'dart:ui';

/// Mixin que adiciona funcionalidade de debounce para evitar múltiplas execuções rápidas de uma função.
///
/// O método `debounce` adia a execução de uma ação até que um determinado período de tempo tenha passado
/// desde a última chamada. Se chamado novamente antes desse tempo, o temporizador é reiniciado.
///
/// Exemplo de uso:
/// ```dart
/// class MyClass with FyDebounceMixin {
///   void onSearchChanged(String query) {
///     debounce(() {
///       print("Buscando por: $query");
///     }, duration: Duration(milliseconds: 500));
///   }
/// }
/// ```
///
/// Nesse exemplo, a função só será executada após 500ms sem novas chamadas.
mixin FyDebounceMixin {
  Timer? _debounceTimer;

  /// Executa a `action` apenas se um determinado tempo (`duration`) passar sem novas chamadas.
  ///
  /// Se `duration` não for informada, o tempo padrão será de 600ms.
  void debounce(
    VoidCallback action, {
    Duration? duration,
  }) {
    _debounceTimer?.cancel();

    _debounceTimer =
        Timer(duration ?? const Duration(milliseconds: 600), action);
  }
}
