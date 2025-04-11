class CpfValidator {
  CpfValidator._();

  static const List<String> blacklist = [
    '00000000000',
    '11111111111',
    '22222222222',
    '33333333333',
    '44444444444',
    '55555555555',
    '66666666666',
    '77777777777',
    '88888888888',
    '99999999999',
    '12345678909'
  ];

  static const int cpfLength = 11;
  static const stripRegex = r'[^\d]';

  static int _verifierDigit(String cpf) {
    List<int> numbers =
        cpf.split('').map((number) => int.parse(number, radix: 10)).toList();
    int modulus = numbers.length + 1;
    List<int> multiplied = [];
    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }
    int mod = multiplied.reduce((buffer, number) => buffer + number) % 11;
    return (mod < 2 ? 0 : 11 - mod);
  }

  static String strip(String cpf) {
    RegExp regExp = RegExp(stripRegex);
    return cpf.replaceAll(regExp, '');
  }

  static bool isValid(String cpf, [bool stripBeforeValidation = true]) {
    String cpfToValidate = stripBeforeValidation ? strip(cpf) : cpf;

    if (cpfToValidate.isEmpty ||
        cpfToValidate.length != cpfLength ||
        blacklist.contains(cpfToValidate)) {
      return false;
    }

    String numbers = cpfToValidate.substring(0, cpfLength - 2);
    numbers += _verifierDigit(numbers).toString() +
        _verifierDigit(numbers + _verifierDigit(numbers).toString()).toString();

    return numbers == cpfToValidate;
  }
}
