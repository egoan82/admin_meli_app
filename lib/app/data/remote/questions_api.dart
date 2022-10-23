import 'dart:async';
import 'dart:io';

import 'package:tuple/tuple.dart';

import '../../domain/responses/request_response.dart';
import '../../helpers/http.dart';
import '../../helpers/http_method.dart';

class QuestionsApi {
  final Http _http;
  QuestionsApi(this._http);

  Future<Tuple2<RequestResponse, String>> getQuestions(
    String user,
    String token,
  ) async {
    final result = await _http.request<String>(
      '/getQuestions',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: {
        'user': user,
      },
      parser: null,
    );

    if (result.error == null) {
      return Tuple2(
        RequestResponse.ok,
        result.data ?? '',
      );
    }

    if (result.statusCode == 401) {
      return Tuple2(RequestResponse.accessDenied, result.error!.data ?? '');
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return Tuple2(RequestResponse.networkError, result.error!.data ?? '');
    }

    return Tuple2(RequestResponse.unknownError, result.error!.data ?? '');
  }

  Future<Tuple2<RequestResponse, String>> getDetailMco(
    String user,
    String token,
    String mco,
    String store,
  ) async {
    final result = await _http.request<String>(
      '/getDetailMco',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: {
        'user': user,
        'mco': mco,
        'nick': store,
      },
      parser: null,
    );

    if (result.error == null) {
      return Tuple2(
        RequestResponse.ok,
        result.data ?? '',
      );
    }

    if (result.statusCode == 401) {
      return Tuple2(RequestResponse.accessDenied, result.error!.data ?? '');
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return Tuple2(RequestResponse.networkError, result.error!.data ?? '');
    }

    return Tuple2(RequestResponse.unknownError, result.error!.data ?? '');
  }

  Future<Tuple2<RequestResponse, String>> getFastAnswer(
    String user,
    String token,
  ) async {
    final result = await _http.request<String>(
      '/fastAnswer',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: {
        'user': user,
      },
      parser: null,
    );

    if (result.error == null) {
      return Tuple2(
        RequestResponse.ok,
        result.data ?? '',
      );
    }

    if (result.statusCode == 401) {
      return Tuple2(RequestResponse.accessDenied, result.error!.data ?? '');
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return Tuple2(RequestResponse.networkError, result.error!.data ?? '');
    }

    return Tuple2(RequestResponse.unknownError, result.error!.data ?? '');
  }
}
