import 'package:tuple/tuple.dart';

import '../../domain/repositories/questions_repository.dart';
import '../../domain/responses/request_response.dart';
import '../remote/questions_api.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  final QuestionsApi _api;

  QuestionsRepositoryImpl(this._api);

  @override
  Future<Tuple2<RequestResponse, String>> getQuestions(
    String user,
    String token,
  ) async {
    final result = await _api.getQuestions(
      user,
      token,
    );
    if (result.item1 == RequestResponse.ok) {}
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> getDetailMco(
    String user,
    String token,
    String mco,
    String store,
  ) async {
    final result = await _api.getDetailMco(
      user,
      token,
      mco,
      store,
    );
    if (result.item1 == RequestResponse.ok) {}
    return result;
  }

  @override
  Future<Tuple2<RequestResponse, String>> getFastAnswer(
    String user,
    String token,
  ) async {
    final result = await _api.getFastAnswer(
      user,
      token,
    );
    if (result.item1 == RequestResponse.ok) {}
    return result;
  }
}
