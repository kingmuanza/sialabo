import 'package:flutter/material.dart';

import '../../display/display.materiel.dart';
import '../../models/materiel.model.dart';
import '../../services/materiel.service.dart';
import 'emprunt.edit.date.page.dart';

class EmpruntEditMaterielPage extends StatefulWidget {
  const EmpruntEditMaterielPage({super.key});

  @override
  State<EmpruntEditMaterielPage> createState() => _EmpruntEditMaterielPageState();
}

class _EmpruntEditMaterielPageState extends State<EmpruntEditMaterielPage> {
  List<Materiel> materiels = [];
  List<int> selectionnes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    materiels = MaterielService().getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nouvel emprunt")),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text("Matériels sélectionnées ${selectionnes.length}"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 1000,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 8,
                  children: List.generate(materiels.length, (index) {
                    Materiel materiel = materiels[index];
                    return InkWell(
                      onTap: () {
                        if (selectionnes.contains(index)) {
                          selectionnes.remove(index);
                        } else {
                          selectionnes.add(index);
                        }
                        setState(() {});
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16, bottom: 16),
                        decoration: BoxDecoration(
                          border:
                              selectionnes.contains(index) ? Border.all(color: Colors.green, width: 4) : Border.all(width: 0, color: Colors.white),
                        ),
                        child: DisplayMateriel(
                          materiel: materiel,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          List<Materiel> resultats = selectionnes.map((e) {
            return materiels[e];
          }).toList();
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => EmpruntEditDatePage(materiels: resultats),
            ),
          );
        },
        label: Text("Suivant"),
      ),
    );
  }
}
