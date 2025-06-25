import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webcastle/core/color.dart';
import 'package:webcastle/main.dart';

class Rqfandbanner extends StatelessWidget {
  Rqfandbanner({super.key, required this.image,this.isrfq});

  final String image;
  bool?isrfq = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MyApp.w * .05, vertical: MyApp.h * .02),
      child: SizedBox(
        width: MyApp.w,
        height: MyApp.h * .2,
        child: Stack(
          children: [
            Container(
              width: MyApp.w,
              height: MyApp.h * .2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorState.textfieldgraycolor
                ),
                  borderRadius: BorderRadius.circular(MyApp.h * .01)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(MyApp.h * .01),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.hide_image, color: ColorState.textfieldgraycolor),
                ),
              ),
            ),
            isrfq==true
                ?Padding(
              padding:EdgeInsets.symmetric(horizontal: MyApp.w*.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Request for quote",
                    style: TextStyle(
                        color: ColorState.textblackcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: MyApp.h * .03),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorState.textwhitecolor),
                      onPressed: () {},
                      child: Text(
                        "Create RFQ",
                        style: TextStyle(color: ColorState.textblackcolor),
                      ))
                ],
              ),
            )
                :SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
