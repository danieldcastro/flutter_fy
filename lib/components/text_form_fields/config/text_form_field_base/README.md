# 🔠 TextFormFieldBase

## 📖 Descrição

Componente base altamente configurável para campos de formulário, usado internamente nos componentes do pacote **FlutterFy**.  
**Não deve ser instanciado diretamente**. Em vez disso, utilize um dos campos personalizados (ex: `BelTextField`) ou crie um novo com base nesse componente.



## ✨ Recursos

`TextFormFieldBase` é um `StatefulWidget` que encapsula funcionalidades comuns para campos de formulário:

- Integração com `TextFormFieldConfig` para controle de estado, estilo e comportamento.
- Suporte a validações com múltiplos validadores.
- Ícones de ajuda com modal explicativo.
- Ícone de carregamento com `FyLoadingRotatingDots`.
- Foco automático, controle de edição e visibilidade condicional.
- Customização completa com prefix, suffix e estilização.



## 🔧 Configurações

| Parâmetro            | Tipo                                        | Descrição                                                                                                                                                         |
| -------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `config`             | `TextFormFieldConfig`                       | Objeto de configuração principal do campo. Veja a documentação do [TextFormFieldConfig](lib/components/text_form_fields/config/text_form_field_config/README.md). |
| `keyboardType`       | `TextInputType`                             | Define o tipo de teclado.                                                                                                                                         |
| `maxLength`          | `int?`                                      | Número máximo de caracteres permitidos.                                                                                                                           |
| `inputFormatters`    | `List<TextInputFormatter>?`                 | Lista de formatadores aplicados ao valor digitado.                                                                                                                |
| `suffixIcon`         | `Widget?`                                   | Ícone exibido no lado direito do campo (quando não estiver carregando).                                                                                           |
| `suffixIconMaxWidth` | `double`                                    | Largura máxima do ícone de sufixo.                                                                                                                                |
| `prefixIcon`         | `Widget?`                                   | Ícone exibido no lado esquerdo do campo.                                                                                                                          |
| `prefix`             | `Widget?`                                   | Widget exibido antes do conteúdo do campo.                                                                                                                        |
| `onTap`              | `Future<DateTime?> Function(BuildContext)?` | Função executada ao tocar no campo (útil para campos com datas ou interações customizadas).                                                                       |
| `validators`         | `ValidatorsCallBack?`                       | Lista de validadores customizados.                                                                                                                                |
| `textCapitalization` | `TextCapitalization`                        | Define como o texto será capitalizado.                                                                                                                            |
| `maxLines`           | `int?`                                      | Número máximo de linhas do campo.                                                                                                                                 |
| `obscureText`        | `bool`                                      | Define se o texto será oculto (como em senhas).                                                                                                                   |



## 🧪 Validação

- Se `isRequired` estiver ativado em `TextFormFieldConfig`, o campo exigirá preenchimento.
- Validações adicionais podem ser passadas por meio do parâmetro `validators`.
- A validação é automaticamente executada quando o campo perde o foco.
- Em caso de erro, o foco pode ser solicitado automaticamente com `onValidationError`.



## 💡 Ajuda Interativa

Se `helpTextConfigs` estiver presente em `config`, um botão com ícone será exibido ao lado do título.  
Ao tocar, será aberto um modal responsivo (`showResponsiveDialog`) com título e descrição.


## 🚫 Leitura e Edição

- Quando `isReadOnly` for verdadeiro, o campo será apenas leitura e terá um estilo diferenciado.
- Se `isEnabled` for falso, o campo será desabilitado (sem interação).



## 🔁 Loading Dinâmico

Se `config.isLoading` for um `bool` com valor `true`, o sufixo será substituído por um `FyLoadingRotatingDots` até que o loading termine.

Boa! Aqui vai as **📝 Considerações finais** específicas para o `TextFormFieldBase`:



### 📌 Considerações finais

A `TextFormFieldBase` é a fundação dos campos de entrada no pacote FlutterFy. Ela encapsula validações, controle de foco, estado de carregamento e exibição de dicas contextuais de forma reutilizável e consistente. Seu uso direto é desencorajado — em vez disso, recomenda-se criar componentes específicos derivados dela (como os `BelFields`), garantindo reutilização de lógica e aderência ao design system da aplicação.