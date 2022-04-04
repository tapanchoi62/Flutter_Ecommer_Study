import 'package:app_ecommer/utils/color.dart';
import 'package:app_ecommer/widgets/big_text.dart';
import 'package:app_ecommer/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_and_icon.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.red,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int position) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: position.isEven ? Color(0xFF69c5df) : Color(0xff6d0dc1),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("asset/image/food0.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFFFFFFF),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) =>
                                Icon(Icons.star, color: AppColors.mainColor)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: 20,
                      ),
                      SmallText(text: "1287 comment"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAndIcon(
                          icon: Icons.circle,
                          text: "Normal",
                          color: AppColors.textColor,
                          iconColor: AppColors.iconColor1),
                      SizedBox(
                        width: 30,
                      ),
                      TextAndIcon(
                          icon: Icons.location_on,
                          text: "1.7km",
                          color: AppColors.textColor,
                          iconColor: AppColors.iconColor2),
                      SizedBox(
                        width: 30,
                      ),
                      TextAndIcon(
                        icon: Icons.access_time,
                        text: "3322222min",
                        color: AppColors.textColor,
                        iconColor: Color.fromARGB(255, 78, 19, 217),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
