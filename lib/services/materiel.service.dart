import 'package:crid/models/materiel.model.dart';

class MaterielService {
  List<Materiel> getAll() {
    return [
      Materiel.createAvecImage("Disperseur homogénéiseur OV 625 Digital", "assets/images/homogeneiseurs_ov625_3-4_on.jpg"),
      Materiel.createAvecImage("Epurateur neutralisation des vapeurs toxiques", "assets/images/agroalimentaire_ks10003-4-284151.jpg"),
      Materiel.create("Luxmètre réglage multisources lumineuses"),
      Materiel.create("Tensiomètre-cardiofréquencemètre brassard"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.createAvecImage("Tensiomètre-cardiofréquencemètre brassard", "assets/images/moineau_ugap_3809si.jpg"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
      Materiel.create("Disperseur homogénéiseur OV 625 Digital"),
    ];
  }
}
