import 'package:crid/components/menu.gauche.dart';
import 'package:flutter/material.dart';

import '../../display/display.materiel.dart';
import '../../models/materiel.model.dart';
import '../../services/materiel.service.dart';

class MaterielListPage extends StatefulWidget {
  const MaterielListPage({super.key});

  @override
  State<MaterielListPage> createState() => _MaterielListPageState();
}

class _MaterielListPageState extends State<MaterielListPage> {
  List<Materiel> materiels = [];

  @override
  void initState() {
    // TODO: implement initState
    print("Je suis revenu à l'acceuil");
    super.initState();
    materiels = MaterielService().getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuGauche(),
      appBar: AppBar(
        title: Text("Matériels"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 32.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 1000,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 8,
                  children: List.generate(materiels.length, (index) {
                    Materiel materiel = materiels[index];
                    return DisplayMateriel(
                      materiel: materiel,
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
