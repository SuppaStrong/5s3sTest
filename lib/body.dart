import 'package:flutter/material.dart';
import 'package:team_5s3s/build_left_body.dart';
import 'package:team_5s3s/model/meal_model.dart';
import 'build_right_body.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required TabController tabController1,
    required this.meals,
    required TabController tabController2,
  })  : _tabController1 = tabController1,
        _tabController2 = tabController2;

  final TabController _tabController1;
  final TabController _tabController2;
  final List<MealModel> meals;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildLeftBody(tabController1: _tabController1, meals: meals),
        const Divider(
          height: 2,
          color: Color.fromRGBO(233, 233, 233, 1),
        ),
        BuildRightBody(tabController2: _tabController2, meals: meals),
      ],
    );
  }
}
