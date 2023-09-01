import 'package:flutter/material.dart';
import 'package:valisoft/screen_views/create_proveedores.dart';
import 'package:valisoft/screen_views/home_compras.dart';
import 'package:valisoft/screen_views/create_compras.dart';
import 'package:valisoft/screen_views/home_proveedores.dart';

List<String> opciones = ['Compras', 'Crear Compra', 'Proveedores', 'Crear Proveedor'];
List<IconData> iconos = [Icons.arrow_right, Icons.android_rounded];

class Listas extends StatelessWidget {
  const Listas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 165, 156, 59),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Menú Valisoft',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: opciones.map((opcion) {
          if (opcion == 'Compras') {
            return ListTile(
              title: Text(opcion),
              leading: Icon(iconos[0], color: Colors.orange),
              //trailing: Icon(iconos[1], color: Colors.orange),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeCompras()),
                );
              },
            );
          } else if (opcion == 'Crear Compra') {
            return ListTile(
              title: Text(opcion),
              leading: Icon(iconos[0], color: Colors.orange),
              //trailing: Icon(iconos[1], color: Colors.orange),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateComp()),
                );
              },
            );
          } else if (opcion == 'Proveedores') {
            return ListTile(
              title: Text(opcion),
              leading: Icon(iconos[0], color: Colors.orange),
              //trailing: Icon(iconos[1], color: Colors.orange),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            );
            }
            else if (opcion == 'Crear Proveedor') {
            return ListTile(
              title: Text(opcion),
              leading: Icon(iconos[0], color: Colors.orange),
              //trailing: Icon(iconos[1], color: Colors.orange),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            );
            }
            else {
            return ListTile(
              title: Text(opcion),
              leading: Icon(iconos[0], color: Colors.orange),
              //trailing: Icon(iconos[1], color: Colors.orange),
              onTap: () {
                
              },
            );
          }
        }).toList(),
      ),
    );
  }
}
