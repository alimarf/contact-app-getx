import '../values/flavor/flavor.dart';

class AppConfig {
  final AppFlavor flavor;
  final String appName;
  final String appIcon;
  final String apiBaseUrl;
  final String storageUrl;
  final String connectionCheckerUrl;
  final String storageKey;
  final String initializationVector;
  final String secretKey;
  final String staticKey;
  final String version;
  final String storageVersion;

  static AppConfig? _instance;

  AppConfig({
    this.flavor = AppFlavor.dev,
    this.appName = '',
    this.appIcon = '',
    this.apiBaseUrl = '',
    this.storageUrl = '',
    this.connectionCheckerUrl = '',
    this.storageKey = '',
    this.initializationVector = '',
    this.secretKey = '',
    this.staticKey = '',
    this.version = '',
    this.storageVersion = '',
  }) {
    _instance = this;
  }

  static AppConfig get instance => _instance ?? AppConfig();
}
