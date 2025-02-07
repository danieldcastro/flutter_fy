import 'dart:math' as math;

import 'package:flutter/services.dart';

/// Formata o valor do campo com a máscara 9.999.999.999,00.
/// Suporta casas decimais dinâmicas e pode exibir um símbolo de moeda opcional.
class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({
    this.currency = false,
    this.currencySymbol = 'R\$',
    this.decimalDigits = 2,
  });

  final bool currency;
  final String currencySymbol;
  final int decimalDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || newValue.text.length > 17) return oldValue;

    // Converte a entrada para um número inteiro
    final int rawValue = int.tryParse(newValue.text) ?? 0;

    // Fator de escala para lidar com casas decimais
    final scaleFactor = math.pow(10, decimalDigits).toInt();

    // Divide o valor em parte inteira e parte decimal
    final double scaledValue = rawValue / scaleFactor;
    final int wholePart = scaledValue.truncate();
    final int fractionalPart =
        ((scaledValue - wholePart) * scaleFactor).round();

    // Formata a parte inteira com separador de milhar
    final wholePartFormatted = _addSeparator(wholePart.toString());

    // Preenche a parte decimal com zeros à esquerda, se necessário
    final fractionalPartPadded =
        fractionalPart.toString().padLeft(decimalDigits, '0');

    // Combina parte inteira e parte decimal no formato final
    var formattedValue = '$wholePartFormatted,$fractionalPartPadded';

    // Adiciona símbolo de moeda, se necessário
    if (currency) {
      formattedValue = '$currencySymbol $formattedValue';
    }

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  /// Adiciona separadores de milhar ao número
  String _addSeparator(String text) {
    final buffer = StringBuffer();
    final length = text.length;

    for (int i = 0; i < length; i++) {
      if (i > 0 && (length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(text[i]);
    }

    return buffer.toString();
  }
}
