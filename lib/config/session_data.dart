import 'package:pure_minds/features/auth/data/user_model.dart';

class SessionData {
  static SessionData? _inst;
  SessionData._();

  static SessionData get instance => (_inst ??= SessionData._());

  UserModel? user;
}
