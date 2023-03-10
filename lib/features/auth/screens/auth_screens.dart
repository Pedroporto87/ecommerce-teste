import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Constantes/global_variaveis.dart';
import 'package:flutter_ecommerce/comumn/widgets/custom_buttom.dart';
import 'package:flutter_ecommerce/comumn/widgets/custom_textfield.dart';
import 'package:flutter_ecommerce/services/auth_services.dart';


enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auto-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
  authService.signUpUser(context: context, email: _emailController.text, password: _passwordController.text, name: _nameController.text,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariaveis.greyBackgroundCOlor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Bem vindo a nossa loja',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariaveis.backgroundColor
                      : GlobalVariaveis.greyBackgroundCOlor,
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariaveis.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          CustomTextField(
                              controller: _nameController, hintText: 'Nome'),
                          const SizedBox(height: 10),
                          CustomTextField(
                              controller: _emailController, hintText: 'Email'),
                          const SizedBox(height: 10),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: 'Senha'),
                          const SizedBox(height: 10),
                          CustomButtom(
                            text: 'Criar Conta',
                            onTap: () {
                              if( _signUpFormKey.currentState!.validate()){
                                signUpUser();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
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
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariaveis.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          CustomTextField(
                              controller: _emailController, hintText: 'Email'),
                          const SizedBox(height: 10),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: 'Senha'),
                          const SizedBox(height: 10),
                          CustomButtom(
                            text: 'Entrar na Conta',
                            onTap: () {},
                          ),
                        ],
                      ),
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
