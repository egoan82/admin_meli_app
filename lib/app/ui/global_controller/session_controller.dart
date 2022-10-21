import 'package:get_it/get_it.dart';

import '../../data/local/authentication_client.dart';
import '../../domain/models/session.dart';

class SessionController {
  final _autenticationClient = GetIt.I.get<AuthenticationClient>();

  SessionController() {
    loadSession();
  }

  Future<void> loadSession() async {
    _session = await _autenticationClient.getSession;
  }

  Session _session = Session(
    token: '',
    expiresIn: 0,
    createdAt: DateTime.now(),
    user: '',
  );

  // ignore: unnecessary_getters_setters
  Session get session => _session;

  set session(Session session) {
    _session = session;
  }

  Future<Session> getToken() async {
    final s = await _autenticationClient.accessToken;
    _session = s;
    return s;
  }

  void reset() {
    _session = Session(
      token: '',
      expiresIn: 0,
      createdAt: DateTime.now(),
      user: '',
    );
  }

  Future<void> logout() async {
    reset();
    await _autenticationClient.signOut();
  }
}
