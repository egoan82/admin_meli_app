import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../global_controller/session_controller.dart';

class SplashController {
  final _sessionController = GetIt.I.get<SessionController>();

  Future<bool> onInit() async {
    final res = await _sessionController.getToken();

    bool estado = false;

    if (res.token != '') {
      final state = JwtDecoder.isExpired(res.token);

      if (!state) {
        _sessionController.session = res;
        estado = true;
      } else {
        _sessionController.logout();
        estado = false;
      }
    }
    return estado;
  }
}
