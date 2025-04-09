# 💰 FyFieldCurrency - Campo de Valores Monetários

## 📖 Descrição

O **FyFieldCurrency** é um campo de formulário customizado para entrada e validação de valores monetários.  
Ele oferece suporte a diferentes localidades (como `pt_BR`), aplicando máscara e formatação automática para moedas.  
Conta ainda com validação de limites mínimos e máximos, e mantém o valor padrão sempre visível, mesmo quando o campo está vazio.

## ✨ Recursos

- **Formatação monetária automática:** Máscara de moeda com separadores e símbolo conforme o locale.
- **Validação de valor:** Permite definir valores mínimo e máximo.
- **Controle de casas decimais:** Personalizável com base no número de dígitos decimais.
- **Prefixo automático:** Adiciona o símbolo da moeda ao campo.
- **Valor padrão vazio controlado:** Sempre mostra um valor padrão mesmo que o campo esteja vazio.
- **Compatível com múltiplas localidades.**

## 🚀 Como Usar

```dart
FyFieldCurrency(
  myTextFormFieldConfig,
  locale: FyLocales.ptBR,
  decimalDigits: 2,
  numValueMinMatching: 0.0,
  numValueMaxMatching: 9999.99,
);
```

## ⚙️ Parâmetros

| Parâmetro             | Tipo                  | Descrição                                                                                                                                               |
| --------------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`              | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `locale`              | `FyLocales`           | Define o símbolo da moeda e o valor padrão (ex: `FyLocales.ptBR`).                                                                                      |
| `decimalDigits`       | `int`                 | Define a quantidade de casas decimais. Padrão: `2`.                                                                                                     |
| `maxLength`           | `int`                 | Número máximo de caracteres no campo. Padrão: `24`.                                                                                                     |
| `numValueMinMatching` | `double?`             | Valor numérico mínimo permitido.                                                                                                                        |
| `numValueMaxMatching` | `double?`             | Valor numérico máximo permitido.                                                                                                                        |

## 🔧 Configurações

| Parâmetro         | Tipo                       | Descrição                                                                        |
| ----------------- | -------------------------- | -------------------------------------------------------------------------------- |
| `keyboardType`    | `TextInputType.number`     | Define o tipo do teclado para entrada numérica.                                  |
| `prefix`          | `Text`                     | Adiciona o símbolo da moeda antes do valor digitado.                             |
| `inputFormatters` | `List<TextInputFormatter>` | Aplica formatação monetária com separador e símbolo de moeda.                    |
| `validators`      | `ValidatorsCallBack`       | Valida valor mínimo, máximo e formato de moeda via `FyValidationTypes.currency`. |

## 🌍 Localizações Suportadas

O **FyFieldCurrency** oferece suporte internacionalizado para diversas moedas e formatos numéricos, com base no enum `FyLocales`.

| Locale  | Símbolo | Região                  | Valor Padrão |
| ------- | ------- | ----------------------- | ------------ |
| `ptBR`  | R$      | Português (Brasil)      | `0,00`       |
| `enUS`  | $       | Inglês (Estados Unidos) | `0.00`       |
| `esES`  | €       | Espanhol (Espanha)      | `0,00`       |
| `frFR`  | €       | Francês (França)        | `0,00`       |
| `deDE`  | €       | Alemão (Alemanha)       | `0,00`       |
| `itIT`  | €       | Italiano (Itália)       | `0,00`       |
| `jaJP`  | ¥       | Japonês (Japão)         | `0`          |
| `koKR`  | ₩       | Coreano (Coreia do Sul) | `0`          |
| `zhCN`  | ¥       | Chinês (China)          | `0.00`       |
| `ruRU`  | ₽       | Russo (Rússia)          | `0,00`       |
| `arSA`  | ﷼       | Árabe (Arábia Saudita)  | `0.00`       |
| `ptPT`  | €       | Português (Portugal)    | `0,00`       |
| `trTR`  | ₺       | Turco (Turquia)         | `0,00`       |
| `hiIN`  | ₹       | Hindi (Índia)           | `0.00`       |
| `viVN`  | ₫       | Vietnamita (Vietnã)     | `0`          |
| `thTH`  | ฿       | Tailandês (Tailândia)   | `0.00`       |
| `idID`  | Rp      | Indonésio (Indonésia)   | `0,00`       |
| `msMY`  | RM      | Malaio (Malásia)        | `0.00`       |
| `filPH` | ₱       | Filipino (Filipinas)    | `0.00`       |

* Os valores padrão podem variar conforme a localidade, e o símbolo da moeda é automaticamente aplicado ao campo.
* O valor padrão é exibido mesmo quando o campo está vazio, garantindo uma melhor experiência ao usuário.
* Para adicionar suporte a novas localidades, basta incluir o símbolo e o valor padrão no enum `FyLocales`.

### 🔄 Exemplo com Locale

```dart
FyFieldCurrency(
  myTextFormFieldConfig,
  locale: FyLocales.jaJP, // Para usar símbolo "¥" e valor padrão "0"
);
```

## 📌 Considerações Finais

O **FyFieldCurrency** oferece uma solução completa para entrada de valores financeiros em formulários Flutter.  
Ideal para apps de finanças, orçamentos ou qualquer necessidade de valores monetários.

Dúvidas, sugestões ou melhorias são bem-vindas para aprimorar este componente!
