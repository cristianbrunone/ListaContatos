import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/Common/MyRouters.dart';
import 'package:lista_contatos/Model/Contato.dart';
import 'package:lista_contatos/items/ListContatos.dart';
import 'package:lista_contatos/items/MyListTile.dart';

class MyListContatoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyListContatoPageState();
}

class MyListContatoPageState extends State<MyListContatoPage> {
  List<Contato> myContatos = [];

  @override
  void initState() {
    myContatos = contatos;
    super.initState();
  }

  void _runSearch(String enteredKeyboard) {
    List<Contato> results = [];
    if (enteredKeyboard.isEmpty) {
      results = contatos;
    } else {
      results = contatos
          .where((Contato) =>
              Contato.title
                  .toLowerCase()
                  .contains(enteredKeyboard.toLowerCase()) ||
              Contato.telefone.contains(enteredKeyboard.toLowerCase()))
          .toList();
    }

    setState(() {
      myContatos = results;
    });
  }

  void _removeContato(Contato contato) {
    setState(() {
      myContatos.remove(contato);
    });
  }

  void _addContato(Contato contato) {
    setState(() {
      myContatos.add(contato);
    });
  }

  void _updateContato(Contato updatedContato) {
    setState(() {
      int index = myContatos
          .indexWhere((contato) => contato.telefone == updatedContato.telefone);
      if (index != -1) {
        myContatos[index] = updatedContato;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () async {
          final newContato =
              await Navigator.pushNamed<Contato>(context, ROUTE_ADDCONTATO);
          if (newContato != null) {
            _addContato(newContato);
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 42, 187),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Lista Contatos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              onChanged: _runSearch,
              decoration: InputDecoration(
                labelText: 'Buscar...',
                prefixIcon:
                    Icon(Icons.search, color: Color.fromARGB(255, 1, 42, 187)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListContatos(
              contatos: myContatos,
              onRemove: _removeContato,
              onUpdate: _updateContato,
            ),
          ),
        ],
      ),
    );
  }
}

class ListContatos extends StatelessWidget {
  final List<Contato> contatos;
  final Function(Contato) onRemove;
  final Function(Contato) onUpdate;

  ListContatos(
      {required this.contatos, required this.onRemove, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          Contato contato = contatos[index];
          return Dismissible(
            key: ObjectKey(contato),
            child: MyListTile(contato, /*onRemove,*/ onUpdate),
            onDismissed: (direction) {
              onRemove(contato);
            },
          );
        },
      ),
    );
  }
}
