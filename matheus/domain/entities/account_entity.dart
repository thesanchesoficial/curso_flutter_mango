import 'dart:convert';

class AccountEntity {
  final String token;

  AccountEntity(this.token);

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory AccountEntity.fromMap(Map<String, dynamic> map) {
    return AccountEntity(
      map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountEntity.fromJson(String source) => AccountEntity.fromMap(json.decode(source));
}
