import 'package:crid/models/emprunt.model.dart';
import 'package:crid/models/materiel.model.dart';
import 'package:crid/models/personnel.model.dart';
import 'package:crid/pages/accueil.page.dart';
import 'package:crid/services/emprunt.service.dart';
import 'package:crid/services/personnel.service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmpruntEditDatePage extends StatefulWidget {
  final List<Materiel> materiels;
  const EmpruntEditDatePage({super.key, required this.materiels});

  @override
  State<EmpruntEditDatePage> createState() => _EmpruntEditDatePageState();
}

class _EmpruntEditDatePageState extends State<EmpruntEditDatePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController retourController = TextEditingController();
  List<Personnel> personnels = [];
  List<int> selectionnes = [];

  DateTime? date;
  DateTime? retour;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.personnels = PersonnelService().getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dates et personnel"),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 80,
            child: Center(child: Text("Matériels sélectionnées : ${widget.materiels.length}")),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Date d'emprunt", //label text of field
                    ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        date = pickedDate;
                        print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd')
                            .format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        setState(() {
                          dateController.text = formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: retourController, //editing controller of this TextField
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Date de retour", //label text of field
                    ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        retour = pickedDate;
                        print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd')
                            .format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        setState(() {
                          retourController.text = formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32, left: 16),
            width: double.infinity,
            child: Text("Personnel"),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 16),
            child: Row(
              children: List.generate(personnels.length, (index) {
                Personnel personnel = personnels[index];
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      if (selectionnes.contains(index)) {
                        selectionnes.remove(index);
                      } else {
                        selectionnes = [index];
                      }
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: selectionnes.contains(index) ? Border.all(color: Colors.green, width: 4) : Border.all(width: 0, color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(personnel.nomComplet),
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (retour != null && date != null) {
            if (retour!.isAfter(date!)) {
              if (selectionnes.length > 0) {
                List<Personnel> resultats = selectionnes.map((e) {
                  return personnels[e];
                }).toList();
                Emprunt emprunt = Emprunt();
                emprunt.date = date!;
                emprunt.retour = retour!;
                emprunt.materiels = widget.materiels;
                emprunt.retournee = false;
                emprunt.personnel = personnels[0];

                EmpruntService().add(emprunt);

                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AccueilPage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Veuillez sélectionner le personnel"),
                ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("La date de retour n'est pas valide"),
              ));
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Veuillez remplir toute les dates"),
            ));
          }
        },
        label: Text("Terminé"),
      ),
    );
  }
}
