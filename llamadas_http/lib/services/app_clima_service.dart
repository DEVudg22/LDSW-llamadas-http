import 'dart:convert';
import '../models/app_clima_model.dart';
import 'package:http/http.dart' as http;

class AppClimaService {
  static const url = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  AppClimaService(this.apiKey);

  Future<Clima> getClima(String ciudad) async {
    final response = await http.get(
      Uri.parse('$url?q=$ciudad&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      return Clima.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar datos');
    }
  }
}
