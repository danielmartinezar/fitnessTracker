import 'package:get/get.dart';
import 'package:tutorial/home_page/actividad.dart';

class ActividadesController extends GetxController {
  var actividades = <Actividad>[
    Actividad(
      tipo: 'caminar',
      cronometro: Duration(minutes: 30),
      km: 2.5,
      kcal: 200,
      avgPace: Duration(minutes: 12, seconds: 30),
      estado: true,
    ),
    Actividad(
      tipo: 'correr',
      cronometro: Duration(minutes: 45),
      km: 5.0,
      kcal: 400,
      avgPace: Duration(minutes: 9, seconds: 0),
      estado: true,
    ),
    Actividad(
      tipo: 'andar en bicicleta',
      cronometro: Duration(hours: 1, minutes: 30),
      km: 20.0,
      kcal: 800,
      avgPace: Duration(minutes: 4, seconds: 30),
      estado: false,
    ),
  ].obs;

  void agregarActividad(Actividad actividad) {
    actividades.add(actividad);
  }

  void eliminarActividad(Actividad actividad) {
    actividades.remove(actividad);
  }

  void modificarActividad(int index, Actividad nuevaActividad) {
    actividades[index] = nuevaActividad;
  }
}
