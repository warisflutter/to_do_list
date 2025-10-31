import 'package:get/get.dart';

import '../controllers/confirm_task_controller.dart';

class ConfirmTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmTaskController>(
      () => ConfirmTaskController(),
    );
  }
}
