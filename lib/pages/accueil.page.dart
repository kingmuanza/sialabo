import 'package:crid/models/emprunt.model.dart';
import 'package:crid/models/materiel.model.dart';
import 'package:crid/pages/emprunt/emprunt.edit.materiel.page.dart';
import 'package:crid/services/emprunt.service.dart';
import 'package:crid/services/materiel.service.dart';
import 'package:flutter/material.dart';

import '../components/menu.gauche.dart';
import '../display/display.emprunt.dart';
import '../display/display.materiel.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  List<Materiel> materiels = [];
  List<Emprunt> emprunts = [];

  @override
  void initState() {
    // TODO: implement initState
    print("Je suis revenu à l'acceuil");
    super.initState();
    materiels = MaterielService().getAll();
    emprunts = EmpruntService().getAll();
    print("emprunts.length _AccueilPageState");
    print(emprunts.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuGauche(),
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (emprunts.length > 0) EmpruntsRecents(emprunts: emprunts),
              Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text("Matériel disponible"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Voir tout"),
                          ),
                        ),
                      ],
                    ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const EmpruntEditMaterielPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class EmpruntsRecents extends StatelessWidget {
  const EmpruntsRecents({
    Key? key,
    required this.emprunts,
  }) : super(key: key);

  final List<Emprunt> emprunts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text("Matériel emprunté récemment"),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextButton(
                onPressed: () {},
                child: Text("Voir tout"),
              ),
            ),
          ],
        ),
        Container(
          height: 400,
          child: ListView.builder(
            itemCount: emprunts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Emprunt emprunt = emprunts[index];
              return DisplayEmprunt(
                emprunt: emprunt,
              );
            },
          ),
        ),
      ],
    );
  }
}
