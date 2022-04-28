import 'dart:convert';

import 'package:mobile_registry/shared_library/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  final SharedPreferences sharedPreferences;
  final http.Client client;
  HttpHandler({
    required this.sharedPreferences,
    required this.client,
  });

  Future<http.Response> get(Uri url) {
    Map<String, String> httpHeaders = _setHeader();
    return http.get(url, headers: httpHeaders);
  }

  Future<http.Response> post(
    Uri url,
    Object body,
  ) {
    Map<String, String> httpHeaders = _setHeader();
    return http.post(
      url,
      headers: httpHeaders,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> put(
    Uri url,
    Object body,
  ) {
    Map<String, String> httpHeaders = _setHeader();
    return http.put(
      url,
      headers: httpHeaders,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(Uri url) {
    Map<String, String> httpHeaders = _setHeader();
    return http.delete(url, headers: httpHeaders);
  }

  Map<String, String> _setHeader() {
    String? token = sharedPreferences.getString(Constants.reCached.token);
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + (token ?? ""),
    };
  }
}
