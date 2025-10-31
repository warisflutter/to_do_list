import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/home_widget.dart';
import '../../task/controllers/task_controller.dart';
import '../../task/views/task_view.dart';   // 👈 TaskView import kiya
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        appBar: controller.selectedIndex.value == 1
            ? AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 4,
          title: const Text(
            "To-Do-List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        )
            : null,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFBFD7ED), // Pastel Blue (slightly darker, more visible)
                    const Color(0xFFF5F5F5), // Light Grey
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  // Tasks Tab
                  GetBuilder<TaskController>( // 👈 yaha controller bind hoga
                    init: TaskController(),
                    builder: (_) => const TaskView(),
                  ),
                  // Home Tab
                  const TaskCategorySection(),
                  // Profile Tab
                  const Center(child: Text("Profile")),
                ],

              ),
            ),

        // --- Bottom Navigation
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 70,
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashFactory: InkRipple.splashFactory,
                  highlightColor: Colors.transparent,
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeTab,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Colors.deepPurple,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.check_circle_outline_outlined),
                      label: "Tasks",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
