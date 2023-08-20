import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text("Matériel emprunté récemment"),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Voir tout"),
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DisplayEmprunt();
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text("Matériel disponible"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Voir tout"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DisplayMateriel();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayEmprunt extends StatelessWidget {
  const DisplayEmprunt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.grey,
      width: 200,
      margin: EdgeInsets.only(right: 16),
    );
  }
}

class DisplayMateriel extends StatelessWidget {
  const DisplayMateriel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      width: 200,
      margin: EdgeInsets.only(right: 16),
    );
  }
}
