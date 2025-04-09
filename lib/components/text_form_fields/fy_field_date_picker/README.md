# 📅 FyFieldDatePicker - Campo de Seletor de Data

## 📖 Descrição

O **FyFieldDatePicker** é um campo de formulário que integra um seletor de data (DatePicker) no Flutter.  
Ao tocar no campo, o usuário é direcionado a um calendário para escolher uma data. O valor selecionado é formatado automaticamente no formato `dd/MM/yyyy`.

## ✨ Recursos

- **Seleção integrada de data:** Abre um DatePicker ao tocar no campo.
- **Limites de data configuráveis:** Permite definir datas mínimas (`firstDate`) e máximas (`lastDate`) para a seleção.
- **Customização de exibição:** Possibilita a customização do modo de exibição inicial (dias, calendário) e do modo de entrada.
- **Atualização automática:** Atualiza o campo com a data selecionada e retorna o valor via callback.

## 🚀 Como Usar

```dart
FyFieldDatePicker(
  myTextFormFieldConfig,
  firstDate: DateTime(2020, 1, 1),
  lastDate: DateTime(2030, 12, 31),
  onSelectDate: (selectedDate) {
    // Lógica após seleção da data
  },
  initialDate: DateTime.now(),
  initialDatePickerMode: DatePickerMode.day,
  initialEntryMode: DatePickerEntryMode.calendarOnly,
);
```

## ⚙️ Parâmetros

| Parâmetro               | Tipo                      | Descrição                                                                                                                                               |
| ----------------------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`                | `TextFormFieldConfig`     | Define as propriedades do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `firstDate`             | `DateTime`                | Data mínima permitida para seleção no DatePicker.                                                                                                       |
| `lastDate`              | `DateTime`                | Data máxima permitida para seleção no DatePicker.                                                                                                       |
| `onSelectDate`          | `ValueChanged<DateTime?>` | Callback chamado com a data selecionada.                                                                                                                |
| `initialDate`           | `DateTime?`               | Data inicial sugerida para o DatePicker (caso não haja valor no campo, usa `firstDate`).                                                                |
| `initialDatePickerMode` | `DatePickerMode`          | Define o modo inicial do DatePicker (por exemplo, `DatePickerMode.day`).                                                                                |
| `initialEntryMode`      | `DatePickerEntryMode`     | Define o modo de entrada inicial (ex.: `DatePickerEntryMode.calendarOnly`).                                                                             |

## 🔧 Configurações

| Parâmetro      | Tipo                     | Descrição                                                                     |
| -------------- | ------------------------ | ----------------------------------------------------------------------------- |
| `keyboardType` | `TextInputType.datetime` | Define o teclado apropriado para entrada de datas.                            |
| `maxLines`     | `int`                    | Define a quantidade máxima de linhas do campo (fixado em 1).                  |
| `suffixIcon`   | `Widget`                 | Adiciona um ícone de calendário ao final do campo, com espaçamento à direita. |
| `onTap`        | `Function(BuildContext)` | Função que abre o DatePicker e atualiza o campo com a data escolhida.         |

## 📌 Considerações Finais

O **FyFieldDatePicker** simplifica a seleção de datas em seus formulários, oferecendo uma interface intuitiva e validada para o usuário.  
Ideal para agendamentos, cadastros ou qualquer situação que exija a escolha de uma data, este componente integra de forma prática o DatePicker do Flutter, garantindo formatação e validação correta da data selecionada.