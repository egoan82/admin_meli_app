import 'package:tuple/tuple.dart';

import '../responses/request_response.dart';

abstract class AuthenticationRepository {
  Future<Tuple2<RequestResponse, String>> login(
    String user,
    String password,
  );
  Future<Tuple2<RequestResponse, String>> refreshToken(String token);
  Future<Tuple2<RequestResponse, String>> validateToken(String token);
  Future<void> logout();
}
