import 'dart:convert';
import '../../../domain/entities/router.dart';

class MsRemoteAccountModel {
  final String umToken;

  MsRemoteAccountModel(this.umToken);

  Map<String, dynamic> toMap() {
    return {
      'umToken': umToken,
    };
  }

  factory MsRemoteAccountModel.fromMap(Map<String, dynamic> map) {
    return MsRemoteAccountModel(
      map['umToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MsRemoteAccountModel.fromJson(String source) => MsRemoteAccountModel.fromMap(json.decode(source));

  AccountEntity toEntity() => AccountEntity(umToken);
}