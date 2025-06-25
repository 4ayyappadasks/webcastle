import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/model/homescreenmodel.dart' as model;

class Bannergrid extends StatelessWidget {
  const Bannergrid({super.key, required this.bannerdata});

  final List<model.Banner>? bannerdata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MyApp.h * .35,
        child: ListView.builder(
          padding: EdgeInsets.only(left: MyApp.w*.05),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: bannerdata?.length ?? 0,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: MyApp.w * .02),
            child: Container(
              width: MyApp.w * .45,
              height: MyApp.h * .35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MyApp.h * .01)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(MyApp.h * .01),
                    child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                        errorWidget: (context, url, error) => Center(
                              child:  Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),
                            ),
                        imageUrl: "${bannerdata?[index].image}"),
                  ),
                  Positioned(
                    bottom: MyApp.h*.025,
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                          color: ColorState.textwhitecolor,
                          fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorState.textwhitecolor,
                      decorationThickness: MyApp.h*.003),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
