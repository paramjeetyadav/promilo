import 'dart:convert';

class LoginResponseModel {
  final Status? status;
  final Response? response;

  LoginResponseModel({
    this.status,
    this.response,
  });

  LoginResponseModel copyWith({
    Status? status,
    Response? response,
  }) =>
      LoginResponseModel(
        status: status ?? this.status,
        response: response ?? this.response,
      );

  factory LoginResponseModel.fromRawJson(String str) => LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        response: json["response"] == null ? null : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "response": response?.toJson(),
      };
}

class Response {
  final String? accessToken;
  final String? tokenType;
  final String? refreshToken;
  final int? expiresIn;
  final String? scope;
  final List<dynamic>? userRole;
  final String? tenantName;
  final String? userType;
  final String? userId;
  final String? userName;
  final dynamic primary;

  Response({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.userRole,
    this.tenantName,
    this.userType,
    this.userId,
    this.userName,
    this.primary,
  });

  Response copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
    List<dynamic>? userRole,
    String? tenantName,
    String? userType,
    String? userId,
    String? userName,
    dynamic primary,
  }) =>
      Response(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        refreshToken: refreshToken ?? this.refreshToken,
        expiresIn: expiresIn ?? this.expiresIn,
        scope: scope ?? this.scope,
        userRole: userRole ?? this.userRole,
        tenantName: tenantName ?? this.tenantName,
        userType: userType ?? this.userType,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        primary: primary ?? this.primary,
      );

  factory Response.fromRawJson(String str) => Response.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
        userRole: json["user_role"] == null ? [] : List<dynamic>.from(json["user_role"]!.map((x) => x)),
        tenantName: json["tenant_name"],
        userType: json["user_type"],
        userId: json["user_id"],
        userName: json["user_name"],
        primary: json["primary"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
        "user_role": userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x)),
        "tenant_name": tenantName,
        "user_type": userType,
        "user_id": userId,
        "user_name": userName,
        "primary": primary,
      };
}

class Status {
  final int? code;
  final dynamic message;

  Status({
    this.code,
    this.message,
  });

  Status copyWith({
    int? code,
    dynamic message,
  }) =>
      Status(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
