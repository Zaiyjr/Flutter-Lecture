import 'package:get/get.dart';

class BottomBarController extends GetxController {
  // Observable index for tracking the current tab
  var currentIndex = 0.obs;

  // Update the current index
  void changeIndex(int index) {
    currentIndex.value = index;
  }

}
