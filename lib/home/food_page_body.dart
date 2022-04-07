import 'package:app_ecommer/utils/color.dart';
import 'package:app_ecommer/widgets/big_text.dart';
import 'package:app_ecommer/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_and_icon.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentValue = 0.0;
  double scaleFactor = 0.8;
  double heightScale = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentValue = pageController.page!;
        print("Current value " + currentValue.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          color: Colors.white,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: currentValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int position) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (position == currentValue.floor()) {
      var currScale = 1 - (currentValue - position) * (1 - scaleFactor);
      var tranScale = heightScale * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, tranScale, 0);
    } else if (position == currentValue.floor() + 1) {
      var currScale =
          scaleFactor + (currentValue - position + 1) * (1 - scaleFactor);
      var tranScale = heightScale * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, tranScale, 0);
    } else if (position == currentValue.floor() - 1) {
      var currScale = 1 - (currentValue - position) * (1 - scaleFactor);
      var tranScale = heightScale * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, tranScale, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 20, right: 20),
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
              margin: EdgeInsets.only(left: 35, right: 35, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 5)),
                ],
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
                        TextAndIcon(
                            icon: Icons.location_on,
                            text: "1.7km",
                            color: AppColors.textColor,
                            iconColor: AppColors.iconColor2),
                        TextAndIcon(
                          icon: Icons.access_time,
                          text: "333min",
                          color: AppColors.textColor,
                          iconColor: Color.fromARGB(255, 78, 19, 217),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
