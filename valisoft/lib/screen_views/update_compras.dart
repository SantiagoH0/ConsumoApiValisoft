import 'dart:convert';
import 'package:http/http.dart' as http;

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

  ComprasVali({
    required this.id,
    required this.numeroCompra,
    required this.producto,
    required this.proveedor,
    required this.cantidad,
    required this.precio,
    required this.iva,
    required this.montoIva,
    required this.subtotal,
    required this.total,
  });

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
      total: double.parse(json["total"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "numeroCompra": numeroCompra,
      "producto": producto,
      "proveedor": proveedor,
      "cantidad": cantidad,
      "precio": precio,
      "iva": iva,
      "montoIva": montoIva,
      "subtotal": subtotal,
      "total": total,
    };
  }
}

Future<ComprasVali> updateCompra(String id, ComprasVali updatedCompra) async {
  final response = await http.put(
    Uri.parse('https://proyecto-formativo-2559218-backend.onrender.com/api/compra/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(updatedCompra.toJson()),
  );

  if (response.statusCode == 200) {
    return ComprasVali.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
