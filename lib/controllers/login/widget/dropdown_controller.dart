import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedEnvironment = 'Development'.obs;

  void changeEnvironment(String newValue) {
    selectedEnvironment.value = newValue;
  }
}
