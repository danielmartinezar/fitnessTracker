import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tutorial/signin/signin_model.dart';
import 'package:tutorial/signin/usuarios_model.dart';

class signin_controller extends GetxController{
  late final List<usuario_model> usuarios = <usuario_model>[].obs;

  void setuser(us, pasw) => {
    usuarios.add(usuario_model(user: us, pasw: pasw)),
  };

  String usr(){
    final user = usuarios.map((e) => {"usuario : ${e.user},contraseña : ${e.pasw}"});
    return "$user";
  }

  bool validatepasw (usr,pasw, paswver){
    if (pasw == paswver){
        setuser(usr, pasw);
        return true;
    }
    return false;
  }

  bool exist(usr,pasw){
    try {
      final usexist = usuarios.singleWhere((element) => element.user == usr);
      if (usexist.pasw == pasw){
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  


}