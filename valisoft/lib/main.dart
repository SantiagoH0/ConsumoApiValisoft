import 'package:flutter/material.dart';
import 'package:valisoft/screen_views/home_compras.dart';
import 'package:valisoft/screen_views/home_proveedores.dart';
import 'package:valisoft/screen_views/menu.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu', // Ruta inicial
      routes: { // Pantalla de productos
        '/menu': (context) => const Listas(), 
        '/home_compras': (context) => const HomeCompras(),
        '/home_proveedores': (context) => const Home()
      },
    );
  }
}

