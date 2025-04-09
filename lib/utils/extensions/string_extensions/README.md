# 🧩 StringExtensions - Extensões para `String`

## 📖 Descrição

A **StringExtensions** é uma extensão para a classe `String` que oferece diversos métodos utilitários para manipulação e formatação de textos, como capitalização, formatação de documentos, remoção de caracteres especiais, conversão monetária e muito mais. Também inclui uma extensão para `String?` chamada `StringExtensionsNullable`.

## ✨ Recursos

- ✅ Capitalização da primeira letra ou de todas as palavras.
- ✅ Formatação de CEP, documentos e telefones brasileiros.
- ✅ Remoção de acentos, espaços e caracteres especiais.
- ✅ Conversão para valores monetários localizados.
- ✅ Suporte a pluralização básica.
- ✅ Métodos úteis como `firstWord`, `addAsteriskPrefix`, `toCurrency`, entre outros.

## 🚀 Como Usar

```dart
final name = 'joão da silva';

print(name.capitalizeWords); // João Da Silva
print(name.capitalizeFirstLetter); // João da silva

final phone = '11987654321';
print(phone.formatBrPhoneNumber); // (11) 98765-4321

final cpf = '12345678901';
print(cpf.formatBrDocument); // 123.456.789-01

final value = '1999.9';
print(value.toCurrency()); // R$ 1.999,90

final nullableText = null;
print(nullableText.isNullOrEmpty); // true
```

## 🔧 Métodos Disponíveis

### 📌 Métodos de capitalização

| Método                | Retorno | Descrição                                                 |
| ---------------------|---------|-----------------------------------------------------------|
| `capitalizeWords`     | String  | Capitaliza a primeira letra de cada palavra.              |
| `capitalizeFirstLetter` | String | Capitaliza apenas a primeira letra da string.             |

### 📌 Formatação brasileira

| Método               | Retorno | Descrição                                                              |
|----------------------|---------|------------------------------------------------------------------------|
| `formatCep`          | String  | Formata um CEP como 12.345-678.                                        |
| `formatBrDocument`   | String  | Formata CPF, CNPJ e outros documentos comuns no Brasil.                |
| `formatBrPhoneNumber`| String  | Formata números de telefone em diferentes tamanhos.                    |

### 📌 Manipulação de caracteres

| Método                                   | Retorno | Descrição                                                        |
|------------------------------------------|---------|------------------------------------------------------------------|
| `removeNonDigits`                        | String  | Remove tudo exceto números.                                      |
| `removeDiacriticsAndSpacesToLowerCase`  | String  | Remove acentos, espaços e transforma em minúsculo.              |
| `removeSpecialCharacters`               | String  | Remove símbolos e pontuações especiais.                         |

### 📌 Utilidades

| Método                    | Retorno | Descrição                                                             |
|---------------------------|---------|----------------------------------------------------------------------|
| `firstWord`               | String  | Retorna a primeira palavra.                                          |
| `firstAndLastWords`       | String  | Retorna a primeira e última palavras.                                |
| `addAsteriskPrefix`       | String  | Adiciona um asterisco no início.                                     |
| `addColonSuffix`          | String  | Adiciona dois pontos no final.                                       |
| `pluralize(int)`          | String  | Retorna a palavra no plural se `quantityToCount > 1`.                |
| `validateLength(int)`     | bool    | Verifica se a string tem o tamanho mínimo especificado.              |
| `isSVG`                   | bool    | Verifica se o nome do arquivo termina com `.svg`.                    |
| `prepareCurrencyForParsing` | String | Remove pontos e converte vírgulas para ponto, útil antes do `parse`. |

### 📌 Conversão Monetária

| Método                         | Retorno | Descrição                                                        |
|--------------------------------|---------|------------------------------------------------------------------|
| `toCurrency()`                | String  | Formata a string como valor monetário, incluindo símbolo.        |
| `toCurrencyOnlyNumbers()`     | String  | Formata como valor monetário, mas sem símbolo de moeda.          |

### 📌 Extensões Nulas

| Método            | Retorno | Descrição                               |
|-------------------|---------|-----------------------------------------|
| `isNullOrEmpty`   | bool    | Verifica se a string é nula ou vazia.   |

## 🧪 Exemplos de Saída

| Código                                        | Saída                       |
|----------------------------------------------|-----------------------------|
| `'joão da silva'.capitalizeWords`            | `João Da Silva`             |
| `'12345678901'.formatBrDocument`             | `123.456.789-01`            |
| `'11987654321'.formatBrPhoneNumber`          | `(11) 98765-4321`           |
| `'1999.9'.toCurrency()`                      | `R$ 1.999,90`               |
| `'São Paulo!'.removeSpecialCharacters`       | `São Paulo`                 |
| `null.isNullOrEmpty`                         | `true`                      |

## 📌 Considerações Finais

A **StringExtensions** do pacote FlutterFy centraliza funcionalidades comuns para strings em aplicações Flutter, facilitando a formatação de dados e a internacionalização. Com suporte a localização via `FyLocales`, os métodos monetários se adaptam facilmente ao idioma e formato da aplicação.

🔮 **Em versões futuras, novas utilidades poderão ser incluídas**, como:
- Transformações com snake_case e camelCase.
- Detecção de e-mails, URLs ou números com regex.
- Suporte a truncamento de texto com sufixo (“...”).
