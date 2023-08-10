import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5s3s/model/meal_model.dart';
import 'package:team_5s3s/shared/add_cart.dart';
import 'package:team_5s3s/controller/meal_controller.dart';

import 'shared/food_card.dart';

class BuildLeftBody extends StatelessWidget {
  const BuildLeftBody({
    super.key,
    required TabController tabController1,
    required this.meals,
  }) : _tabController1 = tabController1;

  final TabController _tabController1;
  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  "assets/pos.png",
                  height: 40,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Color.fromRGBO(8, 172, 169, 1))),
                  ),
                ),
              ),
              const SizedBox(
                width: 48,
              ),
              Container(
                height: 51,
                color: const Color.fromARGB(66, 32, 32, 29),
                child: const FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(Icons.calculate),
                ),
              ),
            ],
          ),
          SizedBox(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: const Color.fromRGBO(8, 172, 169, 1),
                  child: TabBar(
                    controller: _tabController1,
                    indicator: const BoxDecoration(
                      color: Color.fromRGBO(230, 230, 230, 1),
                    ),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Tab(
                          text: "All",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Tab(
                          text: "On Sale",
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Tab(
                          text: "Featured",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Row(children: [
                          Icon(Icons.add),
                          SizedBox(width: 5),
                          Text("Add product")
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6, right: 6),
                        child: Row(children: [
                          Icon(Icons.qr_code),
                          SizedBox(width: 5),
                          Text("Scan Product")
                        ]),
                      ),
                      //_individualTab("", Icon(Icons.abc)),
                    ],
                  ),
                ),
              )),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              height: 1000,
              child: TabBarView(
                controller: _tabController1,
                children: [
                  buildGridView("All", meals),
                  buildGridView("On Sale", meals),
                  buildGridView("Featured", meals),
                  buildGridView("Add Product", meals),
                  buildGridView("Scan Product", meals),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildGridView(String tabName, List<MealModel> meals) {
  final MealController mealController = Get.put(MealController());
  
  return Container(
    color: const Color.fromRGBO(233, 233, 233, 1),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Container(
              color: const Color.fromRGBO(233, 233, 233, 1),
              child: AddCard(
                onTap: () {},
                width: 40,
                height: 200,
                icon: Icons.chevron_left,
                iconHeight: 40,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 200,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? AddCard(
                          width: 160,
                          height: 200,
                          onTap: () {},
                          icon: Icons.add,
                          iconHeight: 80,
                        )
                      : FoodCard(
                          imagePath: meals[index].imageUrl,
                          productName: meals[index].name,
                          price: meals[index].id,
                          onTap: () {
                            mealController.addProductToCart( meals[index], 1);
                          },
                        );
                },
              ),
            ),
          ),
        ]),
  );
}
