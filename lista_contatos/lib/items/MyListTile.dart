import 'package:flutter/material.dart';
import 'package:lista_contatos/Model/Contato.dart';
import 'package:lista_contatos/Pages/DetalhesContato.dart';

typedef VoidCallbackParam(Contato contato);

class MyListTile extends StatelessWidget {
  final Contato contato;
  /*final VoidCallbackParam onRemove;*/
  final VoidCallbackParam onUpdate;

  MyListTile(this.contato, /*this.onRemove,*/ this.onUpdate);

  String getInitials(String firstName, String lastName) {
    String firstInitial =
        firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    String lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return firstInitial + lastInitial;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      selectedTileColor: Colors.red,
      splashColor: Colors.blue,
      title: Text(
        contato.title,
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(contato.telefone),
      /*trailing: InkWell(
        onTap: () => onRemove(contato),
        child: Icon(Icons.close),
      ),*/
      leading: CircleAvatar(
        child: Text(getInitials(contato.title, contato.subtitle)),
      ),
      onTap: () async {
        final updatedContato = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesContato(contato: contato),
          ),
        );
        if (updatedContato != null) {
          onUpdate(updatedContato);
        }
      },
    );
  }
}
