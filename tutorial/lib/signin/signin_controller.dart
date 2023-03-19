import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class signin_controller extends GetxController{
  late String user , pas ;

  void setuser(us, pasw) => {
    user = us,
    pas = pasw
  };

  String usr(){
    return ("usuario: $user contraseña: $pas");
  }

  bool validatepasw (usr,pasw, paswver){
    if (pasw == paswver){
        setuser(usr, pasw);
        return true;
    }
    return false;
  }


}