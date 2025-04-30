import 'package:flutter/material.dart';
import '../services/app_clima_service.dart';
import '../models/app_clima_model.dart';

class AppClima extends StatefulWidget {
  const AppClima({super.key});
  @override
  State<AppClima> createState() => _AppClimaState();
}

class _AppClimaState extends State<AppClima> {
  final _climaService = AppClimaService('39ce8d413c5974b092ec0bf5fa2fbe2a');
  Clima? _clima;
  _fetchClima() async {
    try {
      final clima = await _climaService.getClima('Guadalajara');
      setState(() {
        _clima = clima;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchClima();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3.6 Peticiones HTTP'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ciudad:', style: TextStyle(fontSize: 30)),
            Text(
              _clima?.ciudad ?? "CARGANDO DATOS",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              '${_clima?.temp.round().toString()} °C',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
