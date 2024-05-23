import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController repeatpasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                validator: (value) {
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regExp = new RegExp(pattern);
                  if (value?.length == 0) {
                    return "O E-mail é necessario";
                  } else if (!regExp.hasMatch(value.toString())) {
                    return "O E-mail é invalido";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                validator: (value) {
                  if (value!.length < 6) {
                    return "A senha deve ser maior de 6 digitos";
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: repeatpasswordCtrl,
                decoration: InputDecoration(
                    labelText: "Repetir Senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                validator: (value) {
                  if (value != passwordCtrl.text.toString()) {
                    return "As senhas não são iguais";
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => save(),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }

  save() {
    if (formKey.currentState!.validate()) {
      print("Email ${emailCtrl.text}");
      print("Password ${passwordCtrl.text}");
      formKey.currentState!.reset();
    }
  }
}
