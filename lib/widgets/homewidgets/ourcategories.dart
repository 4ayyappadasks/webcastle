import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/model/homescreenmodel.dart' as model;

class Ourcategories extends StatelessWidget {
  Ourcategories({super.key, required this.categories});

  final List<model.Brand>? categories;
  final List<Color> randomcolor = [
    Color(0xFFFCF4C4),
    Color(0xFFEBE8FB),
    Color(0xFFFFDCDB),
    Color(0xFFEFFFE4),
  ];

  @override
  Widget build(BuildContext context) {
    print("categories: ${categories}");
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
                "Our Categories",
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
          height: MyApp.h * .28,
          child: GridView.builder(
            padding: EdgeInsets.only(left: MyApp.w * .05),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MyApp.w * 0.04,
              mainAxisSpacing: MyApp.h * 0.04,
              childAspectRatio: MyApp.h * 0.0018,
            ),
            itemCount: (categories?.length ?? 0) < 8 ? 8 : categories!.length,
            itemBuilder: (context, index) {
              if (index < (categories?.length ?? 0)) {
                final category = categories![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MyApp.h * .09,
                      height: MyApp.h * .09,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: randomcolor[index % randomcolor.length],
                      ),
                      child: Center(
                        child: SizedBox(
                          height: MyApp.h * .05,
                          width: MyApp.h * .05,
                          child: CachedNetworkImage(
                            imageUrl: category.image ?? '',
                            fit: BoxFit.contain,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator(strokeWidth: 2)),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MyApp.h * .008),
                    SizedBox(
                      width: MyApp.w * .15,
                      child: Text(
                        category.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MyApp.h * .09,
                      height: MyApp.h * .09,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: randomcolor[index % randomcolor.length],
                      ),
                    ),
                    SizedBox(height: MyApp.h * .008),
                    SizedBox(
                      width: MyApp.w * .15,
                      child: Text(
                        "loading",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
