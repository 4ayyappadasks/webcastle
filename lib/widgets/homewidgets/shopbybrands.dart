import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/model/homescreenmodel.dart' as model;

class Shopbybrands extends StatelessWidget {
  const Shopbybrands({super.key, required this.brandsimg});

  final List<model.Brand>? brandsimg;

  @override
  Widget build(BuildContext context) {
    print("brandsimg: ${brandsimg}");
    return Column(
      children: [
        SizedBox(
          height: MyApp.h * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyApp.w * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shop By Brands",
                style: TextStyle(
                    color: ColorState.textblackcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: MyApp.h * .025),
              ),
              Text(
                "View All",
                style: TextStyle(
                    color: ColorState.textblackcolor,
                    decoration: TextDecoration.underline,
                    fontSize: MyApp.h * .02),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MyApp.h * .02,
        ),
        SizedBox(
          height: MyApp.h * .14,
          child: ListView.builder(
            padding: EdgeInsets.only(left: MyApp.w * .05),
            itemCount: brandsimg?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: MyApp.h * .2,
              height: MyApp.h * .14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MyApp.h*.02),
                border: Border.all(color: ColorState.textfieldgraycolor)
              ),
              margin: EdgeInsets.symmetric(horizontal: MyApp.w * .015),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MyApp.h * .02),
                child: CachedNetworkImage(
                  imageUrl: "${brandsimg?[index].image}",
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child:  Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),),
                ),
              ),
            ),
          )
        )
      ],
    );
  }
}
