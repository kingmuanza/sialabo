import 'package:crid/models/personnel.model.dart';

class PersonnelService {
  getAll() {
    return [
      Personnel.create("Muanza Kangudie"),
      Personnel.create("Yomi Mbianda"),
      Personnel.create("Oliver Pondi"),
      Personnel.create("Dr Sandra Noukong"),
    ];
  }
}
