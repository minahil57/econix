import 'package:econix/module/controller/app_controller.dart';
import 'package:econix/module/controller/auth_controller.dart';
import 'package:econix/module/controller/cart_controller.dart';
import 'package:econix/module/controller/data_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<DataController>(() => DataController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
