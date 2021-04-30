import 'dart:convert';
import '../../../domain/entities/router.dart';

class VenverRemoteAccountModel {
  final String accessToken;

  VenverRemoteAccountModel(this.accessToken);

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
    };
  }

  factory VenverRemoteAccountModel.fromMap(Map<String, dynamic> map) {
    return VenverRemoteAccountModel(
      map['accessToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VenverRemoteAccountModel.fromJson(String source) => VenverRemoteAccountModel.fromMap(json.decode(source));

  AccountEntity toEntity() => AccountEntity(accessToken);
}
