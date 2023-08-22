import 'package:crid/components/menu.gauche.dart';
import 'package:flutter/material.dart';

import '../../display/display.emprunt.dart';
import '../../models/emprunt.model.dart';
import '../../services/emprunt.service.dart';

class EmpruntList extends StatefulWidget {
  const EmpruntList({super.key});

  @override
  State<EmpruntList> createState() => _EmpruntListState();
}

class _EmpruntListState extends State<EmpruntList> {
  List<Emprunt> emprunts = [];

  @override
  void initState() {
    // TODO: implement initState
    print("Je suis revenu à l'acceuil");
    super.initState();
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
        title: Text('Emprunts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
          ),
        ),
      ),
    );
  }
}
