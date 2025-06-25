import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/color.dart';
import '../main.dart';

class screenappbar extends StatelessWidget {
  const screenappbar({super.key,required this.notifcount});

  final int notifcount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyApp.w * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Welcome, ",
                  style: TextStyle(
                      color: ColorState.textblackcolor,
                      fontSize: MyApp.h * .02)),
              TextSpan(
                  text: "James !",
                  style: TextStyle(color: ColorState.textblackcolor,
                      fontSize: MyApp.h * .03,fontWeight: FontWeight.bold)),
            ]),
          ),
          Badge(
              label: Text("$notifcount"),
              child: SvgPicture.asset("assets/svg_img/notificationicn.svg"))
        ],
      ),
    );
  }
}
