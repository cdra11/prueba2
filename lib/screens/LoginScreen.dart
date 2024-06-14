import 'package:app_aa/screens/CuentaScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
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
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Stack(
    children: <Widget>[
      Positioned.fill(
        child: Image.network(
          'https://i.pinimg.com/736x/d6/43/60/d64360320922c4696c87cced90762d25.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CampoCorreo(context),
              const SizedBox(height: 10),
              CampoContrasenia(context),
              const SizedBox(height: 20),
              BotonLogin(context),
            ],
          ),
        ),
      ),
      ],
);
}


final TextEditingController _correo = TextEditingController();
Widget CampoCorreo(context){
  return(
    TextField(
      controller: _correo,
      decoration: const InputDecoration(
        hintText: "Ingrese Correo"
      ),      
    )
  );
}

final TextEditingController _contrasenia = TextEditingController();
Widget CampoContrasenia(context){
  return Container(
    padding: EdgeInsets.all(0),
    child: (
      TextField(
        controller: _contrasenia,
        decoration: const InputDecoration(
          hintText: "Ingrese Contraseña"
        ),      
      )
    ),
  );
}

Widget BotonLogin(context){
  return(
    ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(0, 160, 112, 241))),
      onPressed: (){
        login(context);
    }, child: Text("Login"))
  );
}

Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text, password: _contrasenia.text);

    Navigator.push(context,
        MaterialPageRoute(builder:
        (context)=> Cuenta()));

} on FirebaseAuthException catch (e) {
    String errorMessage;
    if (e.code == 'user-not-found') {
      errorMessage = 'No existen datos asociados a ese correo.';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'Contraseña incorrecta.';
    } else {
      errorMessage = 'Ha ocurrido un error, inténtelo de nuevo.';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}