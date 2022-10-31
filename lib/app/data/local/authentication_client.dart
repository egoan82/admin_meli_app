import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../domain/models/session.dart';
import '../../domain/responses/request_response.dart';
import '../remote/authentication_api.dart';

class AuthenticationClient {
  final FlutterSecureStorage _storage;
  final AuthenticationAPI _apiRest;

  AuthenticationClient(this._storage, this._apiRest);
  Completer? _completer;

  void _complete() {
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.complete();
    }
  }

  Future<Session> get accessToken async {
    if (_completer != null) {
      await _completer!.future;
    }

    _completer = Completer();

    final data = await _storage.read(key: 'AdminMeli');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));

      final result = await _apiRest.validateToken(
        session.token,
        session.user,
      );

      if (result.item1 == RequestResponse.ok) {
        final DateTime currentDate = DateTime.now();
        final DateTime createdAt = session.createdAt;
        final int expiresIn = session.expiresIn;
        final int diff = currentDate.difference(createdAt).inSeconds;

        if ((expiresIn - diff) >= 15) {
          _complete();
          return Session(
            token: session.token,
            expiresIn: session.expiresIn,
            createdAt: session.createdAt,
            user: session.user,
          );
        }

        if (diff >= 172800) {
          _complete();
          return Session(
            token: '',
            expiresIn: 0,
            createdAt: DateTime.now(),
            user: '',
          );
        }

        final result = await _apiRest.refreshToken(
          session.token,
          session.user,
        );

        if (result.item1 == RequestResponse.ok) {
          final json = jsonDecode(result.item2);
          await saveSession(json['token']);
          final dataRefresh = await _storage.read(key: 'AdminMeli');
          if (dataRefresh != null) {
            final sessionRefresh = Session.fromJson(jsonDecode(dataRefresh));
            _complete();
            return sessionRefresh;
          } else {
            _complete();
            return Session(
              token: '',
              expiresIn: 0,
              createdAt: DateTime.now(),
              user: '',
            );
          }
        }
        _complete();

        return Session(
          token: session.token,
          expiresIn: session.expiresIn,
          createdAt: session.createdAt,
          user: session.user,
        );
      }
    }
    _complete();
    return Session(
      token: '',
      expiresIn: 0,
      createdAt: DateTime.now(),
      user: '',
    );
  }

  Future<Session> get getSession async {
    final data = await _storage.read(key: 'AdminMeli');

    if (data != null) {
      final json = jsonDecode(data);
      final session = Session.fromJson(json);
      return session;
    }
    return Session(
      token: '',
      expiresIn: 0,
      createdAt: DateTime.now(),
      user: '',
    );
  }

  Future<void> saveSession(
    String token,
  ) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    final Session session = Session(
      token: token,
      expiresIn: decodedToken['exp'],
      createdAt: DateTime.now(),
      user: decodedToken['user'],
    );

    final data = jsonEncode(session.toJson());
    await _storage.write(key: 'AdminMeli', value: data);
  }

  Future<void> saveInfoDevice(
    String idDevice,
    String tokenDevice,
    String idFireBase,
  ) async {
    final info = {
      'idFireBase': idFireBase,
      'idDevice': idDevice,
      'tokenDevice': tokenDevice,
    };

    final data = jsonEncode(info);
    await _storage.write(key: 'InfoDevice', value: data);
  }

  Future<Map<String, dynamic>> get getInfoDevice async {
    final data = await _storage.read(key: 'InfoDevice');

    if (data != null) {
      final json = jsonDecode(data);
      return json;
    }
    return {};
  }

  Future<void> signOut() async {
    await _storage.deleteAll();
  }
}
