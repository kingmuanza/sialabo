import 'package:flutter/material.dart';

class EmpruntViewPage extends StatefulWidget {
  const EmpruntViewPage({super.key});

  @override
  State<EmpruntViewPage> createState() => _EmpruntViewPageState();
}

class _EmpruntViewPageState extends State<EmpruntViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emprunt")),
    );
  }
}
