import 'dart:convert';
import 'dart:developer';
import 'package:mobile_registry/domain/authentication/data/models/login_response_dto.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_registry/shared_library/utils/constants.dart';

class AuthenticationRemoteDatasource {
  final http.Client client;
  AuthenticationRemoteDatasource({
    required this.client,
  });

  Future<LoginResponseDTO> login(String email, String password) async {
    Map<String, String> query = {
      'email': email,
      'password': password,
    };

    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.login,
      query,
    );

    try {
      final response = await client.post(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        log('[REMOTE TOKEN] : ${LoginResponseDTO.fromJson(json.decode(response.body)).accessToken.toString()}');
        return LoginResponseDTO.fromJson(json.decode(response.body));
      } else {
        log('[REMOTE NOT SUCCESS] : ${json.decode(response.body)['message'].toString()}');
        throw APIException(
            json.decode(response.body)['message'], response.statusCode);
      }
    } catch (error) {
      log('[REMOTE ERROR] : ${error.toString()}');
      rethrow;
    }
  }
}
