import 'package:crid/pages/emprunt/emprunt.list.page.dart';
import 'package:crid/pages/materiel/materiel.list.page.dart';
import 'package:flutter/material.dart';

import '../pages/accueil.page.dart';

class MenuGauche extends StatelessWidget {
  const MenuGauche({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          height: 200,
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          child: Center(
            child: Text(
              'SIA LABO',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("Accueil"),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AccueilPage(),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text("Emprunts"),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const EmpruntList(),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text("Materiels"),
          leading: Icon(Icons.microwave),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MaterielListPage(),
              ),
            );
          },
        ),
        Divider(),
      ]),
    );
  }
}
