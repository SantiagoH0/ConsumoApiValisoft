import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//https://frontendhbs.onrender.com/
Future<ComprasVali> createCompra(String numeroCompra, String producto, String proveedor, String cantidad, String precio, String iva, String montoIva, String subtotal, String total) async {
  final response = await http.post(
    Uri.parse('https://proyecto-formativo-2559218-backend.onrender.com/api/compra'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
        "numeroCompra": numeroCompra,
        "producto": producto,
        "proveedor": proveedor,
        "cantidad": cantidad,
        "precio": precio,
        "iva": iva,
        "montoIva" : montoIva,
        "subtotal" : subtotal,
        "total" : total,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ComprasVali.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(response.body);
  }
}

class ComprasVali {
  final String id;
  final int numeroCompra;
  final String producto;
  final String proveedor;
  final int cantidad;
  final double precio;
  final double iva;
  final double montoIva;
  final double subtotal;
  final double total;

  const ComprasVali({required this.id, required this.numeroCompra, required this.producto, required this.proveedor, required this.cantidad, required this.precio, required this.iva, required this.montoIva, required this.subtotal, required this.total});

  factory ComprasVali.fromJson(Map<String, dynamic> json) {
    return ComprasVali(
      id: json["_id"],
        numeroCompra: int.parse(json["numeroCompra"]),
        producto: json["producto"],
        proveedor: json["proveedor"],
        cantidad: int.parse(json["cantidad"]),
        precio: double.parse(json["precio"]),
        iva: double.parse(json["iva"]),
        montoIva: double.parse(json["montoIVa"]),
        subtotal: double.parse(json["subtotal"]),
        total:double.parse(json["total"])
    );
  }
}


void main() {
  runApp(const CreateComp());
}

class CreateComp extends StatefulWidget {
  const CreateComp({Key? key}) : super(key: key);

  @override
  State<CreateComp> createState() {
    return _CreateCompState();
  }
}


class _CreateCompState extends State<CreateComp> {
  final TextEditingController _numeroCompra = TextEditingController();
  final TextEditingController _producto = TextEditingController();
  final TextEditingController _proveedor = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  final TextEditingController _precio = TextEditingController();
  final TextEditingController _iva = TextEditingController();
  final TextEditingController _montoIva = TextEditingController();
  final TextEditingController _subtotal = TextEditingController();
  final TextEditingController _total = TextEditingController();

  Future<ComprasVali>? _futureCompra;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear Compra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Crear'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: (_futureCompra == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _numeroCompra,
          decoration: const InputDecoration(hintText: 'Digite # de compra'),
        ),
        TextField(
          controller: _producto,
          decoration: const InputDecoration(hintText: 'Digite el producto'),
        ),
         TextField(
          controller: _proveedor,
          decoration: const InputDecoration(hintText: 'Digite el proveedor'),
        ),
        TextField(
          controller: _cantidad,
          decoration: const InputDecoration(hintText: 'Digite la cantidad'),
        ),
        TextField(
          controller: _precio,
          decoration: const InputDecoration(hintText: 'Digite el precio'),
        ),
          TextField(
          controller: _iva,
          decoration: const InputDecoration(hintText: 'Digite el iva'),
        ),
        TextField(
          controller: _montoIva,
          decoration: const InputDecoration(hintText: 'Digite el monto del iva'),
        ),
        TextField(
          controller: _subtotal,
          decoration: const InputDecoration(hintText: 'Digite el subtotal'),
        ),
        TextField(
          controller: _total,
          decoration: const InputDecoration(hintText: 'Digite el total'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // ignore: unnecessary_cast
              _futureCompra = createCompra(_numeroCompra.text, _producto.text, _proveedor.text, _cantidad.text, _precio.text, _iva.text, _montoIva.text, _subtotal.text, _total.text) as Future<ComprasVali>?;
            });
          },
          child: const Text('Create Compra'),
        ),
      ],
    );
  }

  FutureBuilder<ComprasVali> buildFutureBuilder() {
    return FutureBuilder<ComprasVali>(
      future: _futureCompra,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.producto);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}