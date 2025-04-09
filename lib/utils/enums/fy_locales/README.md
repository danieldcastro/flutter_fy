# 🗺️ FyLocales - Enum de Localizações

## 📖 Descrição

O **FyLocales** é um enum que representa diferentes localizações (idiomas e regiões) com base em seus **símbolos monetários**, **códigos de locale** e **formatos de valores vazios**. É útil para aplicações que precisam lidar com múltiplas configurações regionais, como exibição de moeda, localização e formatação numérica.

## ✨ Recursos

- **Suporte a múltiplos idiomas e países**, incluindo Brasil, EUA, Japão, França, entre outros.
- **Símbolo monetário específico por região**.
- **Código de locale padrão compatível com bibliotecas de internacionalização**.
- **Valor monetário vazio customizado conforme a cultura**.

## 🌍 Idiomas e Regiões Suportadas

| Locale   | Símbolo | Código     | Valor Vazio |
|----------|---------|------------|-------------|
| ptBR     | R\$     | pt_BR      | 0,00        |
| enUS     | \$       | en_US      | 0.00        |
| esES     | €       | es_ES      | 0,00        |
| frFR     | €       | fr_FR      | 0,00        |
| deDE     | €       | de_DE      | 0,00        |
| itIT     | €       | it_IT      | 0,00        |
| jaJP     | ¥       | ja_JP      | 0           |
| koKR     | ₩       | ko_KR      | 0           |
| zhCN     | ¥       | zh_CN      | 0.00        |
| ruRU     | ₽       | ru_RU      | 0,00        |
| arSA     | ﷼       | ar_SA      | 0.00        |
| ptPT     | €       | pt_PT      | 0,00        |
| trTR     | ₺       | tr_TR      | 0,00        |
| hiIN     | ₹       | hi_IN      | 0.00        |
| viVN     | ₫       | vi_VN      | 0           |
| thTH     | ฿       | th_TH      | 0.00        |
| idID     | Rp      | id_ID      | 0,00        |
| msMY     | RM      | ms_MY      | 0.00        |
| filPH    | ₱       | fil_PH     | 0.00        |

* Nota: A quantidade de localizações suportadas pode variar conforme a versão do enum.	

## 🚀 Como Usar

### 📌 Exibir símbolo monetário de uma localização

```dart
final symbol = FyLocales.enUS.symbol; // Resultado: $
```

### 🌐 Obter código do locale

```dart
final localeCode = FyLocales.ptBR.locale; // Resultado: pt_BR
```

### ➕ Usar valor vazio formatado

```dart
final emptyValue = FyLocales.frFR.emptyValue; // Resultado: 0,00
```

## 🔧 Parâmetros

| Propriedade  | Tipo     | Descrição                                 |
|--------------|----------|-------------------------------------------|
| `symbol`     | `String` | Símbolo da moeda correspondente ao locale.|
| `locale`     | `String` | Código do locale no padrão internacional. |
| `emptyValue` | `String` | Valor monetário vazio no formato local.   |

## 📌 Considerações Finais

O `FyLocales` facilita a criação de apps internacionais com formatação regional consistente. Se você curtiu esse recurso, 🌟 o repositório e nos envie seu feedback!
