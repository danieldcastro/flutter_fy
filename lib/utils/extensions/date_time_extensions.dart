import 'package:intl/intl.dart';

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

  /// Formata a data atual com um formato personalizado, permitindo literais dentro de crases (`...`).
  ///
  /// O método converte qualquer trecho entre crases (`...`) para literais entre aspas simples (`'...'`),
  /// garantindo que o `DateFormat` do pacote intl interprete corretamente os caracteres fixos.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// DateTime date = DateTime(2025, 4, 3);
  /// print(date.customFormatDate("dd/MM/yyyy")); // Saída: "03/04/2025"
  /// print(date.customFormatDate("EEEE, `dia` dd `de` MMMM")); // Saída: "quinta-feira, dia 03 de abril"
  /// ```
  ///
  /// Esse método utiliza o `DateFormat` com a localidade `'pt_BR'` por padrão.
  String customFormatDate(String format) {
    final adjustedFormat = format.replaceAllMapped(
        RegExp(r'`([^`]*)`'), (match) => "'${match.group(1)}'");

    final DateFormat formatDate = DateFormat(adjustedFormat, 'pt_BR');
    return formatDate.format(this);
  }
}
