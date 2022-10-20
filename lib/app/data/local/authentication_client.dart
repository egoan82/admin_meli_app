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

    final data = await _storage.read(key: 'EquipoW');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));

      final result = await _apiRest.validateToken(
        session.token,
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
            rol: session.rol,
            name: session.name,
          );
        }

        if (diff >= 172800) {
          _complete();
          return Session(
            token: '',
            expiresIn: 0,
            createdAt: DateTime.now(),
            user: '',
            rol: '',
            name: '',
          );
        }

        final result = await _apiRest.refreshToken(
          session.token,
        );

        if (result.item1 == RequestResponse.ok) {
          final json = jsonDecode(result.item2);
          await saveSession(json['token']);
          final dataRefresh = await _storage.read(key: 'EquipoW');
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
              rol: '',
              name: '',
            );
          }
        }
        _complete();

        return Session(
          token: session.token,
          expiresIn: session.expiresIn,
          createdAt: session.createdAt,
          user: session.user,
          rol: session.rol,
          name: session.name,
        );
      }
    }
    _complete();
    return Session(
      token: '',
      expiresIn: 0,
      createdAt: DateTime.now(),
      user: '',
      rol: '',
      name: '',
    );
  }

  Future<Session> get getSession async {
    final data = await _storage.read(key: 'EquipoW');

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
      rol: '',
      name: '',
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
      rol: decodedToken['rol'],
      name: decodedToken['name'],
    );

    final data = jsonEncode(session.toJson());
    await _storage.write(key: 'EquipoW', value: data);
  }

  Future<void> signOut() async {
    await _storage.delete(key: 'EquipoW');
  }
}
