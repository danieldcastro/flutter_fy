# 📅 FyFieldDate - Campo de Data

## 📖 Descrição

O **FyFieldDate** é um campo de formulário especializado para entrada e validação de datas.  
Suporta entrada de datas completas (com dia) ou apenas mês e ano, com máscara automática e validação flexível para anos no passado ou futuro.

## ✨ Recursos

- **Máscara inteligente:** Aplica a máscara `##/##/####` ou `##/####` automaticamente, dependendo da configuração.
- **Validação poderosa:** Permite configurar limites máximos e mínimos de anos passados e futuros.
- **Customizável:** Permite desabilitar o dia na entrada e ajustar os intervalos válidos de datas.

## 🚀 Como Usar

```dart
FyFieldDate(
  myTextFormFieldConfig,
  hasDay: true,           // Define se o dia será incluído (padrão: true)
  maxPastYears: 100,      // Quantos anos no passado são aceitos
  minPastYears: 0,        // Ano mínimo no passado (relativo ao ano atual)
  maxFutureYears: 20,     // Quantos anos no futuro são aceitos
);
```

## ⚙️ Parâmetros

| Parâmetro        | Tipo                  | Descrição                                                                                                                                               |
| ---------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`         | `TextFormFieldConfig` | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `hasDay`         | `bool`                | Se `true`, a máscara será `##/##/####`. Caso contrário, `##/####`.                                                                                      |
| `maxPastYears`   | `int`                 | Quantidade máxima de anos no passado aceitos.                                                                                                           |
| `minPastYears`   | `int`                 | Quantidade mínima de anos no passado aceitos.                                                                                                           |
| `maxFutureYears` | `int`                 | Quantidade máxima de anos no futuro aceitos.                                                                                                            |

## 🔧 Configurações

| Parâmetro         | Tipo                       | Descrição                                                  |
| ----------------- | -------------------------- | ---------------------------------------------------------- |
| `keyboardType`    | `TextInputType.datetime`   | Teclado adequado para entrada de datas.                    |
| `inputFormatters` | `List<TextInputFormatter>` | Aplica a máscara de acordo com o valor de `hasDay`.        |
| `validators`      | `ValidatorsCallBack`       | Usa `FyValidationTypes.date` para validações customizadas. |

## 📌 Considerações Finais

O **FyFieldDate** é ideal para formulários que exigem datas com regras específicas, como cadastros, documentos ou controle de vencimentos.  
Flexível e seguro, garante a entrada correta com formatação e validação automáticas.