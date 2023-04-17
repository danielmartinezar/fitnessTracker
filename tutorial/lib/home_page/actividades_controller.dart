import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tutorial/home_page/actividad.dart';
import 'package:tutorial/current_activity/model/user_location.dart';

class ActividadesController extends GetxController {
  // Crea una variable para la caja de Hive donde se almacenarán las actividades
  Box<Actividad>? actividadesBox;

  @override
  void onInit() {
    super.onInit();
    abrirCaja();
  }

  Future<Box<Actividad>> abrirCaja() async {
    return await Hive.openBox<Actividad>('actividades');
  }

  void agregarActividad(
      {required String tipo,
      required Duration cronometro,
      required double km,
      required double kcal,
      required double avgPace,
      required bool estado,
      required DateTime fecha,
      required List<UserLocation> puntos}) {
    final actividad = Actividad(
        tipo: tipo,
        cronometro: cronometro,
        km: km,
        kcal: kcal,
        avgPace: avgPace,
        estado: estado,
        fecha: fecha,
        puntos: List.from(puntos));
    actividadesBox?.add(actividad);
    puntos
        .map((e) => print("Puntos de actividad ${e.latitude} ${e.longitude}"));
  }

  void eliminarActividad(int index) {
    actividadesBox?.deleteAt(index);
  }

  void modificarActividad(int index, Actividad nuevaActividad) {
    actividadesBox?.putAt(index, nuevaActividad);
  }
}
