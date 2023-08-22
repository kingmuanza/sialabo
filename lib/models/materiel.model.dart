class Materiel {
  String id = "";
  String nom = "mon premier matériel";
  String image = "";

  Materiel() {
    id = "MATERIEL${DateTime.now().millisecondsSinceEpoch}";
  }

  Materiel.create(String libelle) {
    nom = libelle;
  }

  Materiel.createAvecImage(String libelle, String lien) {
    nom = libelle;
    image = lien;
  }

  Materiel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    nom = json["nom"];
  }

  toJSON() {
    return {
      "id": id,
      "image": image,
      "nom": nom,
    };
  }
}
