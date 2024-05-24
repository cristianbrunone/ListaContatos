import 'package:flutter/material.dart';
import 'package:lista_contatos/Model/Contato.dart';

class DetalhesContato extends StatefulWidget {
  final Contato contato;

  DetalhesContato({required this.contato});

  @override
  _DetalhesContatoState createState() => _DetalhesContatoState();
}

class _DetalhesContatoState extends State<DetalhesContato> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _subtitle;
  late String _telefone;
  late String _cep;
  late String _email;

  @override
  void initState() {
    super.initState();
    _name = widget.contato.title;
    _subtitle = widget.contato.subtitle;
    _telefone = widget.contato.telefone;
    _cep = widget.contato.cep;
    _email = widget.contato.email;
  }

  void _saveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.of(context).pop(
        Contato(
            title: _name,
            subtitle: _subtitle,
            telefone: _telefone,
            cep: _cep,
            email: _email),
      );
    }
  }

  String getInitials(String firstName, String lastName) {
    String firstInitial =
        firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    String lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return firstInitial + lastInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 42, 187),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Detalhes do Contato',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromARGB(221, 59, 141, 242),
                  child: Text(
                    getInitials(widget.contato.title, widget.contato.subtitle),
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  initialValue: _subtitle,
                  decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um sobrenome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _subtitle = value!;
                  },
                ),
                TextFormField(
                  initialValue: _telefone,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    prefixIcon: Icon(Icons.phone, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um telefone';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _telefone = value!;
                  },
                ),
                TextFormField(
                  initialValue: _cep,
                  decoration: InputDecoration(
                    labelText: 'CEP',
                    prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um CEP';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cep = value!;
                  },
                ),
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um E-mail';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
