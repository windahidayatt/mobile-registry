import 'dart:convert';
import 'dart:developer';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/network/http_handler.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class OperativeRemoteDatasource {
  final HttpHandler httpHandler;
  OperativeRemoteDatasource({
    required this.httpHandler,
  });

  Future<List<PreOperativeResponseDTO>> getPreOperatives() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.preOperatives);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return preOperativeResponseDtoFromJson(response.body);
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

  Future<List<IntraOperativeResponseDTO>> getIntraOperatives() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.intraOperatives);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return intraOperativeResponseDtoFromJson(response.body);
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
