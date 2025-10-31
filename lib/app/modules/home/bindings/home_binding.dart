import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../task/controllers/task_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TaskController>(() => TaskController()); // ✅ yahan inject karo
  }
}
