import 'package:get/get.dart';
import 'package:team_5s3s/model/meal_model.dart';

class MealController extends GetxController {
  var mealCartAsMap = {}.obs;

  // Cart thing
  void addProductToCart(MealModel mealModel, int number) {
    if (mealCartAsMap.containsKey(mealModel)) {
      mealCartAsMap[mealModel] += number;
      // ignore: avoid_print
      print(mealCartAsMap);
    } else {
      mealCartAsMap[mealModel] = number;
      // ignore: avoid_print
      print(mealCartAsMap);
    }
  }

  void removeProductsFromCart(MealModel mealModel) {
    if (mealCartAsMap.containsKey(mealModel) && mealCartAsMap[mealModel] == 1) {
      mealCartAsMap.removeWhere((key, value) => key == mealModel);
    } else {
      mealCartAsMap[mealModel] -= 1;
    }
  }

  void removeOneProduct(MealModel productModel) {
    mealCartAsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    mealCartAsMap.clear();
  }

  get mealSubTotal =>
      mealCartAsMap.entries.map((e) => (e.key.id)*(e.value)).toList();

  get total => mealCartAsMap.entries
      .map((e) => e.key.id * e.value)
      .toList()
      .reduce((value, element) => value + element).toString();

  int quantity() {
    if (mealCartAsMap.isEmpty) {
      return 0;
    } else {
      return mealCartAsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
