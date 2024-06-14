import 'package:app_aa/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

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
        title: const Text('Registro'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
          const Text("REGISTRO"),
          CampoNickname(context),
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonRegistro(context),
        ],
      )
    ),
  );
}

final TextEditingController _nickname = TextEditingController();
Widget CampoNickname(context){
  return(
    TextField(
      controller: _nickname,
      decoration: const InputDecoration(
        hintText: "Ingrese Nickname"
      ),      
    )
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
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Ingrese Contraseña"
        ),      
      )
    ),
  );
}

Widget BotonRegistro(context){
  return(
    ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 94, 56, 160))),
      onPressed: (){
        registro(context);
      },
      child: const Text("Registro")
    )
  );
}

Future<void> registro(context) async {
  try {
    final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _correo.text,
      password: _contrasenia.text,
    );

    await userCredential.user?.updateProfile(displayName: _nickname.text);
    await userCredential.user?.reload();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
