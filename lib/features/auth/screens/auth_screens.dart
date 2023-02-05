import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Constantes/global_variaveis.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auto-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariaveis.greyBackgroundCOlor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Bem vindo a nossa loja',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Crie sua conta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariaveis.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Form(
                    key: _signUpFormKey,
                    child: Column(),
                  ),
                ListTile(
                  title: const Text(
                    'Entre na sua conta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariaveis.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
