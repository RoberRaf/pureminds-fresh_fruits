class SessionData {
  static SessionData? _inst;
  SessionData._();

  static SessionData get instance => (_inst ??= SessionData._());
}
