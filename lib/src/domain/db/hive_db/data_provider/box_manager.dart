import 'package:hive/hive.dart';

class BoxManager {
  static final instance = BoxManager._();

  BoxManager._();

  Future<Box<String>> openSettingsBox() async {
    return Hive.openBox<String>('settings');
  }

  Future<void> closeBox(Box box) async {
    await box.compact();
    await box.close();
  }
}
