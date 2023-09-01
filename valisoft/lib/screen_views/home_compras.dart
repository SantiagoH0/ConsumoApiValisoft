
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:valisoft/screen_views/compras_model.dart';
import 'package:http/http.dart' as http;

class HomeCompras extends StatefulWidget {
  const HomeCompras({Key? key}) : super(key: key);

  @override
  State<HomeCompras> createState() => _HomeComprasState();
}

class _HomeComprasState extends State<HomeCompras> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;
  _getData() async {
    try {
      String url = "https://proyecto-formativo-2559218-backend.onrender.com/api/compra";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compras"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dataFromAPI!.compras[index].numeroCompra.toString()),
                      Text(dataFromAPI!.compras[index].producto.toString()),
                      Text(dataFromAPI!.compras[index].proveedor.toString()),
                      Text(dataFromAPI!.compras[index].cantidad.toString()),                     
                      Text(dataFromAPI!.compras[index].precio.toString()),
                      Text(dataFromAPI!.compras[index].iva.toString()),
                      Text(dataFromAPI!.compras[index].fecha.toString()),
                      Text(dataFromAPI!.compras[index].montoIva.toString()),
                      Text(dataFromAPI!.compras[index].subtotal.toString()),
                      Text(dataFromAPI!.compras[index].total.toString()),
                    ],
                  ),
                );
              },
              itemCount: dataFromAPI!.compras.length,
            ),
    );
  }
}