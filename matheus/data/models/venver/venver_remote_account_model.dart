import 'dart:convert';
import '../../../domain/entities/router.dart';
import '../../http/http_error.dart';

class VenverRemoteAccountModel {
  final String accessToken;

  VenverRemoteAccountModel(this.accessToken);

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
    };
  }

  factory VenverRemoteAccountModel.fromMap(Map<String, dynamic> map) {
    if(!map.containsKey("accessToken")) {
      throw HttpError.invalidData;
    }
    return VenverRemoteAccountModel(
      map['accessToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VenverRemoteAccountModel.fromJson(String source) => VenverRemoteAccountModel.fromMap(json.decode(source));

  AccountEntity toEntity() => AccountEntity(accessToken);
}
