import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tuple/tuple.dart';

import '../../domain/responses/request_response.dart';
import '../../helpers/http.dart';
import '../../helpers/http_method.dart';

class AuthenticationAPI {
  final Http _http;
  AuthenticationAPI(this._http);

  Future<Tuple2<RequestResponse, String>> login(
    String user,
    String password,
  ) async {
    final result = await _http.request<String>(
      '/login',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      },
      body: {
        'user': user,
        'pass': password,
      },
      parser: (data) {
        final json = jsonDecode(data);
        return json['token'];
      },
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

  Future<Tuple2<RequestResponse, String>> refreshToken(
    String token,
    String user,
  ) async {
    final result = await _http.request<String>(
      '/refrescarToken',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: {
        'user': user,
      },
      parser: (data) {
        final json = jsonDecode(data);
        return json['token'];
      },
    );

    if (result.error == null) {
      return Tuple2(
        RequestResponse.ok,
        result.data!,
      );
    }

    if (result.statusCode == 401) {
      return const Tuple2(RequestResponse.accessDenied, '');
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return const Tuple2(RequestResponse.networkError, '');
    }

    return Tuple2(RequestResponse.unknownError, result.error!.data);
  }

  Future<Tuple2<RequestResponse, String>> validateToken(
    String token,
    String user,
  ) async {
    final result = await _http.request<String>(
      '/validarToken',
      method: HttpMethod.post,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "Authorization": "Bearer $token",
      },
      body: {
        'user': user,
      },
      parser: (data) {
        return data;
      },
    );

    if (result.error == null) {
      return Tuple2(
        RequestResponse.ok,
        result.data!,
      );
    }

    if (result.statusCode == 401) {
      return const Tuple2(RequestResponse.accessDenied, '');
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return const Tuple2(RequestResponse.networkError, '');
    }

    return Tuple2(RequestResponse.unknownError, result.error!.data);
  }
}
