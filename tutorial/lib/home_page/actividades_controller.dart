import 'package:get/get.dart';
import 'package:tutorial/home_page/actividad.dart';
import 'package:tutorial/current_activity/model/user_location.dart';

class ActividadesController extends GetxController {
  var actividades = <Actividad>[
    Actividad(
      tipo: 'Running',
      cronometro: Duration(minutes: 45),
      km: 5.0,
      kcal: 400,
      avgPace: Duration(minutes: 9, seconds: 0),
      estado: true,
      fecha: DateTime(2023, 3, 5),
      puntos: [],
    ),
    Actividad(
      tipo: 'Bicycle',
      cronometro: Duration(hours: 1, minutes: 30),
      km: 20.0,
      kcal: 800,
      avgPace: Duration(minutes: 4, seconds: 30),
      estado: false,
      fecha: DateTime(2023, 3, 10),
      puntos: [],
    ),
  ].obs;

  void agregarActividad(
      {required String tipo,
      required Duration cronometro,
      required double km,
      required int kcal,
      required Duration avgPace,
      required bool estado,
      required DateTime fecha,
      required List<UserLocation> puntos}) {
    actividades.add(Actividad(
        tipo: tipo,
        cronometro: cronometro,
        km: km,
        kcal: kcal,
        avgPace: avgPace,
        estado: estado,
        fecha: fecha,
        puntos: puntos));
  }

  void eliminarActividad(Actividad actividad) {
    actividades.remove(actividad);
  }

  void modificarActividad(int index, Actividad nuevaActividad) {
    actividades[index] = nuevaActividad;
  }
}
