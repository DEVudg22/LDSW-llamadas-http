class Clima {
  final String ciudad;
  final double temp;

  Clima({required this.ciudad, required this.temp});

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(ciudad: json['name'], temp: json['main']['temp'].toDouble());
  }
}
