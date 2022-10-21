import 'package:tuple/tuple.dart';

import '../responses/request_response.dart';

abstract class AuthenticationRepository {
  Future<Tuple2<RequestResponse, String>> login(
    String user,
    String password,
  );
  Future<Tuple2<RequestResponse, String>> refreshToken(
    String token,
    String user,
  );
  Future<Tuple2<RequestResponse, String>> validateToken(
    String token,
    String user,
  );
  Future<void> logout();
}
