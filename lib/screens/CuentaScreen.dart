import 'package:flutter/material.dart';
import 'package:app_aa/screens/HistorialScreen.dart';

void main(){
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowMaterialGrid: false,
      home: Home(),
      // debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice=0;

  @override

    Widget build(BuildContext context) {
    List<Widget> screens=[
    Cuerpo(context),
    Historial(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("CUENTA", style:TextStyle(color:Color.fromARGB(255, 96, 19, 66)),),
        backgroundColor: Color.fromARGB(255, 174, 118, 224),
      ),
      body: screens[indice],
      ///////////////////////////
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        
        onTap:(value){
          print(indice);
          setState(() {
            indice = value;
            print(indice);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label:"Cuenta"),
          BottomNavigationBarItem(icon: Icon(Icons.hail), label: "Historial"),
        ],
        backgroundColor: Color.fromARGB(255, 131, 78, 161),
      ),
    );
  }
}

Widget Cuerpo(context){

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          "https://i.pinimg.com/736x/0c/a6/9a/0ca69a75f205f7f14043a0755d201b95.jpg",
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/61/03/1d/61031dbe5f6b0a1f5075742aeb95b946.jpg"),
            ),
            SizedBox(height: 14),
            Text('Número de Cuenta: 171611070905', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text('Valor Total de la Cuenta: \$1707', style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ],
    );
  }