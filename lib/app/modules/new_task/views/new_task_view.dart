import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/routes/app_pages.dart';
import '../controllers/new_task_controller.dart';

class NewTaskView extends GetView<NewTaskController> {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      const Color(0xFFBFD7ED).withOpacity(0.8), // Pastel Blue
      const Color(0xFFF5F5F5), // Light Grey
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFBFD7ED), // Solid Pastel Blue
        title: const Text(
          "New Task",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
      ),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title
              const Text(
                "Task Title",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (val) => controller.title.value = val,
                decoration: InputDecoration(
                  hintText: "e.g., Buy groceries",
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFF0F0F0)), // Off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent), // Slightly darker
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

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
                maxLines: 4,
                onChanged: (val) => controller.description.value = val,
                decoration: InputDecoration(
                  hintText: "Add more details...",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFF0F0F0)), // Off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent), // Slightly darker
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

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
                readOnly: true,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    controller.dueDate.value = "${picked.month}/${picked.day}/${picked.year}";
                  }
                },
                decoration: InputDecoration(
                  hintText: controller.dueDate.value.isEmpty ? "mm/dd/yyyy" : controller.dueDate.value,
                  // hintText: "mm/dd/yyyy",
                  suffixIcon: const Icon(Icons.calendar_today, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFF0F0F0)), // Off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Priority
              const Text(
                "Priority",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: controller.priority.value,
                items: ["Work", "Personal", "Study"]
                    .map((level) => DropdownMenuItem(
                  value: level,
                  child: Text(level),
                ))
                    .toList(),
                onChanged: (val) {
                  if (val != null) controller.priority.value = val;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFF0F0F0)), // Off-white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 130),

              // Save Task Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveTask(); // save and navigate
                    Get.toNamed(Routes.CONFIRM_TASK);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4facfe), // Blue color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Save Task",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
