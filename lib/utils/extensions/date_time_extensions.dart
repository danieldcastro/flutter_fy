extension DateTimeExtensions on DateTime {
  /// Extensão para a classe DateTime que formata a data como uma string.
  ///
  /// Por padrão, inclui o dia no formato `dd/MM/yyyy`. Caso `includeDay`
  /// seja `false`, retorna apenas `MM/yyyy`.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// DateTime date = DateTime(2025, 4, 3);
  /// print(date.formatDate()); // Saída: '03/04/2025'
  /// print(date.formatDate(includeDay: false)); // Saída: '04/2025'
  /// ```

  String formatDate({bool includeDay = true}) {
    if (includeDay) {
      return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
    } else {
      return "${month.toString().padLeft(2, '0')}/$year";
    }
  }
}
