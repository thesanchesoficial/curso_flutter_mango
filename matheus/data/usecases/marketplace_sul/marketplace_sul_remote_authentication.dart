import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../domain/usecases/router.dart';
import '../../http/router.dart';

class MsRemoteAuthentication {
  final HttpClient httpCliente;
  final String url;

  MsRemoteAuthentication({@required this.httpCliente, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = MsRemoteAuthenticationParams.fromDomain(params).toMap();
    await httpCliente.request(url: url, method: "post", body: body);
  }
}

class MsRemoteAuthenticationParams {
  final String email;
  final String senha;

  MsRemoteAuthenticationParams({
    @required this.email,
    @required this.senha
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': senha,
    };
  }

  factory MsRemoteAuthenticationParams.fromMap(Map<String, dynamic> map) {
    return MsRemoteAuthenticationParams(
      email: map['email'],
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MsRemoteAuthenticationParams.fromJson(String source) => MsRemoteAuthenticationParams.fromMap(json.decode(source));

  factory MsRemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
    MsRemoteAuthenticationParams(email: params.email, senha: params.password);
}
