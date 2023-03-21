class Actividad {
  String
      tipo; // El tipo de actividad (e.g. correr, caminar, andar en bicicleta)
  Duration cronometro; // El tiempo que duró la actividad
  double km; // La distancia recorrida en kilómetros
  int kcal; // La cantidad de calorías quemadas durante la actividad
  Duration avgPace; // El ritmo promedio por kilómetro
  bool estado; // Indica si la actividad está activa o no

  Actividad({
    required this.tipo,
    required this.cronometro,
    required this.km,
    required this.kcal,
    required this.avgPace,
    required this.estado,
  });
}
