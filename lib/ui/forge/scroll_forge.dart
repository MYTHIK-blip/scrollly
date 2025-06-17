import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ScrollForge {
  /// Generates a plain text file representing the scroll.
  /// Returns the file path for sharing or storage.
  Future<String> forgeScroll({
    required String productType,
    required String themeColor,
  }) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/scrolly_${DateTime.now().millisecondsSinceEpoch}.txt';
    final file = File(path);

    final content = '''
📜 SCROLLLY SCROLL 📜

Product Type: $productType
Theme Color: $themeColor

This is your civic artifact.
''';

    await file.writeAsString(content);
    return path;
  }
}
