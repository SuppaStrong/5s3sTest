// import 'package:flutter/material.dart';

// void main() => runApp(const HomePage());

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late TabController _tabController1;
//   late TabController _tabController2;

//   @override
//   void initState() {
//     super.initState();
//     _tabController1 = TabController(length: 5, vsync: this);
//     _tabController2 = TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController1.dispose();
//     _tabController2.dispose(); // Dispose both tab controllers
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: yourAppBar(),
//       body: Row(
//         children: [
//           Expanded(
//             child: buildLeftSection(),
//           ),
//           Expanded(
//             child: buildRightSection(),
//           ),
//         ],
//       ),
//     );
//   }

//   // ...

//   Widget buildLeftSection() {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.5,
//       child: Column(
//         children: [
//           // ... Left section content ...
//         ],
//       ),
//     );
//   }

//   Widget buildRightSection() {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.5,
//       color: const Color.fromRGBO(238, 238, 238, 1),
//       child: Stack(
//         children: [
//           // ... Right section content ...
//         ],
//       ),
//     );
//   }

//   // ...
// }

// // ...

// Widget yourAppBar() {
//   // ... Your AppBar code ...
// }

// // ...

// Widget buildGridView(String tabName) {
//   return GridView.builder(
//     // ... GridView builder code ...
//   );
// }

// class ImageCard extends StatelessWidget {
//   // ... ImageCard class code ...
// }



// Import necessary packages

// class MyHomePage extends StatefulWidget {
//   // ...

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   late TabController _tabController1;
//   late TabController _tabController2;
//   List<Meal> meals = [];

//   @override
//   void initState() {
//     super.initState();
//     _tabController1 = TabController(length: 5, vsync: this);
//     _tabController2 = TabController(length: 4, vsync: this);
//     fetchMealData();
//   }

//   // ...

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: yourAppBar(style),
//       body: buildBody(),
//     );
//   }

//   AppBar yourAppBar(ButtonStyle style) {
//     // ...

//     return AppBar(
//       // ...
//     );
//   }

//   Widget buildBody() {
//     return Row(
//       children: [
//         // ...
//         buildLeftColumn(),
//         const Divider(
//           height: 2,
//           color: Color.fromRGBO(233, 233, 233, 1),
//         ),
//         // ...
//         buildRightColumn(),
//       ],
//     );
//   }

//   Widget buildLeftColumn() {
//     return Container(
//       // ...
//       child: Column(
//         children: [
//           // ...
//           buildTabBar(),
//           Expanded(
//             child: SizedBox(
//               width: double.maxFinite,
//               height: 1000,
//               child: TabBarView(
//                 controller: _tabController1,
//                 children: [
//                   Text(meals[1].id),
//                   buildGridView("All"),
//                   buildGridView("On Sale"),
//                   buildGridView("Featured"),
//                   buildGridView("Add Product"),
//                   buildGridView("Scan Product"),
//                 ],
//               ),
//             ),
//           ),
//           // ...
//         ],
//       ),
//     );
//   }

//   // ...
// }


////
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'model/meal_model.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MealGridExample(),
//     );
//   }
// }

// class MealGridExample extends StatefulWidget {
//   @override
//   _MealGridExampleState createState() => _MealGridExampleState();
// }

// class _MealGridExampleState extends State<MealGridExample> {
//   List<Meal> meals = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse(
//         'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood'));

//     if (response.statusCode == 200) {
//       print(response.body);
//       final data = json.decode(response.body);
//       final List<dynamic> mealList = data['meals'];

//       // Create Meal objects from the response
//       meals = mealList.map((item) => Meal.fromJson(item)).toList();

//       setState(() {});
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meal Grid Example'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: meals.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(meals[index].imageUrl),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(meals[index].name),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
