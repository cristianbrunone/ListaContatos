import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/Common/MyRouters.dart';
import 'package:lista_contatos/items/MyListTile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

enum FormType { login, registrer }

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  FormType formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(10.5, 0.5),
                bottomLeft: Radius.elliptical(350.0, 60.5)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 1, 37, 166),
                    Color.fromARGB(255, 7, 106, 187),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset('assets/imgs/login.png'),
                      height: 180,
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                hintText: 'name@email.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                filled: true,
                                fillColor: Colors.blue[50],
                              ),
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Digite seu e-mail';
                                } else if (!_isValidEmail(email)) {
                                  return 'Digite um e-mail válido';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _senhaController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                hintText: 'Digite sua senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                filled: true,
                                fillColor: Colors.blue[50],
                              ),
                              validator: (senha) {
                                if (senha == null || senha.isEmpty) {
                                  return 'Digite sua Senha';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(
                                      context, ROUTE_LISTCONTATO);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Por favor, complete os campos do E-mail e Senha',
                                    ),
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue[700],
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              child: Text('ENTRAR'),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ROUTE_ADDUSER);
                            },
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }
}
