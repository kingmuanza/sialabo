import 'package:crid/models/materiel.model.dart';
import 'package:crid/pages/emprunt/emprunt.view.page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/emprunt.model.dart';

class DisplayEmprunt extends StatelessWidget {
  final Emprunt emprunt;
  const DisplayEmprunt({
    Key? key,
    required this.emprunt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(right: 16, bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => EmpruntViewPage(
                emprunt: emprunt,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 380,
          color: Colors.grey.shade100,
          width: 400,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  // color: Colors.green,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                height: 50,
                child: Center(
                  child: Text(
                    "Muanza Kangudie",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                height: 40,
                child: Center(
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(emprunt.date) + " ---> " + DateFormat('yyyy-MM-dd').format(emprunt.retour),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: List.generate(emprunt.materiels.length, (index) {
                    Materiel materiel = emprunt.materiels[index];
                    return ListTile(
                      dense: true,
                      title: Text(materiel.nom),
                      leading: Icon(Icons.radio_button_unchecked),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
