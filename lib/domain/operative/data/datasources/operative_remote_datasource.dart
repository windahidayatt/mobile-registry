import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/post_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_add_request_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_patients_response_dto.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/network/http_handler.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';
import 'package:http/http.dart' as http;

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
    Uri uri =
        Uri.http(Constants.reAPI.endpoint, Constants.reAPI.intraOperatives);
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

  Future<List<PostOperativeResponseDTO>> getPostOperatives() async {
    Uri uri =
        Uri.http(Constants.reAPI.endpoint, Constants.reAPI.postOperatives);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return postOperativeResponseDtoFromJson(response.body);
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

  Future<List<PrePatientsResponseDTO>> getPrePatients() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.prePatients);
    try {
      final response = await httpHandler.get(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return prePatientsResponseDtoFromJsonArray(response.body);
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

  Future<bool> addPreOperative(PreOperativeAddRequestDTO dto) async {
    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.addPreOperative,
    );
    try {
      List<http.MultipartFile> images = [];
      if (dto.asesScoreFile?.isNotEmpty ?? false) {
        images.add(
          await http.MultipartFile.fromPath(
            'ases_score_file',
            Uri.file(dto.asesScoreFile!).toFilePath(),
          ),
        );
      }
      if (dto.xRayFile?.isNotEmpty ?? false) {
        images.add(
          await http.MultipartFile.fromPath(
            'x_ray_file',
            Uri.file(dto.xRayFile!).toFilePath(),
          ),
        );
      }
      if (dto.ctScanFile?.isNotEmpty ?? false) {
        images.add(
          await http.MultipartFile.fromPath(
            'ct_scan_file',
            Uri.file(dto.ctScanFile!).toFilePath(),
          ),
        );
      }
      if (dto.mriFile?.isNotEmpty ?? false) {
        images.add(
          await http.MultipartFile.fromPath(
            'mri_file',
            Uri.file(dto.mriFile!).toFilePath(),
          ),
        );
      }

      final response = await httpHandler.post(uri, dto.toJson(),
          modifyHeader: (images.isNotEmpty)
              ? {
                  'Content-Type': 'multipart/form-data',
                }
              : null,
          images: images);

      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return true;
      } else {
        log(response.statusCode.toString());
        log('[REMOTE NOT SUCCESS] : ${json.decode(response.body)['message'].toString()}');
        throw APIException(
            json.decode(response.body)['message'], response.statusCode);
      }
    } catch (error) {
      log('[REMOTE ERROR] : ${error.toString()}');
      rethrow;
    }
  }

  Future<bool> deletePreOperative(String id) async {
    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.preOperatives + '/$id',
    );
    try {
      final response = await httpHandler.delete(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return true;
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

  Future<bool> deleteIntraOperative(String id) async {
    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.intraOperatives + '/$id',
    );
    try {
      final response = await httpHandler.delete(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return true;
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

  Future<bool> deletePostOperative(String id) async {
    Uri uri = Uri.http(
      Constants.reAPI.endpoint,
      Constants.reAPI.postOperatives + '/$id',
    );
    try {
      final response = await httpHandler.delete(uri);
      log('[REMOTE] : ${uri.toString()}');
      if (response.statusCode == 200) {
        return true;
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
