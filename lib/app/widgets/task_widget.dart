import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/task/controllers/task_controller.dart';

/// Task Model
class TaskModel {
  String title;
  String subtitle;
  RxBool isDone;

  TaskModel({
    required this.title,
    required this.subtitle,
    bool done = false,
  }) : isDone = done.obs;
}

/// 🔹 Tab Button
class TaskTabButton extends StatelessWidget {
  final String title;

  const TaskTabButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();
    return GestureDetector(
      onTap: () => controller.setSelectedTab(title),
      child: Obx(
            () => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          decoration: BoxDecoration(
            color: controller.selectedTab.value == title
                ? Colors.black.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              color: controller.selectedTab.value == title
                  ? Colors.blueAccent
                  : Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Task Tile
class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Obx(() => Checkbox(
            value: task.isDone.value,
            onChanged: (value) {
              task.isDone.value = value ?? false;
            },
          )),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: task.isDone.value ? Colors.grey : Colors.black, // ✅ Color change
                    decoration: task.isDone.value
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.grey, // ✅ Line ka color
                    decorationThickness: task.isDone.value ? 2.5 : 1, // ✅ Line ki motai
                  ),
                )),
                const SizedBox(height: 2),
                Text(
                  task.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Category Task List
class TaskList extends StatelessWidget {
  final String category;
  const TaskList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();
    final categoryTasks = controller.tasks[category] ?? [];

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: categoryTasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: categoryTasks[index]);
      },
    );
  }
}

/// 🔹 All Tasks
class AllTasksList extends StatelessWidget {
  const AllTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();

    return ListView(
      padding: const EdgeInsets.all(12),
      children: controller.tasks.entries.map((entry) {
        final category = entry.key;
        final categoryTasks = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...categoryTasks.map((task) => TaskTile(task: task)),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}
