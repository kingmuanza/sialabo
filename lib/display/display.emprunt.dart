import 'package:crid/models/materiel.model.dart';
import 'package:crid/pages/emprunt/emprunt.view.page.dart';
import 'package:flutter/material.dart';

import '../models/emprunt.model.dart';

class DisplayEmprunt extends StatelessWidget {
  final Emprunt emprunt;
  const DisplayEmprunt({
    Key? key,
    required this.emprunt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const EmpruntViewPage(),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(right: 16, bottom: 16),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 380,
          color: Colors.grey.shade100,
          width: 200,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: 40,
                child: Center(
                  child: Text(
                    "20/10/2022",
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
                    return Text(materiel.nom);
                  }),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                height: 40,
                child: Center(
                  child: Text(
                    "25/10/2022",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border(
                    top: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                height: 40,
                child: Center(
                  child: Text(
                    "Muanza Kangudie",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
