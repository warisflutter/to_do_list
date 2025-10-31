import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/routes/app_pages.dart';
import '../../../widgets/task_widget.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFBFD7ED).withOpacity(0.8), // Pastel Blue
              const Color(0xFFF5F5F5), // Light Grey
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Title + Menu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Tasks",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        // 🔹 Add (+) Button with decoration (Pastel Blue theme)
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.NEW_TASK);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF89CFF0), // Light pastel blue
                                  Color(0xFF4682B4), // Steel blue for depth
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // 🔹 More (3 dots) Button simple
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.more_vert, color: Colors.black54, size: 28),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "You have 4 tasks to complete",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Search Box
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search tasks...",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                    prefixIcon: const Icon(Icons.search, size: 22),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Tabs Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: false,   //  Always show
                      thickness: 8,            // Slim size
                      radius: const Radius.circular(20),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.tabs
                              .map((tab) => TaskTabButton(title: tab))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔹 Content
                Expanded(
                  child: Obx(() {
                    final tab = controller.selectedTab.value;
                    final content = controller.getTabContent(tab);

                    return Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          ),
                          border: Border(
                            top: BorderSide(
                                color: Colors.black12.withOpacity(0.1), width: 2),
                            left: BorderSide(
                                color: Colors.black12.withOpacity(0.1), width: 2),
                            right: BorderSide(
                                color: Colors.black12.withOpacity(0.1), width: 2),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12), //  Yeh important hai
                          child: content,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
