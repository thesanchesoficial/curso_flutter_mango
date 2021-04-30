import 'package:flutter/material.dart';
import '../entities/router.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required String email,
    @required String password
  });
}