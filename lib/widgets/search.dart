import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/core/color.dart';

import '../main.dart';

class Search_widget extends StatelessWidget {
  const Search_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyApp.w * .05),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                cursorColor: ColorState.textblackcolor,
            decoration: InputDecoration(prefixIcon: Icon(Icons.search,color: ColorState.textfieldgraycolor,),
              hintText: "Search..",
              hintStyle: TextStyle(
                color:  ColorState.textfieldgraycolor
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorState.textfieldgraycolor),
                  borderRadius: BorderRadius.circular(MyApp.h * .05)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorState.textfieldgraycolor),
                  borderRadius: BorderRadius.circular(MyApp.h * .05)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorState.textfieldgraycolor),
                  borderRadius: BorderRadius.circular(MyApp.h * .05)),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: MyApp.w * .05, vertical: 0),
            ),
          )),
          SizedBox(
            width: MyApp.w * .02,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorState.buttoncolorcolor),
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Scan Here",
                    style: TextStyle(color: ColorState.textwhitecolor),
                  ),
                  SizedBox(
                    width: MyApp.w * .01,
                  ),
                  Icon(
                    CupertinoIcons.barcode,
                    color: ColorState.textwhitecolor,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
