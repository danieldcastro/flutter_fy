
# 🔠 FyTextFormFieldBase

## 📖 Descrição

Componente base altamente configurável para campos de formulário, usado internamente nos componentes do pacote **FlutterFy**.  
**Não deve ser instanciado diretamente**. Em vez disso, utilize um dos campos personalizados (ex: `BelTextField`) ou crie um novo com base nesse componente.



## ✨ Recursos

`FyTextFormFieldBase` é um `StatefulWidget` que encapsula funcionalidades comuns para campos de formulário:

- Integração com `FyTextFormFieldConfig` para controle de estado, estilo e comportamento.
- Suporte a múltiplas validações customizadas e obrigatoriedade de preenchimento.
- Ícone de ajuda com abertura de modal explicativo.
- Ícone de carregamento usando `FyLoadingRotatingDots`.
- Foco automático e controle de foco com retorno via callback (`onFocusChanged`).
- Abertura de modais ou seletores ao tocar no campo (`onTap`) com bloqueio de edição direta.
- Customização completa com `prefix`, `suffix`, preenchimento e estilos dinâmicos.



## 🔧 Configurações

| Parâmetro            | Tipo                                        | Descrição                                                                                                                                                         |
| -------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`             | `FyTextFormFieldConfig`                     | Objeto de configuração principal do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `keyboardType`       | `TextInputType`                             | Define o tipo de teclado exibido.                                                                                                                                 |
| `maxLength`          | `int?`                                      | Número máximo de caracteres permitidos no campo. Valor padrão: `255`.                                                                                             |
| `inputFormatters`    | `List<TextInputFormatter>?`                 | Lista de formatadores aplicados ao valor digitado.                                                                                                                |
| `validators`         | `ValidatorsCallBack?`                       | Lista de validadores customizados.                                                                                                                                |
| `textCapitalization` | `TextCapitalization`                        | Define como o texto será capitalizado. Valor padrão: `TextCapitalization.none`.                                                                                   |
| `maxLines`           | `int?`                                      | Número máximo de linhas permitidas. Valor padrão: `1`.                                                                                                            |
| `obscureText`        | `bool`                                      | Define se o texto será ocultado (útil para senhas). Valor padrão: `false`.                                                                                        |
| `onTap`              | `Future<DateTime?> Function(BuildContext)?` | Função executada ao tocar no campo. Útil para campos com seleção de data ou comportamento customizado.                                                            |



## 🧪 Validação

- Quando `isRequired` estiver ativo em `FyTextFormFieldConfig`, o campo exigirá preenchimento.
- Validações adicionais podem ser passadas por meio do parâmetro `validators`.
- A validação é executada automaticamente quando o campo perde o foco.
- Se ocorrer erro de validação, o campo pode solicitar foco automaticamente e acionar o callback `onValidationError`.



## 💡 Ajuda Interativa

Se `helpTextConfigs` estiver presente no `config`, será exibido um botão com ícone ao lado do título.  
Ao tocar nesse botão, será aberto um modal responsivo (`showResponsiveDialog`) com o título e descrição fornecidos.

O ícone pode ser um `IconData`, um asset de imagem comum ou um SVG.  
A cor do ícone é controlada por `helpTextSetup?.iconColor`.



## 🔁 Loading Dinâmico

Se `config.isLoading == true`, o sufixo do campo será substituído por um `FyLoadingRotatingDots`, indicando carregamento.



## 🚫 Leitura e Edição

- Quando `isReadOnly` for `true`, o campo ficará apenas leitura e exibirá estilo diferenciado (cor de fundo e texto).
- Quando `isEnabled` for `false`, o campo será totalmente desabilitado.
- Se `onTap` estiver definido, o campo será tratado como interativo apenas por toque, impedindo entrada direta de texto (`IgnorePointer`).



## 🎯 Foco e Controle de Estado

- O campo gerencia internamente o `FocusNode`.
- Se `needsFocus` estiver ativado em `FyTextFormFieldConfig`, o foco será solicitado automaticamente após renderização.
- Quando o foco muda, o callback `onFocusChanged` é chamado (se definido).


## 📌 Considerações finais

`FyTextFormFieldBase` é a fundação de todos os campos personalizados no FlutterFy. Ele centraliza regras de validação, controle de foco, estados de carregamento e exibição contextual de ajuda — permitindo que novos campos sejam construídos com consistência e reaproveitamento de lógica.

> Recomendação: use sempre um campo personalizado derivado de `FyTextFormFieldBase` para manter a padronização visual e comportamental do seu app.

