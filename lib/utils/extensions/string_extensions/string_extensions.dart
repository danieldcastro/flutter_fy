import 'package:diacritic/diacritic.dart';
import 'package:flutter_fy/utils/enums/fy_locales/fy_locales.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  /// Extensão para a classe String que capitaliza cada palavra na string.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'exemplo de string'.capitalizeWords;
  /// print(result); // Saída: 'Exemplo De String'
  /// ```
  String get capitalizeWords {
    if (isNotEmpty) {
      return toLowerCase()
          .trim()
          .split(' ')
          .map((str) =>
              str.isNotEmpty ? str[0].toUpperCase() + str.substring(1) : '')
          .join(' ');
    }
    return this;
  }

  /// Extensão para a classe String que capitaliza a primeira letra da string.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'exemplo de string'.capitalizeFirstLetter;
  /// print(result); // Saída: 'Exemplo de string'
  /// ```
  String get capitalizeFirstLetter =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;

  /// Extensão para a classe String que formata um CEP.
  /// Exemplo de uso:
  /// ```dart
  /// String result = '12345678'.formatCep;
  /// print(result); // Saída: '12.345-678'
  /// ```
  String? get formatCep {
    if (isNotEmpty) {
      final String cleanedCep = removeNonDigits;
      if (cleanedCep.length < 8) return this;
      return '${cleanedCep.substring(0, 2)}.${cleanedCep.substring(2, 5)}-${cleanedCep.substring(5, 8)}';
    }
    return this;
  }

  /// Extensão para a classe String que remove caracteres não numéricos.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'a1b2c3'.removeNonDigits;
  /// print(result); // Saída: '123'
  /// ```
  String get removeNonDigits =>
      isNotEmpty ? replaceAll(RegExp(r'[^0-9]'), '') : this;

  /// Extensão para a classe String que remove diacríticos e converte para minúsculas.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'Café'.removeDiacriticsAndSpacesToLowerCase ;
  /// print(result); // Saída: 'cafe'
  ///
  /// String result = 'Café da Pri'.removeDiacriticsAndSpacesToLowerCase ;
  /// print(result); // Saída: 'cafedapri'
  /// ```
  String get removeDiacriticsAndSpacesToLowerCase {
    if (isNotEmpty) {
      String withoutDiacritics = removeDiacritics(this);

      String withoutSpaces = withoutDiacritics.replaceAll(' ', '');

      return withoutSpaces.toLowerCase();
    }
    return this;
  }

  /// Extensão para a classe String que formata um documento brasileiro, seja ele [CPF], [CNPJ] ou [RG].
  /// Exemplo de uso:
  /// ```dart
  /// String cpf = '12345678901'.formatBrDocument;
  /// print(cpf); // Saída: '123.456.789-01'
  /// String cnpj = '58194968000186'.formatBrDocument;
  /// print(cnpj); // Saída: '58.194.968/0001-86'
  /// String rg = '12345678x'.formatBrDocument;
  /// print(rg); // Saída: '12.456.789-x'
  /// ```
  String get formatBrDocument {
    if (isNotEmpty) {
      String cleanedDocument =
          replaceAll(RegExp(r'[^0-9Xx]'), '').toUpperCase();

      return switch (cleanedDocument.length) {
        11
          // Retorna: 000.000.000-00
          =>
          '${cleanedDocument.substring(0, 3)}.${cleanedDocument.substring(3, 6)}.${cleanedDocument.substring(6, 9)}-${cleanedDocument.substring(9)}',
        14
          // Retorna: 00.000.000/0000-00
          =>
          '${cleanedDocument.substring(0, 2)}.${cleanedDocument.substring(2, 5)}.${cleanedDocument.substring(5, 8)}/${cleanedDocument.substring(8, 12)}-${cleanedDocument.substring(12)}',
        9
          // Retorna: 00.000.000-00
          =>
          '${cleanedDocument.substring(0, 2)}.${cleanedDocument.substring(2, 5)}.${cleanedDocument.substring(5, 8)}-${cleanedDocument.substring(8)}',
        _ =>
          // Se não houver correspondência com os casos acima, retorna a string original
          cleanedDocument,
      };
    }

    // Se a string original estiver vazia, retorna a própria string
    return this;
  }

  /// Extensão para a classe String que formata um número de telefone ou celular brasileiro, seja ele com ou sem [DDI] e [DDD].
  /// Exemplo de uso:
  /// ```dart
  /// String telComDDI = '551234567890'.formatBrPhoneNumber;
  /// print(telComDDI); // Saída: '+55 (12) 3456-7890'
  /// String telComDDD = '1234567890'.formatBrPhoneNumber;
  /// print(telComDDD); // Saída: '(12) 3456-7890'
  /// String telSemDDIeDDD = '34567890'.formatBrPhoneNumber;
  /// print(telSemDDIeDDD); // Saída: '3456-7890'
  ///
  /// String celComDDI = '5591234567890'.formatBrPhoneNumber;
  /// print(celComDDI); // Saída: '+55 (12) 93456-7890'
  /// String celComDDD = '12934567890'.formatBrPhoneNumber;
  /// print(celComDDD); // Saída: '(12) 93456-7890'
  /// String celSemDDIeDDD = '934567890'.formatBrPhoneNumber;
  /// print(celSemDDIeDDD); // Saída: '93456-7890'
  /// ```
  String get formatBrPhoneNumber {
    if (isNotEmpty) {
      final cleanedNumber = replaceAll(RegExp(r'[^0-9]'), '');

      return switch (cleanedNumber.length) {
        // Retorna: +00 (00) 00000-0000
        13 =>
          '+${cleanedNumber.substring(0, 2)} (${cleanedNumber.substring(2, 4)}) ${cleanedNumber.substring(4, 9)}-${cleanedNumber.substring(9)}',
        // Retorna: +00 (00) 0000-0000
        12 =>
          '+${cleanedNumber.substring(0, 2)} (${cleanedNumber.substring(2, 4)}) ${cleanedNumber.substring(4, 8)}-${cleanedNumber.substring(8)}',
        // Retorna: (00) 00000-0000
        11 =>
          '(${cleanedNumber.substring(0, 2)}) ${cleanedNumber.substring(2, 7)}-${cleanedNumber.substring(7)}',
        // Retorna: (00) 0000-0000
        10 =>
          '(${cleanedNumber.substring(0, 2)}) ${cleanedNumber.substring(2, 6)}-${cleanedNumber.substring(6)}',
        // Retorna: 00000-0000
        9 => '${cleanedNumber.substring(0, 5)}-${cleanedNumber.substring(5)}',
        // Retorna: 0000-0000
        8 => '${cleanedNumber.substring(0, 4)}-${cleanedNumber.substring(4)}',
        _ => cleanedNumber,
      };
    }

    return this;
  }

  /// Extensão para a classe String que retorna a primeira palavra da string.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'primeira palavra'.firstWord;
  /// print(result); // Saída: 'primeira'
  /// ```
  String get firstWord {
    if (isNotEmpty) {
      final words = trim().split(' ');
      return words.first;
    }
    return this;
  }

  /// Extensão para a classe String que retorna a primeira e última palavra da string.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'primeira e última palavra'.firstAndLastWords;
  /// print(result); // Saída: 'primeira palavra'
  /// ```
  String get firstAndLastWords {
    if (isNotEmpty) {
      final words = trim().split(' ');
      return words.length > 1 ? '${words.first} ${words.last}' : words.first;
    }
    return this;
  }

  /// Extensão para a classe String que adiciona um asterisco como prefixo.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'texto'.addAsteriskPrefix;
  /// print(result); // Saída: '*texto'
  /// ```
  String get addAsteriskPrefix {
    if (isNotEmpty) {
      return '*$this';
    }
    return this;
  }

  /// Extensão para a classe String que adiciona dois pontos como sufixo.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'texto'.addColonSuffix;
  /// print(result); // Saída: 'texto:'
  /// ```
  String get addColonSuffix {
    if (isNotEmpty) {
      return '$this:';
    }
    return this;
  }

  /// Extensão para a classe String que verifica se a string tem o tamanho mínimo especificado.
  /// Exemplo de uso:
  /// ```dart
  /// String result = 'texto'.validateLength(5);
  /// print(result); // Saída: false
  /// ```
  bool validateLength(int length) => length <= this.length;

  /// Converte a string para o formato de moeda, respeitando o número de casas decimais e o local informado.
  /// Exemplo de uso:
  /// ```dart
  /// String valor = '1234.56'.toCurrency();
  /// print(valor); // Saída: R$ 1.234,56 (para locale ptBR)
  /// ```
  ///
  /// Parâmetros:
  /// - [decimalDigits]: Define o número de casas decimais a serem exibidas (padrão: 2).
  /// - [locale]: Define o local para formatação da moeda (padrão: `Locales.ptBR`).
  String toCurrency(
      {int decimalDigits = 2, FyLocales locale = FyLocales.ptBR}) {
    if (isNotEmpty) {
      return NumberFormat.simpleCurrency(
        locale: locale.locale,
        decimalDigits: decimalDigits,
      ).format(double.tryParse(this));
    }
    return this;
  }

  /// Converte a string para um formato de moeda, removendo o símbolo da moeda,
  /// mas mantendo a formatação numérica e os separadores de milhar e decimal.
  /// Exemplo de uso:
  /// ```dart
  /// String valor = '1234.56'.toCurrencyOnlyNumbers();
  /// print(valor); // Saída: 1.234,56 (para locale ptBR)
  /// ```
  ///
  /// Parâmetros:
  /// - [decimalDigits]: Define o número de casas decimais a serem exibidas (padrão: 2).
  /// - [locale]: Define o local para formatação da moeda (padrão: `Locales.ptBR`).
  String toCurrencyOnlyNumbers(
      {int decimalDigits = 2, FyLocales locale = FyLocales.ptBR}) {
    if (isNotEmpty) {
      return NumberFormat.simpleCurrency(
              locale: locale.locale, decimalDigits: decimalDigits, name: '')
          .format(double.tryParse(this))
          .trim();
    }
    return this;
  }

  String pluralize(int quantityToCount) =>
      (isEmpty || quantityToCount == 1) ? this : '${this}s';

  /// Extensão para a classe String que prepara uma string de valor monetário para análise como double,
  /// removendo caracteres não numéricos e substituindo vírgulas por pontos.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// String? result = 'R\$ 25.000,00'.prepareCurrencyForParsing;
  /// print(result); // Saída: '25000.00'
  /// ```
  String get prepareCurrencyForParsing {
    if (isNotEmpty) {
      int firstIndexNumber = indexOf(RegExp(r'[0-9]'), 0);

      if (firstIndexNumber != -1) {
        String preparedValue = trim()
            .substring(firstIndexNumber)
            .replaceAll('.', '')
            .replaceAll(',', '.');
        return preparedValue;
      } else {
        return this;
      }
    }
    return this;
  }

  /// Verifica se a string representa um arquivo no formato SVG.
  /// Ignora espaços em branco no início e no fim da string e faz a verificação
  /// sem diferenciar maiúsculas de minúsculas.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// bool isSvgFile = 'imagem.SVG'.isSVG;
  /// print(isSvgFile); // Saída: true
  /// ```
  bool get isSVG => trim().toLowerCase().endsWith('.svg');

  /// Remove caracteres especiais da string, mantendo apenas letras, números e espaços.
  ///
  /// Exemplo de uso:
  /// ```dart
  /// String texto = 'Olá, mundo! #2024';
  /// print(texto.removeSpecialCharacters); // Saída: "Olá mundo 2024"
  /// ```
  String get removeSpecialCharacters {
    if (isNotEmpty) {
      return replaceAll(RegExp(r'[^\w\s]|_', unicode: true), '');
    }
    return this;
  }
}

extension StringExtensionsNullable on String? {
  /// Verifica se a string é nula ou vazia.
  /// Exemplo de uso:
  /// ```dart
  /// bool isEmpty = 'exemplo'.isNullOrEmpty;
  /// print(isEmpty); // Saída: false
  /// ```
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
