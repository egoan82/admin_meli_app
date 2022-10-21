import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/responses/request_response.dart';

class LoginController with ChangeNotifier {
  final _auth = GetIt.I.get<AuthenticationRepository>();

  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  TextEditingController get user => _user;
  TextEditingController get pass => _pass;

  Future<RequestResponse> login() async {
    final result = await _auth.login(_user.text, _pass.text);
    return result.item1;
  }
}
