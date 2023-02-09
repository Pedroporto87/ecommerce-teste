import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/Constantes/showSnackBar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch(response.statusCode){
    case 200:
    onSuccess();
    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)['err']);
    break;
    case 500:
    showSnackBar(context, jsonDecode(response.body)['err']);
    break;
    default:
    showSnackBar(context, response.body);
  }
  }