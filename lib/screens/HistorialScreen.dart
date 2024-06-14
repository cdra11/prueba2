import 'package:flutter/material.dart';
import 'package:app_aa/screens/CuentaScreen.dart';
void main(){
  runApp(Historial());
}

class Historial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Retiro: 30', style: TextStyle(color: Colors.white)),
                    subtitle: Text('Tipo: impuestos', style: TextStyle(color: Colors.white)),
                    trailing: Text('Saldo: 450', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text('Depósito: 100', style: TextStyle(color: Colors.white)),
                    subtitle: Text('Tipo: nómina', style: TextStyle(color: Colors.white)),
                    trailing: Text('Saldo: 550', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    title: Text('Retiro: 50', style: TextStyle(color: Colors.white)),
                    subtitle: Text('Tipo: compras', style: TextStyle(color: Colors.white)),
                    trailing: Text('Saldo: 500', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}