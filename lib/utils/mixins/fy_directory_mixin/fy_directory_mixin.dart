import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_fy/utils/fy_platform.dart';
import 'package:path_provider/path_provider.dart';

/// Mixin que fornece um método para obter o diretório adequado conforme a plataforma.
///
/// Esse método retorna um caminho de diretório específico para armazenar arquivos,
/// dependendo do sistema operacional:
///
/// - **Android**: Retorna o diretório de armazenamento externo.
/// - **iOS**: Retorna o diretório de documentos do aplicativo.
/// - **Web**: Retorna `null`, pois não há acesso direto a diretórios locais.
/// - **Outras plataformas**: Retorna o diretório de downloads.
///
/// Exemplo de uso:
/// ```dart
/// class MyClass with FyDirectoryMixin {
///   Future<void> printDirectory() async {
///     String? dir = await getDirectory();
///     print(dir);
///   }
/// }
/// ```
mixin FyDirectoryMixin {
  /// Retorna o caminho do diretório apropriado para armazenamento na plataforma atual.
  static Future<String?> getDirectory() async {
    String? externalStorageDirPath;

    if (FyPlatform.isAndroid) {
      final directory = await getExternalStorageDirectory();
      externalStorageDirPath = directory?.path;
    } else if (FyPlatform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    } else if (kIsWeb) {
      return null;
    } else {
      final Directory? downloadsDir = await getDownloadsDirectory();
      externalStorageDirPath = downloadsDir?.path;
    }
    return externalStorageDirPath;
  }
}
