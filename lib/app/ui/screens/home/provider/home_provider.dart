import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/session.dart';
import '../../../global_controller/session_controller.dart';

class HomeProvider with ChangeNotifier {
  final SessionController _sessionController = GetIt.I.get<SessionController>();

  HomeProvider() {
    loadSession();
    session;
  }

  Future<void> loadSession() async {
    await _sessionController.loadSession();
    session = _sessionController.session;
  }

  Session? _session;
  Session? get session => _session;

  set session(Session? s) {
    _session = s;
    notifyListeners();
  }

  Future<void> logout() async {
    await _sessionController.logout();
  }
}
