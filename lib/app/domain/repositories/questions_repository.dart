import 'package:tuple/tuple.dart';

import '../responses/request_response.dart';

abstract class QuestionsRepository {
  Future<Tuple2<RequestResponse, String>> getQuestions(
    String user,
    String token,
  );

  Future<Tuple2<RequestResponse, String>> getDetailMco(
    String user,
    String token,
    String mco,
    String store,
  );

  Future<Tuple2<RequestResponse, String>> getFastAnswer(
    String user,
    String token,
  );
}
