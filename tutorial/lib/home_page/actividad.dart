import 'package:flutter/material.dart';
import 'package:tutorial/current_activity/model/user_location.dart';

class Actividad {
  String
      tipo; // El tipo de actividad (e.g. correr, caminar, andar en bicicleta)
  Duration cronometro; // El tiempo que duró la actividad
  double km; // La distancia recorrida en kilómetros
  int kcal; // La cantidad de calorías quemadas durante la actividad
  Duration avgPace; // El ritmo promedio por kilómetro
  bool estado; // Indica si la actividad está activa o no
  DateTime fecha; // La fecha en que se realizó la actividad
  List<UserLocation> puntos; // Una lista de valores de tipo double

  Actividad({
    required this.tipo,
    required this.cronometro,
    required this.km,
    required this.kcal,
    required this.avgPace,
    required this.estado,
    required this.fecha,
    required this.puntos,
  });
}
