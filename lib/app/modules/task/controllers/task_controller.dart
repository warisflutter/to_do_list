import 'package:get/get.dart';
import '../../../widgets/task_widget.dart';

class TaskController extends GetxController {
  /// Tabs list
  final List<String> tabs = ["All", "Work", "Personal", "Study"];

  /// Selected tab
  var selectedTab = "All".obs;

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }

  /// Tasks data (using TaskModel)
  final Map<String, List<TaskModel>> tasks = {
    "Work": [
      TaskModel(title: "Complete project report", subtitle: "Project deadline"),
      TaskModel(title: "Prepare presentation", subtitle: "Client meeting"),
    ],
    "Personal": [
      TaskModel(title: "Buy groceries", subtitle: "Grocery list"),
      TaskModel(title: "Book movie tickets", subtitle: "Weekend plans"),
    ],
    "Study": [
      TaskModel(title: "Review notes", subtitle: "Exam preparation"),
      TaskModel(title: "Finish essay", subtitle: "Assignment deadline"),
    ],
  };

  /// Add new task
  void addTask(String category, String title, String subtitle) {
    if (!tasks.containsKey(category)) {
      tasks[category] = [];
    }
    tasks[category]!.add(TaskModel(title: title, subtitle: subtitle));

    update(); // force refresh (important for TaskView)
  }

  /// Tab ke hisaab se content
  getTabContent(String tab) {
    if (tab == "All") {
      return const AllTasksList();
    } else {
      return TaskList(category: tab);
    }
  }
}
