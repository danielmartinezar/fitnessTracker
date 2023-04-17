import 'package:flutter/material.dart';
import 'package:tutorial/current_activity/model/user_location.dart';
import 'package:hive/hive.dart';

part 'actividad.g.dart';

@HiveType(typeId: 0)
class Actividad {
  @HiveField(0)
  String
      tipo; // El tipo de actividad (e.g. correr, caminar, andar en bicicleta)

  @HiveField(1)
  Duration cronometro; // El tiempo que duró la actividad

  @HiveField(2)
  double km; // La distancia recorrida en kilómetros

  @HiveField(3)
  double kcal; // La cantidad de calorías quemadas durante la actividad

  @HiveField(4)
  double avgPace; // El ritmo promedio por kilómetro

  @HiveField(5)
  bool estado; // Indica si la actividad está activa o no

  @HiveField(6)
  DateTime fecha; // La fecha en que se realizó la actividad

  @HiveField(7)
  List<UserLocation> puntos; // Una lista de valores de tipo UserLocation

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
