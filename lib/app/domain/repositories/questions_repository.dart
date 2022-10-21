import 'package:tuple/tuple.dart';

import '../responses/request_response.dart';

abstract class QuestionsRepository {
  Future<Tuple2<RequestResponse, String>> getQuestions(
    String user,
    String token,
  );
}
