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
    if (result.item1 == RequestResponse.ok) {
      final token = result.item2.split(' ')[1];
      await _authClient.saveSession(token);
    }
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> refreshToken(
    String token,
    String user,
  ) async {
    final result = await _api.refreshToken(
      token,
      user,
    );
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> validateToken(
    String token,
    String user,
  ) async {
    final result = await _api.refreshToken(
      token,
      user,
    );
    return result;
  }

  @override
  Future<void> logout() {
    return _authClient.signOut();
  }
}
