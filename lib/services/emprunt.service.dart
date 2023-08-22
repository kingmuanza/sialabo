import 'package:crid/models/emprunt.model.dart';
import 'package:localstorage/localstorage.dart';

class EmpruntService {
  final LocalStorage storage = LocalStorage('sialabo.json');

  List<Emprunt> getAll() {
    List<Emprunt> emprunts = [];
    List<dynamic> jsons = [];
    dynamic existe = storage.getItem('emprunts');
    if (existe != null) {
      print("existe");
      jsons = storage.getItem('emprunts');
      jsons.forEach((element) {
        emprunts.add(Emprunt.fromJSON(element));
      });
    } else {
      print("existe paaasss");
      print(existe);
    }
    return emprunts;
  }

  add(Emprunt emprunt) {
    List<dynamic> jsons = [];
    dynamic existe = storage.getItem('emprunts');
    if (existe != null) {
      jsons = storage.getItem('emprunts');
    }
    jsons.add(emprunt.toJSON());
    storage.setItem('emprunts', jsons);
    print("jsons.length");
    print(jsons.length);
  }
}
