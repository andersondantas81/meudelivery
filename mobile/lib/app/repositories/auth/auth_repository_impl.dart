import 'dart:developer';

import 'package:meu_delivery/app/core/rest_client/rest_client.dart';
import 'package:meu_delivery/app/models/user_model.dart';
import 'package:meu_delivery/app/repositories/auth/auth_repository.dart';

import '../../core/exceptions/user_notfound_exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post(
        '/auth/register', {'name': name, 'email': email, 'password': password});

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(message, error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient
        .post('/auth/', {'email': email, 'password': password});

    if (result.hasError) {
      if (result.statusCode == 403) {
        log('usuário ou senha inválidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotfoundException();
      }

      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusCode,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário');
    }
    return UserModel.fromJson(result.body);
  }
}