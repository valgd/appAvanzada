import 'package:dam_u2_app_avanzada/Alimentacion.dart';
import 'package:dam_u2_app_avanzada/IMC.dart';
import 'package:dam_u2_app_avanzada/Inicio.dart';
import 'package:flutter/material.dart';

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  int _indice = 0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _pagina = [
      Incio(),
      IMC(),
      Alimentacion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text( "App Flutter Avanzada",),
        centerTitle: true,),
      body: _pagina[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.house_rounded), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: "IMC"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Alimentación"),
        ],
        currentIndex: _indice,
        iconSize: 20,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _cambiarIndice,

      ),
    );
  }
}
