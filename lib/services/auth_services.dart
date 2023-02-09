import 'dart:convert';
import 'package:flutter_ecommerce/models/user.dart';
import 'package:http/http.dart' as http; 
import 'package:flutter_ecommerce/Constantes/global_variaveis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth/screens/auth_screens.dart';
import 'package:flutter_ecommerce/Constantes/error_handling.dart';
import 'package:flutter_ecommerce/Constantes/showSnackBar.dart';



class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}