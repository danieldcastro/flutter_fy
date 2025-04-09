## 📂 FyDirectoryMixin – Mixin para Acesso a Diretórios por Plataforma

### 📖 Descrição

O `FyDirectoryMixin` fornece um método utilitário que retorna o **caminho apropriado de diretório** para armazenar arquivos de forma segura e consistente de acordo com a plataforma atual (Android, iOS, Web ou outras).

Ideal para armazenar arquivos locais, como documentos, logs ou imagens temporárias.



### 🔧 Método Disponível

| Método         | Retorno           | Descrição                                                           |
| -------------- | ----------------- | ------------------------------------------------------------------- |
| `getDirectory` | `Future<String?>` | Retorna o caminho do diretório apropriado para armazenamento local. |

| Plataforma | Diretório Retornado                     |
| ---------- | --------------------------------------- |
| Android    | `getExternalStorageDirectory()`         |
| iOS        | `getApplicationDocumentsDirectory()`    |
| Web        | `null` (sem acesso direto a diretórios) |
| Outros     | `getDownloadsDirectory()`               |



### 🧪 Exemplo de Uso

```dart
class MyStorageService with FyDirectoryMixin {
  Future<void> logDirectory() async {
    final path = await getDirectory();
    print('Diretório atual: $path');
  }
}
```



### 📌 Considerações Finais

- Útil para salvar arquivos no local mais adequado, sem precisar se preocupar com a plataforma.
- Em aplicações web, como não há suporte a diretórios locais, retorna `null`.
- Compatível com desktop (Windows, macOS, Linux), além de mobile.
