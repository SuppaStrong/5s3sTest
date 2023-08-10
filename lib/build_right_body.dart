import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5s3s/model/meal_model.dart';

import 'controller/meal_controller.dart';
import 'shared/button_default.dart';

class BuildRightBody extends StatelessWidget {
  BuildRightBody({
    super.key,
    required TabController tabController2,
    required this.meals,
  }) : _tabController2 = tabController2;

  final TabController _tabController2;
  final List<MealModel> meals;
  final MealController mealController = Get.put(MealController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      color: const Color.fromRGBO(238, 238, 238, 1),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController2,
              indicator: const BoxDecoration(
                color: Colors.white,
              ),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                const Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(
                      width: 5,
                    ),
                    Text("cart")
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.sentiment_satisfied),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Customer"),
                        Text("Guest"),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Address")
                  ],
                ),
                Container(
                  width: 56,
                  color: const Color.fromARGB(223, 211, 172, 1),
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (mealController.mealCartAsMap.isEmpty) {
                return Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text("Empty Cart , Add Some !!!"),
                  ),
                );
              } else {
                return TabBarView(
                  controller: _tabController2,
                  children: [
                    Container(
                        color: Colors.white,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: mealController.mealCartAsMap.length,
                            separatorBuilder: (BuildContext context,
                                    int index) =>
                                const Divider(
                                    height: 1,
                                    color: Color.fromRGBO(238, 238, 238, 1)),
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    mealController.removeOneProduct(
                                        mealController.mealCartAsMap.keys
                                            .toList()[index]);
                                  },
                                ),
                                title: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(mealController
                                            .mealCartAsMap.keys
                                            .toList()[index]
                                            .imageUrl),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    Expanded(
                                      child: Text(
                                        mealController.mealCartAsMap.keys
                                            .toList()[index]
                                            .name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      color:
                                          const Color.fromRGBO(8, 172, 169, 1),
                                      child: IconButton(
                                        color: Colors.white,
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          mealController.removeProductsFromCart(
                                              mealController.mealCartAsMap.keys.toList()[index]);
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  218, 218, 218, 1))),
                                      child: Center(
                                        child: Text(mealController
                                                .mealCartAsMap.isEmpty
                                            ? "\$0"
                                            : "${mealController.mealCartAsMap.values.toList()[index]}"),
                                      ),
                                    ),
                                    Container(
                                      color:
                                          const Color.fromRGBO(8, 172, 169, 1),
                                      child: IconButton(
                                        color: Colors.white,
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          mealController.addProductToCart(
                                              mealController.mealCartAsMap.keys.toList()[index], 1);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "\$ ${mealController.mealCartAsMap.keys.toList()[index].id}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 60,
                                      child: Text(
                                        mealController.mealCartAsMap.isEmpty
                                            ? "\$0"
                                            : "\$ ${mealController.mealSubTotal[index].toString()}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              );
                            })),
                    Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text('CG'),
                        )),
                    const Center(child: Text('Address Content')),
                    const Center(child: Icon(Icons.shopping_cart)),
                  ],
                );
              }
            }),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Obx(() => 
                    ListTile(
                    title: const Text("TOTAL",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        )),
                    trailing: Text(mealController.mealCartAsMap.isEmpty ? "\$0" : "\$${mealController.total}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                  )
                  ),
                  const Divider(
                      height: 1, color: Color.fromRGBO(238, 238, 238, 1)),
                  Obx(() => 
                    ListTile(
                    title: const Text("TOTAL",
                        style: TextStyle(
                          color: Color.fromRGBO(8, 172, 169, 1),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        )),
                    trailing: Text(mealController.mealCartAsMap.isEmpty ? "\$0" : "\$${mealController.total}",
                        style: const TextStyle(
                            color: Color.fromRGBO(8, 172, 169, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w900)),
                  )
                  ),
                  SizedBox(
                    width: 250,
                    child: DefaultButton(
                      isIconInSameLine: true,
                      text: "EMPTY CART",
                      textFontsize: 12,
                      backgroundColor: Colors.red,
                      iconButton: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      press: () {
                        mealController.clearAllProducts();
                      },
                      buttonHeight: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: DefaultButton(
                          text: "ADD NOTE",
                          textFontsize: 12,
                          isIconInSameLine: false,
                          backgroundColor: const Color.fromRGBO(76, 76, 76, 1),
                          iconButton: const Icon(
                            Icons.speaker_notes,
                            color: Colors.white,
                          ),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: DefaultButton(
                          text: "ADD FEE OR DISCOUNT",
                          textFontsize: 12,
                          isIconInSameLine: false,
                          backgroundColor: const Color.fromRGBO(8, 172, 169, 1),
                          iconButton: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: DefaultButton(
                          text: "APPLY COUPON",
                          textFontsize: 12,
                          isIconInSameLine: false,
                          backgroundColor: const Color.fromRGBO(8, 172, 169, 1),
                          iconButton: const Icon(
                            Icons.card_giftcard,
                            color: Colors.white,
                          ),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: DefaultButton(
                          text: "SHIPPING",
                          textFontsize: 12,
                          isIconInSameLine: false,
                          backgroundColor: const Color.fromRGBO(8, 172, 169, 1),
                          iconButton: const Icon(
                            Icons.local_shipping,
                            color: Colors.white,
                          ),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: DefaultButton(
                          text: "SUSPEND & SAVE CART",
                          textFontsize: 12,
                          isIconInSameLine: false,
                          backgroundColor:
                              const Color.fromRGBO(223, 152, 27, 1),
                          iconButton: const Icon(
                            Icons.remove_shopping_cart,
                            color: Colors.white,
                          ),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: DefaultButton(
                          text: "PAY",
                          textFontsize: 30,
                          isIconInSameLine: true,
                          backgroundColor:
                              const Color.fromRGBO(159, 166, 16, 1),
                          buttonHeight: 100,
                          press: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
