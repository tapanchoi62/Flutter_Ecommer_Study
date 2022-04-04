import 'package:app_ecommer/home/food_page_body.dart';
import 'package:app_ecommer/utils/color.dart';
import 'package:app_ecommer/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../widgets/big_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key, required String title}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bangladeshs", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Nasingdi"),
                        Icon(Icons.arrow_drop_down_outlined)
                      ],
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          FoodPageBody()
        ],
      ),
    );
  }
}
