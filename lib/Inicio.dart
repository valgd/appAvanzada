import 'package:flutter/material.dart';

class Incio extends StatefulWidget {
  const Incio({Key? key}) : super(key: key);

  @override
  State<Incio> createState() => _IncioState();
}

class _IncioState extends State<Incio> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [
        Center(child:
        Text("Bienvenidos a", style: TextStyle(fontSize: 30, color: Colors.pink, fontWeight:  FontWeight.bold),),),

        Center(
          child:
          Text("SALUD - MÓVIL", style: TextStyle(fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
        ),

        SizedBox(height: 20,),
        Center(
          child:  Text("Nuestro bienestar físico y mental es fundamental para poder desarrollar plenamente nuestras actividades, hacerle frente al estrés de la vida diaria, ser productivos "
              "en el ámbito laboral y personal, y con ello contribuir positivamente con la sociedad.",
          style: TextStyle(fontSize: 15),),
        ),

        SizedBox(height: 20,),

        SizedBox(height: 300, width: 300, child: Image(image: AssetImage('/inicio.jpg'),),),

        SizedBox(height: 20,),

        Center(
          child:
          Text("Consulta nuestros tests para conocer cómo puedes mejorar tus hábitos y ser más saludable",
          style: TextStyle(fontSize: 15),),
        ),

        SizedBox(height: 20,),

        ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (BuildContext) {
            return AlertDialog(
              title: Text("SUBSCRIPCIÓN"),
              content: Text("Envia un mensaje al 311200200 con tu nombre completo para obtener informes con respecto "
                  "a la subscripción "),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("OK"))
              ],
            );
          });
        }, child: Text("¡Quiero suscribirme!")),



      ],
    );
  }
}
