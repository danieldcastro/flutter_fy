## ⏳ FyDebounceMixin – Mixin com Debounce para Execuções Controladas

### 📖 Descrição

O `FyDebounceMixin` é um mixin que adiciona uma funcionalidade de **debounce** para evitar a execução repetida de uma função em um curto intervalo de tempo.

É ideal para cenários como buscas em tempo real, validações automáticas ou qualquer situação onde múltiplas chamadas rápidas devam ser controladas para melhorar performance e usabilidade.



### 🔧 Método Disponível

| Método     | Retorno | Descrição                                                         |
| ---------- | ------- | ----------------------------------------------------------------- |
| `debounce` | `void`  | Executa a ação somente após o tempo de espera sem novas chamadas. |

| Parâmetro  | Tipo           | Obrigatório | Descrição                                         |
| ---------- | -------------- | ----------- | ------------------------------------------------- |
| `action`   | `VoidCallback` | ✅ Sim       | Função a ser executada após o tempo de espera.    |
| `duration` | `Duration?`    | ❌ Não       | Tempo de espera entre as chamadas. Padrão: 600ms. |



### 🧪 Exemplo de Uso

```dart
class MySearchController with FyDebounceMixin {
  void onTextChanged(String value) {
    debounce(() {
      print("Executando busca para: $value");
    }, duration: Duration(milliseconds: 500));
  }
}
```

> A função só será executada após 500ms desde a última chamada.


### 📌 Considerações Finais

- O mixin cancela a execução anterior se for chamado novamente dentro do período definido.
- Útil para evitar sobrecarga de requisições ou processos pesados.
- Pode ser reutilizado em qualquer classe com `with`.

🔮 **No futuro, poderá incluir funcionalidades como throttle ou cancelamento externo do debounce.**

