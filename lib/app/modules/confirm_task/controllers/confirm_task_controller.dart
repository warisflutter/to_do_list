import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../task/controllers/task_controller.dart';
import '../../../widgets/task_widget.dart';

class ConfirmTaskController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  var priority = ''.obs;
  var isCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments ?? {};
    titleController = TextEditingController(text: args['title'] ?? '');
    descriptionController = TextEditingController(text: args['description'] ?? '');
    dueDateController = TextEditingController(text: args['dueDate'] ?? '');
    priority.value = args['priority'] ?? 'Work';
  }

  /// Save confirmed task
  void confirmTask() {
    final taskController = Get.find<TaskController>();

    taskController.addTask(
      priority.value,
      titleController.text,
      descriptionController.text.isNotEmpty
          ? descriptionController.text
          : "No description",
    );

    Get.back(); // wapas TaskView par
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
    super.onClose();
  }
}
