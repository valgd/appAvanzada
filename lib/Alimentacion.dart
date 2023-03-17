import 'package:flutter/material.dart';

List genero = ["Femenino", "Masculino"];

class Alimentacion extends StatefulWidget {
  const Alimentacion({Key? key}) : super(key: key);

  @override
  State<Alimentacion> createState() => _AlimentacionState();
}

class _AlimentacionState extends State<Alimentacion> {
  final peso = TextEditingController();
  final estatura = TextEditingController();
  final edad = TextEditingController();

  String _generoS = genero.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60,),
        Center(
          child: Text("¿Cuántas calorías debo consumir al día?", style: TextStyle(fontSize: 25, color: Colors.pink, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),
        Center(
          child: Text("Completa tus datos y descúbrelo",
            style: TextStyle(fontSize: 16),),
        ),

        Padding(padding: EdgeInsets.all(15),
            child:
            TextField( controller: estatura,
              decoration: InputDecoration(labelText: "Estatura(cm):",
                  icon: Icon(Icons.height_rounded,)),)
        ),
        Padding(padding: EdgeInsets.all(15),
            child:
            TextField( controller: peso,
              decoration: InputDecoration(labelText: "Peso(kg):",
                  icon: Icon(Icons.monitor_weight_rounded,)),)
        ),

        Padding(padding: EdgeInsets.all(15),
            child:
            TextField( controller: edad,
              decoration: InputDecoration(labelText: "Edad:",
                  icon: Icon(Icons.numbers,)),)
        ),

        SizedBox(height: 8,),
        Center(
          child: Text("Selecciona tu género"),
        ),

        Padding(padding: EdgeInsets.all(30),
          child: DropdownButtonFormField(
            value: _generoS,
            items: genero.map((valor){
              return DropdownMenuItem(child: Text(valor), value: valor,);
            }).toList(),
            onChanged: (valor){
              setState(() {
                _generoS = valor.toString();
              });
            },
          ),
        ),

        FilledButton(onPressed: (){
          generar(estatura.text,peso.text,edad.text);
        }, child: Text("Calcular")),
      ],


    );

  }
  void generar(String est, String pes, String eda){
      double esta = double.parse(est);
      double pess = double.parse(pes);
      double edaa = double.parse(eda);
      double res;

      if(_generoS == "Femenino"){
        res = 655 + (9.6 * pess) + (1.8 * esta) - (4.7 * edaa);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Al ser mujer debes consumir : ${res} calorías al día")));
      } else{
        res = 66 + (13.7 * pess) + (5 * esta) - (6.75 * edaa);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Al ser hombre debes consumir : ${res} calorías al día")));
      }
  }
}
