import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'data/local/authentication_client.dart';
import 'data/remote/authentication_api.dart';
import 'data/remote/questions_api.dart';
import 'data/repositories_impl/authentication_repository_impl.dart';
import 'data/repositories_impl/questions_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/questions_repository.dart';
import 'helpers/http.dart';
import 'ui/global_controller/session_controller.dart';

Future<void> injectDependencies() async {
  final http = Http(
    baseUrl: 'https://admin-meli.malusoft.co/api_app_meli',
  );

  final authApi = AuthenticationAPI(http);

  final authClient = AuthenticationClient(
    const FlutterSecureStorage(),
    authApi,
  );

  GetIt.I.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authApi,
      authClient,
    ),
  );

  GetIt.I.registerLazySingleton<QuestionsRepository>(
    () => QuestionsRepositoryImpl(
      QuestionsApi(http),
    ),
  );

  GetIt.I.registerLazySingleton<AuthenticationClient>(() => authClient);
  GetIt.I.registerLazySingleton<SessionController>(() => SessionController());
}
