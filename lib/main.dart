import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:team_5s3s/app_bar.dart';
import 'package:team_5s3s/binding/main_binding.dart';
import 'package:team_5s3s/body.dart';
import 'model/meal_model.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController1;
  late TabController _tabController2;
  List<MealModel> meals = [];

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 5, vsync: this);
    _tabController2 = TabController(length: 4, vsync: this);
    fetchMealData();
  }

  @override
  void dispose() {
    _tabController1.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  Future<void> fetchMealData() async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("SUCCESS !!!");
      final data = json.decode(response.body);
      final List<dynamic> mealList = data['categories'];
      meals = mealList.map((item) => MealModel.fromJson(item)).toList();

      setState(() {
        
      });
    } else {
      // ignore: avoid_print
      print('ERROR !!! Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      //body: Center(
      //   child: meals.isNotEmpty && meals.length >= 2
      //       ? Text(meals[1].id)
      //       : const Text('No meals available'),
      // ),
      appBar: BuildAppBar(style: style),
      body: BuildBody(
        tabController1: _tabController1,
        tabController2: _tabController2,
        meals: meals,
      ),
    );
  }

  //test

//   Widget _tabWithSpace() {
//     return Container(
//       height: 50 + MediaQuery.of(context).padding.bottom,
//       padding: const EdgeInsets.all(0),
//       width: double.infinity,
//       decoration: const BoxDecoration(
//           border: Border(
//               right: BorderSide(
//                   color: Colors.white, width: 1, style: BorderStyle.solid))),
//       child: const Tab(
//         text: "test",
//       ),
//     );
//   }
}
