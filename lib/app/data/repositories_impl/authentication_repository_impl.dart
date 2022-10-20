import 'package:tuple/tuple.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/responses/request_response.dart';
import '../local/authentication_client.dart';
import '../remote/authentication_api.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _api;
  final AuthenticationClient _authClient;

  AuthenticationRepositoryImpl(this._api, this._authClient);

  @override
  Future<Tuple2<RequestResponse, String>> login(
    String user,
    String password,
  ) async {
    final result = await _api.login(user, password);
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> refreshToken(String token) async {
    final result = await _api.refreshToken(token);
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> validateToken(String token) async {
    final result = await _api.refreshToken(token);
    return result;
  }

  @override
  Future<void> logout() {
    return _authClient.signOut();
  }
}
