// To parse this JSON data, do
//
//     final loginResponseDto = loginResponseDtoFromJson(jsonString);

import 'dart:convert';

LoginResponseDTO loginResponseDtoFromJson(String str) => LoginResponseDTO.fromJson(json.decode(str));

String loginResponseDtoToJson(LoginResponseDTO data) => json.encode(data.toJson());

class LoginResponseDTO {
  LoginResponseDTO({
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });

  String message;
  String accessToken;
  String tokenType;

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) => LoginResponseDTO(
    message: json["message"],
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "access_token": accessToken,
    "token_type": tokenType,
  };
}
