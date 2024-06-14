import 'package:app_aa/screens/RegistroScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_aa/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba02());
}

class Prueba02 extends StatelessWidget {
  const Prueba02({super.key});

@override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://images.hdqwalls.com/download/jinx-arcane-5k-y9-1125x2436.jpg",
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Carla Reinoso Alarcón', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 236, 205, 239))),
              Text('cdra11', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 236, 205, 239))),
              BotonLogin(context),
              BotonRegistro(context),            ],
          ),
        ],
      ),
    );
  }
}

Widget BotonLogin(context){
  return(
    FilledButton(onPressed: (){
      Navigator.push(context, 
        MaterialPageRoute(builder:
        (context) => Login()));
    }, child: Text("Ir a Login"))
  );
}

Widget BotonRegistro(context){
  return(
    FilledButton(onPressed: (){
      Navigator.push(context, 
        MaterialPageRoute(builder:
        (context) => Registro()));
    }, child: Text("Ir a Registro"))
  );
}

