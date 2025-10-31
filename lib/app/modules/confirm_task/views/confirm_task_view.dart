import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/confirm_task_controller.dart';

class ConfirmTaskView extends GetView<ConfirmTaskController> {
  const ConfirmTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      const Color(0xFFBFD7ED).withOpacity(0.8), // Pastel Blue
      const Color(0xFFF5F5F5), // Light Grey
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFBFD7ED).withValues(alpha: 0.8), // Solid Purple-Blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Task Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // 🔹 Gradient body
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Task Name
              const Text(
                "Task Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(
                  hintText: "Enter task name",
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFFE0E0E0)), // off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Colors.blueAccent), // focus
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Add a more detailed description...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFFE0E0E0)), // off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Colors.blueAccent), // focus
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Priority Dropdown
              const Text(
                "Priority",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFFE0E0E0)), // off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Colors.blueAccent), // focus
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: controller.priority.value,
                items: const [
                  DropdownMenuItem(value: "Work", child: Text("Work")),
                  DropdownMenuItem(value: "Personal", child: Text("Personal")),
                  DropdownMenuItem(value: "Study", child: Text("Study")),
                ],
                onChanged: (value) {
                  if (value != null) controller.priority.value = value;
                },
              ),
              const SizedBox(height: 16),

              // Due Date
              const Text(
                "Due Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.dueDateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Select a date",
                  suffixIcon:
                  const Icon(Icons.calendar_today, color: Colors.black54),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFFE0E0E0)), // off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Colors.blueAccent), // focus
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    // TODO: Save picked date in controller
                  }
                },
              ),
              const SizedBox(height: 16),

              // Checkbox
              Row(
                children: [
                  Obx(() => Checkbox(
                    value: controller.isCompleted.value,
                    onChanged: (val) {
                      controller.isCompleted.value = val ?? false;
                    },
                  )),
                  const Text(
                    "Mark as complete",
                    style: TextStyle(color: Colors.black87),
                  )
                ],
              ),
            ],
          ),
        ),
      ),

      // 🔹 Bottom Buttons remain same
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ).copyWith(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.redAccent;
                      }
                      return null;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      }
                      return Colors.black;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: controller.confirmTask,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2575FC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
