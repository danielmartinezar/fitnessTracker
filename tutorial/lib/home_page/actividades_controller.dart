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
      avgPace: 8.5,
      estado: true,
      fecha: DateTime(2023, 3, 5),
      puntos: [
        UserLocation(
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        UserLocation(
          latitude: 40.7129,
          longitude: -74.0061,
        ),
      ],
    ),
    Actividad(
      tipo: 'Cycling',
      cronometro: Duration(hours: 1, minutes: 30),
      km: 20.0,
      kcal: 800,
      avgPace: 8.2,
      estado: false,
      fecha: DateTime(2023, 3, 10),
      puntos: [
        UserLocation(
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        UserLocation(
          latitude: 40.7129,
          longitude: -74.0061,
        ),
      ],
    ),
  ].obs;

  void agregarActividad(
      {required String tipo,
      required Duration cronometro,
      required double km,
      required double kcal,
      required double avgPace,
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
        puntos: List.from(puntos)));
    puntos
        .map((e) => print("Puntos de actividad ${e.latitude} ${e.longitude}"));
  }

  void eliminarActividad(Actividad actividad) {
    actividades.removeWhere((a) => a == actividad);
    actividades.refresh();
  }

  void modificarActividad(int index, Actividad nuevaActividad) {
    actividades[index] = nuevaActividad;
  }
}
