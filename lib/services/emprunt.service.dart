import 'package:crid/models/emprunt.model.dart';

class EmpruntService {
  static List<Emprunt> emprunts = [
    new Emprunt(),
    new Emprunt(),
  ];

  List<Emprunt> getAll() {
    return emprunts;
  }

  add(Emprunt emprunt) {
    emprunts.add(emprunt);
    print("emprunts.length");
    print(emprunts.length);
  }
}
