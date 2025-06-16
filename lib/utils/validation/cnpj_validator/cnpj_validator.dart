class CnpjValidator {
  CnpjValidator._();

  static const List<String> blacklist = [
    '00000000000000',
    '11111111111111',
    '22222222222222',
    '33333333333333',
    '44444444444444',
    '55555555555555',
    '66666666666666',
    '77777777777777',
    '88888888888888',
    '99999999999999'
  ];

  static const int cnpjLength = 14;
  static const stripRegex = r'[^\d]';

  /// Calcula o dígito verificador do CNPJ.
  static int _verifierDigit(String cnpj) {
    int index = 2;
    final List<int> reverse =
        cnpj.split('').map(int.parse).toList().reversed.toList();
    int sum = 0;
    for (final number in reverse) {
      sum += number * index;
      index = (index == 9 ? 2 : index + 1);
    }
    final int mod = sum % 11;
    return (mod < 2 ? 0 : 11 - mod);
  }

  /// Remove caracteres não numéricos do CNPJ.
  static String strip(String cnpj) {
    final RegExp regex = RegExp(stripRegex);
    return cnpj.replaceAll(regex, '');
  }

  /// Verifica se um CNPJ é válido.
  ///
  /// [stripBeforeValidation]: Remove caracteres não numéricos antes da validação.
  static bool isValid(String cnpj, [bool stripBeforeValidation = true]) {
    final cnpjToValidate = stripBeforeValidation ? strip(cnpj) : cnpj;

    if (cnpjToValidate.isEmpty ||
        cnpjToValidate.length != cnpjLength ||
        blacklist.contains(cnpjToValidate)) {
      return false;
    }

    String numbers = cnpjToValidate.substring(0, 12);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();
    return numbers.substring(numbers.length - 2) ==
        cnpjToValidate.substring(cnpjToValidate.length - 2);
  }
}
