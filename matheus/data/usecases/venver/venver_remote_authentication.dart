import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../domain/entities/router.dart';
import '../../../domain/helpers/domain_error.dart';
import '../../../domain/usecases/router.dart';
import '../../http/http_error.dart';
import '../../http/router.dart';
import '../../models/router.dart';

class VenverRemoteAuthentication implements Authentication {
  final HttpClient httpCliente;
  final String url;

  VenverRemoteAuthentication({@required this.httpCliente, @required this.url});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = VenverRemoteAuthenticationParams.fromDomain(params).toMap();
    try {
      final httpResponse = await httpCliente.request(url: url, method: "post", body: body);
      return VenverRemoteAccountModel.fromMap(httpResponse).toEntity();
    } on HttpError catch(error) {
      throw error == HttpError.unauthorized
        ? DomainError.invalidCredentials
        : DomainError.unexpected;
    }
  }
}

class VenverRemoteAuthenticationParams {
  final String email;
  final String password;

  VenverRemoteAuthenticationParams({
    @required this.email,
    @required this.password
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory VenverRemoteAuthenticationParams.fromMap(Map<String, dynamic> map) {
    return VenverRemoteAuthenticationParams(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VenverRemoteAuthenticationParams.fromJson(String source) => VenverRemoteAuthenticationParams.fromMap(json.decode(source));

  factory VenverRemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
    VenverRemoteAuthenticationParams(email: params.email, password: params.password);
}
