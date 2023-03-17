import 'package:flutter/material.dart';

class IMC extends StatefulWidget {
  const IMC({Key? key}) : super(key: key);

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(60),
      children: [

        Center(
          child: Text("IMC", style: TextStyle(fontSize: 25, color: Colors.pink, fontWeight: FontWeight.bold),),
        ),

        SizedBox(height: 20,),
        SizedBox(height: 200, width: 200,
        child:
          Image(image: AssetImage("/bascula.png"),),),
        SizedBox(height: 20,),

        Center(
          child:
          Text("El índice de masa corporal (IMC) es un número que se calcula con base en el peso y la estatura de la persona. "
              "Es un indicador confiable que se usa para identificar las categorías de peso que pueden llevar a problemas de salud",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),

        SizedBox(height: 30,),


        Padding(padding: EdgeInsets.all(25),
          child:
          TextField(controller: num1,
            decoration: InputDecoration(icon: Icon(Icons.numbers),
                labelText: "Peso(kg): "),
          ),
        ),

        SizedBox(height: 20,),

        Padding(padding: EdgeInsets.all(25),
          child:
          TextField(controller: num2,
            decoration: InputDecoration(icon: Icon(Icons.numbers),
                labelText: "Altura(m) : "),
          ),
        ),

        SizedBox(height: 40,),

        Column(
          children: [
            ElevatedButton(onPressed: (){
              IMC(num1.text,num2.text);
            }, child: Text("Calcular IMC"))
          ],
        )
      ],
    );

  }
  void IMC(String text, String text2){
    int n1 = int.parse(text);
    double n2 = double.parse(text2);
    double resultado = n1/(n2*n2);

    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("RESULTADO",style: TextStyle(color: (Colors.deepPurple)),),
            content: Text("TU IMC es: \n ${resultado}",textAlign: TextAlign.center,),
            icon: Image.asset("/IMC.jpeg",width: 350,height: 350),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop(); //Quita el alertDialog
              }, child: Text("OK"))
            ],
          );  //AlertDialog
        }); //ShowDialog
  }
}
