import 'package:crid/pages/accueil.page.dart';
import 'package:flutter/material.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.all(64),
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      'ERP CRID',
                      style: TextStyle(fontSize: 100),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Veuillez vous connecter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Login"),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Mot de passe"),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.green,
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(12),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const AccueilPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Connexion',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
