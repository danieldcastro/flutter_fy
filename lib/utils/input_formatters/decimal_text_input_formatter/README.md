# 📌 Decimal Text Input Formatter

O `FyDecimalTextInputFormatter` é um formatador de entrada para **Flutter** que aplica automaticamente uma máscara para valores numéricos, suportando separadores de milhares e um número variável de casas decimais. Ele também permite a inclusão opcional de um símbolo de moeda.  

## ✨ Recursos  

- ✅ Formata números automaticamente no estilo **"9.999.999.999,00"**, com suporte para **casas decimais customizáveis** e até **17 dígitos no total**.  
- ✅ Adiciona **separadores de milhares** de forma automática.  
- ✅ Permite a exibição de um **símbolo de moeda personalizável** (exemplo: `R$`, `$`, `€`).  
- ✅ Evita que o usuário insira mais dígitos do que o permitido.  

## 📦 Instalação  

Adicione o `FyDecimalTextInputFormatter` ao seu projeto e utilize-o no **TextField** do Flutter.  

## 🚀 Como Usar  

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'decimal_text_input_formatter.dart'; // Certifique-se de importar o arquivo correto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Decimal Formatter Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FyDecimalTextInputFormatter(
                currency: true,
                currencySymbol: 'R\$',
                decimalDigits: 2,
              ),
            ],
            decoration: const InputDecoration(
              labelText: 'Valor',
              hintText: 'Digite um valor...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
```

## 🎛️ Parâmetros  

| Parâmetro         | Tipo    | Padrão  | Descrição |
|------------------|--------|--------|------------|
| `currency`       | `bool` | `false` | Exibe o símbolo da moeda antes do valor. |
| `currencySymbol` | `String` | `'R$'` | Define o símbolo da moeda, caso `currency` esteja ativado. |
| `decimalDigits`  | `int`  | `2`    | Define o número de casas decimais permitidas (pode ser 2, 3 ou 4). |

## 📌 Exemplo de Formatação  

| Entrada  | Saída (`currency: false`) | Saída (`currency: true, currencySymbol: 'R$'`) |
|---------|-------------------|----------------------------|
| `1234`  | `1.234,00`        | `R$ 1.234,00`              |
| `1000000` | `1.000.000,00`  | `R$ 1.000.000,00`          |
| `123456789` | `123.456.789,00` | `R$ 123.456.789,00`    |