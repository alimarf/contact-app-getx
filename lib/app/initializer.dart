import 'modules/auth/initializer.dart';

class AppInitializer {
  AppInitializer();

  Future<void> run() async {
    await AuthInitializer().run();
  }
}
