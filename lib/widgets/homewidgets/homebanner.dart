import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/main.dart';
import 'package:webcastle/model/homescreenmodel.dart' as model;

import '../../core/color.dart';

class Homebanner extends StatelessWidget {
  const Homebanner({super.key, required this.images});

  final List<model.Banner>? images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: MyApp.w * .8,
        height: MyApp.h * 0.15,
      ),
      items: images?.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: MyApp.w*.9,
              height: MyApp.h * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MyApp.h * .01),
                child: CachedNetworkImage(
                  imageUrl: i.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child:  Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}