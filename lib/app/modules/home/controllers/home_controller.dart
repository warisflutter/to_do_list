import 'package:get/get.dart';

class HomeController extends GetxController {
  // current index for bottom nav
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
