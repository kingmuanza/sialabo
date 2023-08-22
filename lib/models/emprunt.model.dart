import 'package:crid/models/personnel.model.dart';

import 'materiel.model.dart';

class Emprunt {
  String id = "";
  List<Materiel> materiels = [
    Materiel.create("Microscope"),
    Materiel.create("Thermomètre"),
    Materiel.create("Enlermeyer"),
  ];
  DateTime date = DateTime.now();
  DateTime retour = DateTime.now();
  bool retournee = false;
  Personnel personnel = Personnel();

  Emprunt() {
    id = "EMPRUNT${DateTime.now().millisecondsSinceEpoch}";
  }

  Emprunt.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    retournee = json["retournee"];
    personnel = Personnel.fromJSON(json["personnel"]);
    date = DateTime.parse(json["date"]);
    retour = DateTime.parse(json["retour"]);
    materiels = materielsFromJSON(json["materiels"]);
  }

  toJSON() {
    return {
      "id": id,
      "retournee": retournee,
      "personnel": personnel.toJSON(),
      "date": date.toIso8601String(),
      "retour": retour.toIso8601String(),
      "materiels": materielsToJSON(materiels),
    };
  }

  List<Materiel> materielsFromJSON(List<dynamic> jsons) {
    List<Materiel> materiels = [];
    jsons.forEach((json) {
      materiels.add(Materiel.fromJSON(json));
    });
    return materiels;
  }

  List materielsToJSON(List<Materiel> materiels) {
    List<dynamic> jsons = [];
    materiels.forEach((materiel) {
      jsons.add(materiel.toJSON());
    });
    return jsons;
  }
}
