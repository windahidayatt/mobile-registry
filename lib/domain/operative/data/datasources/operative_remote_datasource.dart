import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/post_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_patients_response_dto.dart';
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

  Future<bool> addPreOperative() async {
    Uri uri = Uri.http(Constants.reAPI.endpoint, Constants.reAPI.addPreOperative);
    final msg = jsonEncode({
      'patient': 'Amelia H / RS Santosa Central / 12213444',
      'type': 'Shoulder',
      'vas_score': '100',
      'forward_flexion': '90',
      'abduction_degree': '20',
      'external_rotation_neutral': '50',
      'external_rotation_90_abduction': '90',
      'internal_rotation': '100',
      'ases_score': '455',
      'dash_score': '100',
      'action_plan': 'Bingo',
      'planned_date': '12/03/2022',
      'progess_support_investigation': '1',
      'progess_bpjs_billing': '1',
      'progess_anesthesia': '1',
      'progess_complete': '1',

      'shoulder_special_test_form': '1',
      'shouler_neer': '1',
      'shouler_jobe': '1',
      'shouler_hawkins': '1',
      'ext_rotation_lag': '1',
      'hornblower': '1',
      'belly_press': '1',
      'belly_off': '1',
      'lift_off': '1',
      'bear_hug': '1',
      'obrient': '1',
      'throwing': '1',
      'speed': '1',
      'anterior_apprehension': '1',
      'posterior_apprehension': '1',
      'load_shift': '1',
      'sulcus_sign': '1',
      'posterior_jerk': '1',
      'ases_score_file': '',
      'x_ray_file': '',
      'ct_scan_file': '',
      'mri_file': '',
    });
    try {
      final response = await httpHandler.post(uri, msg);
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
}
