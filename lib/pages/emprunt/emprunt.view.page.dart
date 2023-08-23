import 'package:crid/models/emprunt.model.dart';
import 'package:flutter/material.dart';

import '../../models/materiel.model.dart';

class EmpruntViewPage extends StatefulWidget {
  final Emprunt emprunt;
  const EmpruntViewPage({super.key, required this.emprunt});

  @override
  State<EmpruntViewPage> createState() => _EmpruntViewPageState();
}

class _EmpruntViewPageState extends State<EmpruntViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emprunt")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border(
                top: BorderSide(
                  color: Colors.green,
                ),
              ),
            ),
            height: 80,
            child: Center(
              child: Text(
                "Muanza Kangudie",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
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
                                "20/10/2022",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                        ),
                        Expanded(
                          child: Container(
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
                                "25/10/2022",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: List.generate(widget.emprunt.materiels.length, (index) {
                              Materiel materiel = widget.emprunt.materiels[index];
                              return ListTile(
                                title: Text(materiel.nom),
                                leading: Icon(Icons.radio_button_unchecked),
                              );
                            }),
                          ),
                        ),
                        Container(
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            children: List.generate(widget.emprunt.materiels.length, (index) {
                              Materiel materiel = widget.emprunt.materiels[index];
                              return ListTile(title: Text(materiel.nom));
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
        ],
      ),
    );
  }
}
