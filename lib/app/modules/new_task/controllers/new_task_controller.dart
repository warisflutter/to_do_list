import 'package:get/get.dart';

class NewTaskController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  var dueDate = ''.obs;
  var priority = 'Work'.obs;

  // helper method to save data
  void saveTask() {
    Get.toNamed('/confirm-task', arguments: {
      'title': title.value,
      'description': description.value,
      'dueDate': dueDate.value,
      'priority': priority.value,
    });
  }
}
