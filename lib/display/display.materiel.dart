import 'package:flutter/material.dart';

import '../models/materiel.model.dart';

class DisplayMateriel extends StatelessWidget {
  final Materiel materiel;
  const DisplayMateriel({
    Key? key,
    required this.materiel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // margin: EdgeInsets.only(right: 16, bottom: 16),
      child: Column(
        children: [
          Card(
            child: Container(
              height: 150,
              color: Colors.grey,
              child: ((materiel.image != "") ? Image.asset(materiel.image) : Container()),
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              child: Text(
                materiel.nom,
                style: TextStyle(height: 1.1),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(top: 8),
            ),
          )
        ],
      ),
    );
  }
}
