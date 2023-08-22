class Personnel {
  String id = "";
  String nomComplet = "";
  String poste = "";

  Personnel() {
    id = "PERSONNEL${DateTime.now().millisecondsSinceEpoch}";
  }

  Personnel.create(String nom) {
    id = "PERSONNEL${DateTime.now().millisecondsSinceEpoch}";
    nomComplet = nom;
  }

  Personnel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    nomComplet = json["nomComplet"];
    poste = json["poste"];
  }

  toJSON() {
    return {
      "id": id,
      "nomComplet": nomComplet,
      "poste": poste,
    };
  }
}
