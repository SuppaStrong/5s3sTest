import 'package:get/get.dart';
import 'package:team_5s3s/controller/meal_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MealController>(MealController());
  }
}