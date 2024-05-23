import 'package:flutter/material.dart';
import 'package:lista_contatos/Model/Contato.dart';
import 'package:lista_contatos/Pages/AddContato.dart';
import 'package:lista_contatos/Pages/AddUserPage.dart';
import 'package:lista_contatos/Pages/MyListContatoPage.dart';
import 'package:lista_contatos/Pages/MyLogin.dart';

const String ROUTE_HOME = '/home';
const String ROUTE_LOGIN = '/login';
const String ROUTE_ADDUSER = '/add_user';
const String ROUTE_ADDCONTATO = '/add_contato';
const String ROUTE_LISTCONTATO = '/list_contato';

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => MyLogin());
      case '/list_contato':
        return MaterialPageRoute(builder: (_) => MyListContatoPage());
      case '/add_user':
        return MaterialPageRoute(builder: (_) => AddUserPage());
      case '/add_contato':
        return MaterialPageRoute<Contato>(builder: (context) => AddContato());
      default:
        return MaterialPageRoute(builder: (_) => MyLogin());
    }
  }
}
