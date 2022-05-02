class Environment {
  static get env => const String.fromEnvironment("ENV");
  static get isLocal => env == "local";
  static get firebaseEmulatorPort => const int.fromEnvironment("FIREBASE_EMULATOR_PORT");
}
