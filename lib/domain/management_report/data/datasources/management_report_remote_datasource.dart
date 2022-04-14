import 'dart:convert';
import 'dart:developer';
import 'package:mobile_registry/domain/management_report/data/models/domain_case_response_dto.dart';
import 'package:mobile_registry/domain/management_report/data/models/patient_response_dto.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/network/http_handler.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class ManagementReportRemoteDatasource {
  final HttpHandler httpHandler;
  ManagementReportRemoteDatasource({
    required this.httpHandler,
  });

  Future<List<PatientResponseDTO>> getPatients() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.patient);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return patientResponseListDtoFromJson(response.body);
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

  Future<PatientResponseDTO> getPatient(String id) async {
    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.patient + '/$id',
    );
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return PatientResponseDTO.fromJson(json.decode(response.body));
      } else {
        log('[REMOTE NOT SUCCESS] : ${json.decode(response.body)['message'].toString()}');
        throw APIException(json.decode(response.body)['message'], response.statusCode);
      }
    } catch (error) {
      log('[REMOTE ERROR] : ${error.toString()}');
      rethrow;
    }
  }

  Future<List<DomainCaseResponseDTO>> getDomainCase() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.domainCase);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return domainCaseResponseListDtoFromJson(response.body);
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
